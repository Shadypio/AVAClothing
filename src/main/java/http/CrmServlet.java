package http;

import model.categoria.Categoria;
import model.categoria.CategoriaDAO;
import model.cliente.Cliente;
import model.cliente.ClienteDAO;
import model.ordine.Ordine;
import model.ordine.OrdineDAO;
import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;
import org.jetbrains.annotations.NotNull;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.concurrent.Flow;
import static javax.swing.JOptionPane.showMessageDialog;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path){
            case "/dashboard":
                String email=(String)request.getParameter("email");
                String pass=(String)request.getParameter("password");
                ClienteDAO cliDAO=new ClienteDAO();
                Cliente c=cliDAO.doRetrieveClienteByEmailPassword(email,pass);
                if (c!=null) {
                    if (c.isAdmin()) {
                        OrdineDAO ordDAO=new OrdineDAO();
                        ArrayList<Ordine> ord=ordDAO.doRetrieveAll();
                        request.setAttribute("numeroOrdini",ord.size());
                        CategoriaDAO catDAO=new CategoriaDAO();
                        ArrayList<Categoria> cat=catDAO.doRetrieveAll();
                        request.setAttribute("numeroCategorie",cat.size());
                        ArrayList<Cliente> cli= cliDAO.doRetrieveAll();
                        request.setAttribute("numeroClienti",cli.size());
                        ProdottoDAO proDAO=new ProdottoDAO();
                        ArrayList<Prodotto> pro= proDAO.doRetrieveAll();
                        request.setAttribute("numeroProdotti",pro.size());
                        request.getRequestDispatcher("/WEB-INF/views/crm/dashboard.jsp").forward(request, response);
                    }
                }else
                    response.sendRedirect(request.getContextPath()+"/cliente/secret");
                    //alert da aggiungere
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Risorsa non trovata");
        }
    }


}
