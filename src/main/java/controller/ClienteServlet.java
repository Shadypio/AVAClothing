package controller;

import model.cliente.Cliente;
import model.cliente.ClienteDAO;
import model.ordine.Ordine;
import model.ordine.OrdineDAO;

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
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path){
            case "/create": // // registrazione cliente
                String nomeCust = request.getParameter("nome");
                String cognome = request.getParameter("cognome");
                String user = request.getParameter("username");
                String mail = request.getParameter("email");
                String indirizzo = request.getParameter("indirizzo");
                String tel = request.getParameter("telefono");
                String newPass = request.getParameter("password");
                int id=cliDAO.doRetrieveAll().size()+1;
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
                session.invalidate();
                response.sendRedirect(request.getContextPath()+"/cliente/signin");
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
