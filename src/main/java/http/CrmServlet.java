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
import java.io.IOException;
import java.util.ArrayList;

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
        switch (path){
            case "/profile":
                ClienteDAO cliDAO=new ClienteDAO();
                Cliente c=cliDAO.doRetrieveById((long) session.getAttribute("id"));
                request.setAttribute("profilo",c);
                request.getRequestDispatcher("/WEB-INF/views/crm/profile.jsp").forward(request, response);
                break;
            case "/customer":
                cliDAO= new ClienteDAO();
                ArrayList<Cliente> cli=cliDAO.doRetrieveAll();
                request.setAttribute("listaCli",cli);
                request.getRequestDispatcher("/WEB-INF/views/crm/customer.jsp").forward(request, response);
                break;
            case "/category":
                CategoriaDAO catDAO=new CategoriaDAO();
                ArrayList<Categoria> cat=catDAO.doRetrieveAll();
                request.setAttribute("listaCat",cat);
                request.getRequestDispatcher("/WEB-INF/views/crm/categories.jsp").forward(request, response);
                break;
            case "/order":
                OrdineDAO ordDAO=new OrdineDAO();
                ArrayList<Ordine> ord=ordDAO.doRetrieveAll();
                request.setAttribute("listaOrd",ord);
                request.getRequestDispatcher("/WEB-INF/views/crm/orders.jsp").forward(request, response);
                break;
            case "/product":
                ProdottoDAO proDAO=new ProdottoDAO();
                ArrayList<Prodotto> pro=proDAO.doRetrieveAll();
                request.setAttribute("listaPro",pro);
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
