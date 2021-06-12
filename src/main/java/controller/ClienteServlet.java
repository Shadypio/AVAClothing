package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ClienteServlet", value = "/cliente/*")
public class ClienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path){
            case "/": // account list admin
                request.getRequestDispatcher("/WEB-INF/views/crm/accounts.jsp").forward(request,response);
                break;
            case "/signin": //login cliente (pagina)
                request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request,response);
                break;
            case "/create": //pagina per creare account cliente
                request.getRequestDispatcher("/WEB-INF/views/crm/account.jsp").forward(request,response);
                break;
            case "/show": // pagina per vedere singoli dettagli cliente
                request.getRequestDispatcher("/WEB-INF/views/crm/customer.jsp").forward(request,response);
                break;
            case "/secret": // login del admin (pagina)
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request,response);
                break;
            case "/signup": // pagina di registrazione form (pagina)
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            default: // tutto cio che non è mappato è tutto 404
                response.sendError(HttpServletResponse.SC_NOT_FOUND,"Risorsa non trovata");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path){
            case "/create": // con Post perche a partire dai dati che mi hai inviato creami cliente
                request.getRequestDispatcher("/WEB-INF/views/crm/account.jsp").forward(request,response);
                break;
            case "/update": // aggiornamento delle info degli account
                request.getRequestDispatcher("/WEB-INF/views/site/update.jsp").forward(request,response);
                break;
            case "/logout":
                request.getRequestDispatcher("/WEB-INF/views/site/logout.jsp").forward(request,response);
                break;
            case "/secret": // login admin  (ricerca nel db)
                request.getRequestDispatcher("/WEB-INF/views/crm/secret.jsp").forward(request,response);
                break;
            case "/signin": // login cliente (ricerca nel db)
                request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request,response);
                break;
            case "/signup": // registrazione cliente
                request.getRequestDispatcher("/WEB-INF/views/site/signup.jsp").forward(request,response);
                break;
            default: // diverso da doGet perchè non chiede una risorsa ma un cambiamento nel server non consentito
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita" );

        }
    }
}
