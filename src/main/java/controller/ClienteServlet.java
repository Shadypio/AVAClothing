package controller;

import model.cliente.Cliente;
import model.cliente.ClienteDAO;
import model.ordine.Ordine;
import model.ordine.OrdineDAO;
import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;
import model.prodottoordine.ProdottoOrdine;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ClienteServlet", value = "/cliente/*")
public class ClienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String address=getServletContext().getContextPath();
        ClienteDAO cliDAO=new ClienteDAO();
        OrdineDAO ordDAO=new OrdineDAO();
        ProdottoDAO proDAO=new ProdottoDAO();
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path){
            case "/acquistacarrello":
                //Ordine ord=new Ordine();  NEL CASO FAI ANCHE IDORDINE
                break;
            case "/product":
                int id=Integer.parseInt(request.getParameter("id"));
                Prodotto pro=proDAO.doRetrieveById(id);
                session.setAttribute("prodotto",pro);
                request.getRequestDispatcher("/WEB-INF/views/site/singleproduct.jsp").forward(request, response);
                break;
            case "/inputcarrello":
                Boolean b=(Boolean)session.getAttribute("log"); // DA SESSIONE PRENDO LOGGATO
                ArrayList<Prodotto> cart;
                if (b==null){ //CONTROLLO SE PRIMA VOLTA
                    b=false;
                    session.setAttribute("log",b);
                }
                if (!b) { //CONTROLLO SE NON LOGGATO
                    request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request, response);
                }else { //SE LOGGATO PRENDO tutto
                    ArrayList<ProdottoOrdine> elenco=(ArrayList<ProdottoOrdine>) session.getAttribute("elencocart");
                    ProdottoOrdine po=new ProdottoOrdine();
                    if (elenco==null)
                        elenco=new ArrayList<>();

                    id=Integer.parseInt(request.getParameter("id"));
                    int selezionati=Integer.parseInt(request.getParameter("selected"));
                    session.setAttribute("selezionati",selezionati);

                    pro = proDAO.doRetrieveById(id);//RECUPERO PRODOTTO
                    pro.setQuantita(pro.getQuantita()-selezionati);//DIMINUISCO I SELEZIONATI
                   // proDAO.doChanges(pro);

                    boolean add=false;
                    for(int i=0; i<elenco.size(); i++){
                        if (elenco.get(i).getProdotto().getIdProdotto()==id){
                            int temp=elenco.get(i).getQuantita();
                            int somma=temp+selezionati;
                            elenco.get(i).setQuantita(somma);
                            add=true;
                        }
                    }
                    if (!add) {
                        po.setProdotto(pro); //setto ProdottoOrdine
                        po.setQuantita(selezionati);
                        elenco.add(po); // aggiungo ad Elenco
                    }
                    session.setAttribute("elencocart",elenco);

                    cart = (ArrayList<Prodotto>) session.getAttribute("cart");
                    if (cart == null)  //SE PRIMA VOLTA DICHIARO
                        cart = new ArrayList<>();

                    if(!add) {
                        cart.add(pro); //aggiungo a cart il prodotto se non c'è gia
                        session.setAttribute("cart", cart);
                    }
                    double totale=0;
                    for(int i=0; i<cart.size(); i++){
                        double temp=cart.get(i).getPrezzo();
                        long idPro=cart.get(i).getIdProdotto();
                        if (elenco.get(i).getProdotto().getIdProdotto()==idPro){
                                int quantita=elenco.get(i).getQuantita();
                                totale+=(quantita*temp);
                        }
                    }  // calcolo totale carrello mando in sessione
                    session.setAttribute("totale",totale);

                    response.sendRedirect(address+"/cliente/carrello");
                }
                break;
            case "/carrello":
                b=(Boolean) session.getAttribute("log"); // DA SESSIONE PRENDO LOGGATO
                if (b==null){ //CONTROLLO SE PRIMA VOLTA
                    b=false;
                    session.setAttribute("log",b);
                }
                if (b) { //CONTROLLO SE LOGGATO E SE IL CART ESISTE SENO ISTANZIO
                    cart = (ArrayList<Prodotto>) session.getAttribute("cart");
                    if (cart != null)
                        request.getRequestDispatcher("/WEB-INF/views/site/cart.jsp").forward(request, response);
                    else {
                        cart=new ArrayList<>();
                        session.setAttribute("cart",cart);
                        ArrayList<ProdottoOrdine> elenco=(ArrayList<ProdottoOrdine>) session.getAttribute("elencocart");
                        if (elenco==null)
                            elenco=new ArrayList<>();

                        session.setAttribute("elencocart",elenco);
                        request.getRequestDispatcher("/WEB-INF/views/site/cart.jsp").forward(request, response);
                    }
                }else // ALTRIMENTI DEVE LOGGARE
                    request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request,response);
                break;
            case "/signup":
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            case "/show": // mostra profilo
                b=(Boolean) session.getAttribute("log");
                if (b)
                    request.getRequestDispatcher("/WEB-INF/views/site/account.jsp").forward(request,response);
                else
                    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita" );
                break;
            case "/create": // // registrazione cliente
                String nomeCust = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String user = request.getParameter("username");
                String mail = request.getParameter("email");
                String indirizzo = request.getParameter("indirizzo");
                String tel = request.getParameter("telefono");
                String newPass = request.getParameter("password");
                id=cliDAO.doRetrieveAll().size()+1;
                Cliente newProfilo=new Cliente(cognome,nomeCust,mail,user,newPass,indirizzo,tel,id,false);
                cliDAO.addCliente(newProfilo);
                response.sendRedirect(address+"/index.jsp");
                break;
            case "/update": // aggiornamento delle info degli account
                nomeCust = request.getParameter("nome");
                cognome = request.getParameter("cognome");
                user = request.getParameter("username");
                mail = request.getParameter("email");
                indirizzo = request.getParameter("indirizzo");
                tel = request.getParameter("telefono");
                String idCliente = request.getParameter("id");
                int idIntero = Integer.parseInt(idCliente);
                newPass = request.getParameter("password");
                cliDAO = new ClienteDAO();
                Cliente oldProfilo= cliDAO.doRetrieveById(idIntero);
                newProfilo =new Cliente(cognome,nomeCust,mail,user,newPass,indirizzo,tel,idIntero,true);
                if (oldProfilo.getPassword().equals(newPass))
                    cliDAO.doChanges(newProfilo);
                else
                    cliDAO.doChangesWithPass(newProfilo);
                response.sendRedirect(address+"/cliente/signin");
                break;
            case "/logout":
                session.setAttribute("log",false);
                session.invalidate();
                response.sendRedirect(address+"/cliente/signin");
                break;
            case "/secret": // login admin  (ricerca nel db)
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request,response);
                break;
            case "/signin": // login cliente (ricerca nel db)
                mail = request.getParameter("email");
                newPass = request.getParameter("password");
                Cliente c=cliDAO.doRetrieveClienteByEmailPassword(mail,newPass);
                if (c!=null){
                    ArrayList<Ordine> listaOrd=ordDAO.doRetrieveByIdCliente(c.getIdCliente());
                    session.setAttribute("listaOrd",listaOrd);
                    session.setAttribute("profilo", c);
                    session.setAttribute("log",true);
                    request.getRequestDispatcher("/WEB-INF/views/site/account.jsp").forward(request,response);
                }else{
                    session.setAttribute("failed",true);
                    request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request,response);
                }
                break;

            default: // diverso da doGet perchè non chiede una risorsa ma un cambiamento nel server non consentito
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita" );

        }
    }
}
