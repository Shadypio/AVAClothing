package http;

import model.categoria.Categoria;
import model.categoria.CategoriaDAO;
import model.cliente.Cliente;
import model.cliente.ClienteDAO;
import model.magazzino.Magazzino;
import model.ordine.Ordine;
import model.ordine.OrdineDAO;
import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        ProdottoDAO proDAO=new ProdottoDAO();
        ClienteDAO cliDAO=new ClienteDAO();
        CategoriaDAO catDAO=new CategoriaDAO();
        OrdineDAO ordDAO=new OrdineDAO();
        String address=getServletContext().getContextPath();

        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path) {
            case "/addpro":
                String nomePro=request.getParameter("nome");
                String prezzo=request.getParameter("prezzo");
                double price=Double.parseDouble(prezzo);
                String descB=request.getParameter("descBreve");
                String descD=request.getParameter("descDett");
                String inOff=request.getParameter("offerta");
                boolean off=false;
                if (inOff.equals("true"))
                    off=true;
                String quan=request.getParameter("quantita");
                String Mag=request.getParameter("idMag");
                String Cat=request.getParameter("idCat");
                String Pro=request.getParameter("idPro");
                int idPro=Integer.parseInt(Pro);
                int idCat=Integer.parseInt(Cat);
                int idMag=Integer.parseInt(Mag);
                int quantita=Integer.parseInt(quan);
                Categoria cat=new Categoria();
                cat.setIdCategoria(idCat);
                Magazzino mag=new Magazzino();
                mag.setIdMagazzino(idMag);
                Prodotto p=new Prodotto(idPro,nomePro,price,off,descB,descD,quantita,mag,cat);
                proDAO.addProdotto(p,cat,mag);
                response.sendRedirect(address+"/crm/product");
                break;
            case "/addcust":
                String nomeCust = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String user = request.getParameter("username");
                String mail = request.getParameter("email");
                String indirizzo = request.getParameter("indirizzo");
                String tel = request.getParameter("tel");
                String newPass = request.getParameter("password");
                ArrayList<Cliente> cli=cliDAO.doRetrieveAll();
                int creaId =cli.size()+1;
                String admin=request.getParameter("admin");
                Boolean b=false;
                if (admin.equals("true"))
                    b=true;
                Cliente nuovo=new Cliente(cognome,nomeCust,mail,user,newPass,indirizzo,tel,creaId,b);
                cliDAO.addCliente(nuovo);
                response.sendRedirect(address+"/crm/customer");
                break;
            case "/addcat":
                String nomeCat=request.getParameter("nome");
                String desc=request.getParameter("descrizione");
                ArrayList<Categoria> listaCat=catDAO.doRetrieveAll();
                int idCate=listaCat.size()+1;
                Categoria x=new Categoria(nomeCat,desc,idCate);
                catDAO.addCategoria(x);
                response.sendRedirect(address+"/crm/category");
                break;
            case "/updatepro":
                nomePro = request.getParameter("nome");
                prezzo= request.getParameter("prezzo");
                descB= request.getParameter("descB");
                descD= request.getParameter("descD");
                inOff= request.getParameter("offerta");
                b=false;
                if (inOff.equals("true"))
                    b=true;
                String idProdotto=request.getParameter("selezioneMod");
                String idCategoria=request.getParameter("idCat");
                String idMagazzino=request.getParameter("idMag");
                quan=request.getParameter("quantita");
                price=Double.parseDouble(prezzo);
                quantita=Integer.parseInt(quan);
                idPro=Integer.parseInt(idProdotto);
                idCat=Integer.parseInt(idCategoria);
                cat=new Categoria();
                cat.setIdCategoria(idCat);
                idMag=Integer.parseInt(idMagazzino);
                mag=new Magazzino();
                mag.setIdMagazzino(idMag);
                Prodotto newProdotto=new Prodotto(idPro,nomePro,price,b,descB,descD,quantita,mag,cat);
                proDAO.doChanges(newProdotto);
                response.sendRedirect(address+"/crm/product");
                break;
            case "/updateord":
                String idOrdine=request.getParameter("ordSelezionato");
                int idOrd=Integer.parseInt(idOrdine);
                Ordine oldOrdine=ordDAO.doRetrieveById(idOrd);
                String iva=request.getParameter("iva");
                int ivaOrd=Integer.parseInt(iva);
                String data=request.getParameter("data");
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                df.setLenient (false);
                java.util.Date dataOrdine;
                Ordine newOrdine= new Ordine();
                try {
                    dataOrdine = df.parse (data);
                    java.sql.Date sqlDate = new java.sql.Date(dataOrdine.getTime());
                    newOrdine=new Ordine(ivaOrd, sqlDate,idOrd,oldOrdine.getCliente());
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                ordDAO.doChanges(newOrdine);
                response.sendRedirect(address+"/crm/order");
                break;
            case "/updatecat":
                idCategoria=request.getParameter("catSelezionata");
                idCat=Integer.parseInt(idCategoria);
                nomeCat=request.getParameter("nome");
                desc=request.getParameter("desc");
                cat=new Categoria(nomeCat,desc,idCat);
                catDAO.doChanges(cat);
                response.sendRedirect(address+"/crm/category");
                break;
            case "/updatecust":
                nomeCust = request.getParameter("nome");
                cognome = request.getParameter("cognome");
                user = request.getParameter("username");
                mail = request.getParameter("email");
                indirizzo = request.getParameter("indirizzo");
                tel = request.getParameter("telefono");
                String id = request.getParameter("idAdmin");
                int idIntero = Integer.parseInt(id);
                newPass = request.getParameter("password");
                cliDAO = new ClienteDAO();
                Cliente oldProfilo= cliDAO.doRetrieveById(idIntero);
                Cliente newProfilo =new Cliente(cognome,nomeCust,mail,user,newPass,indirizzo,tel,idIntero,true);
                if (oldProfilo.getPassword().equals(newPass))
                    cliDAO.doChanges(newProfilo);
                else
                    cliDAO.doChangesWithPass(newProfilo);
                response.sendRedirect(address+"/crm/profile");
                break;
            case "/deletepro":
                String idDelete=request.getParameter("selezioneDelete");
                int idDelPro=Integer.parseInt(idDelete);
                ProdottoDAO prodottoDAO=new ProdottoDAO();
                prodottoDAO.deleteById(idDelPro);
                response.sendRedirect(address+"/crm/product");
                break;
            case "/profile":
                cliDAO=new ClienteDAO();
                Cliente c=cliDAO.doRetrieveById((long) session.getAttribute("id"));
                session.setAttribute("profilo",c);
                request.getRequestDispatcher("/WEB-INF/views/crm/profile.jsp").forward(request, response);
                break;
            case "/customer":
                cliDAO= new ClienteDAO();
                cli=cliDAO.doRetrieveAll();
                session.setAttribute("listaCli",cli);
                request.getRequestDispatcher("/WEB-INF/views/crm/customer.jsp").forward(request, response);
                break;
            case "/category":
                catDAO=new CategoriaDAO();
                ArrayList<Categoria> cate=catDAO.doRetrieveAll();
                session.setAttribute("listaCat",cate);
                request.getRequestDispatcher("/WEB-INF/views/crm/categories.jsp").forward(request, response);
                break;
            case "/order":
                ArrayList<Ordine> ord=ordDAO.doRetrieveAll();
                session.setAttribute("listaOrd",ord);
                request.getRequestDispatcher("/WEB-INF/views/crm/orders.jsp").forward(request, response);
                break;
            case "/product":
                proDAO=new ProdottoDAO();
                ArrayList<Prodotto> pro=proDAO.doRetrieveAll();
                session.setAttribute("listaPro",pro);
                request.getRequestDispatcher("/WEB-INF/views/crm/products.jsp").forward(request, response);
                break;
            case "/logout":
                session.invalidate();
                response.sendRedirect(request.getContextPath()+"/cliente/secret");
                break;
            case "/dashboard":
                String email =null,pass= null;
                email=(String) session.getAttribute("email");
                pass=(String) session.getAttribute("pass");
                if (email==null && pass==null ) {
                    email = (String) request.getParameter("email");
                    pass = (String) request.getParameter("password");
                    session.setAttribute("email", email);
                    session.setAttribute("pass", pass);
                }
                cliDAO=new ClienteDAO();
                c=cliDAO.doRetrieveClienteByEmailPassword(email,pass);
                if (c!=null && c.isAdmin()) {
                        session.setAttribute("id",c.getIdCliente());
                        ordDAO=new OrdineDAO();
                        ord=ordDAO.doRetrieveAll();
                        request.setAttribute("numeroOrdini",ord.size());
                        catDAO=new CategoriaDAO();
                        cate=catDAO.doRetrieveAll();
                        request.setAttribute("numeroCategorie",cate.size());
                        cli= cliDAO.doRetrieveAll();
                        request.setAttribute("numeroClienti",cli.size());
                        proDAO=new ProdottoDAO();
                        pro= proDAO.doRetrieveAll();
                        request.setAttribute("numeroProdotti",pro.size());
                        request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                }else{
                    session.removeAttribute("email");
                    session.removeAttribute("pass");
                    session.removeAttribute("id");
                    response.sendRedirect(request.getContextPath() + "/cliente/secret");     //alert da aggiungere
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Risorsa non trovata");
        }
    }


}
