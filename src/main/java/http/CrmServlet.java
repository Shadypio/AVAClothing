package http;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CrmServlet", value = "/crm/*")
public class CrmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String path = getPath(request);
        String path = "";
        switch (path){
            case "/dashboard":
                request.getRequestDispatcher("/WEB-INF/views/crm/accounts.jsp").forward(request,response);
                break;
            case "/signin": //login cliente (pagina)
                request.getRequestDispatcher("/WEB-INF/views/site/signin.jsp").forward(request,response);
                break;
            case "/create": //pagina per creare account cliente
                request.getRequestDispatcher("/WEB-INF/views/crm/account.jsp").forward(request,response);
                break;
            case "/show": // pagina per vedere singoli dettagli cliente
                request.getRequestDispatcher("/WEB-INF/views/crm/account.jsp").forward(request,response);
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
}
