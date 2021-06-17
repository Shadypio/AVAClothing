package http;

import model.categoria.Categoria;
import model.categoria.CategoriaDAO;
import model.cliente.Cliente;
import model.cliente.ClienteDAO;
import model.ordine.Ordine;
import model.ordine.OrdineDAO;
import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;

import static javax.xml.crypto.dsig.DigestMethod.SHA1;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path) {
            case "/updatepro":
                break;
            case "/updateord":
                break;
            case "/updatecat":
                break;
            case "/updatecust":
                String nome = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String user = request.getParameter("username");
                String mail = request.getParameter("email");
                String indirizzo = request.getParameter("indirizzo");
                String tel = request.getParameter("telefono");
                String id = request.getParameter("idAdmin");
                int idIntero = Integer.parseInt(id);
                String newPass = request.getParameter("password");
                ClienteDAO cliDAO = new ClienteDAO();
                Cliente oldProfilo= cliDAO.doRetrieveById(idIntero);
                Cliente newProfilo =new Cliente(cognome,nome,mail,user,newPass,indirizzo,tel,idIntero,true);
                if (oldProfilo.getPassword().equals(newPass))
                    cliDAO.doChanges(newProfilo);
                else
                    cliDAO.doChangesWithPass(newProfilo);
                session.setAttribute("profilo",newProfilo);
                request.getRequestDispatcher("/WEB-INF/views/crm/profile.jsp").forward(request, response);
                break;
            case "/profile":
                cliDAO=new ClienteDAO();
                Cliente c=cliDAO.doRetrieveById((long) session.getAttribute("id"));
                session.setAttribute("profilo",c);
                request.getRequestDispatcher("/WEB-INF/views/crm/profile.jsp").forward(request, response);
                break;
            case "/customer":
                cliDAO= new ClienteDAO();
                ArrayList<Cliente> cli=cliDAO.doRetrieveAll();
                session.setAttribute("listaCli",cli);
                request.getRequestDispatcher("/WEB-INF/views/crm/customer.jsp").forward(request, response);
                break;
            case "/category":
                CategoriaDAO catDAO=new CategoriaDAO();
                ArrayList<Categoria> cat=catDAO.doRetrieveAll();
                session.setAttribute("listaCat",cat);
                request.getRequestDispatcher("/WEB-INF/views/crm/categories.jsp").forward(request, response);
                break;
            case "/order":
                OrdineDAO ordDAO=new OrdineDAO();
                ArrayList<Ordine> ord=ordDAO.doRetrieveAll();
                session.setAttribute("listaOrd",ord);
                request.getRequestDispatcher("/WEB-INF/views/crm/orders.jsp").forward(request, response);
                break;
            case "/product":
                ProdottoDAO proDAO=new ProdottoDAO();
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
                        cat=catDAO.doRetrieveAll();
                        request.setAttribute("numeroCategorie",cat.size());
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
