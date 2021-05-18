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
            case "/":
                break;
            case "/signin": //login cliente (pagina)
                break;
            case "/create": //pagina per creare account cliente
                break;
            case "/show": // pagina per vedere singoli dettagli cliente
                break;
            case "/secret": // login del admin (pagina)
                break;
            case "/signup": // pagina di registrazione form (pagina)
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
                break;
            case "/update": // aggiornamento delle info degli account
                break;
            case "/logout":
                break;
            case "/secret": // login admin  (ricerca nel db)
                break;
            case "/signin": // login cliente (ricerca nel db)
                break;
            case "/signup": // registrazione cliente
                break;
            default: // diverso da doGet perchè non chiede una risorsa ma un cambiamento nel server non consentito
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita" );

        }
    }
}
