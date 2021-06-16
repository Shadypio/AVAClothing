package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProdottoServlet", value = "/prodotto/*")
public class ProdottoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path) {
            case "/uomo":
                request.getRequestDispatcher("/WEB-INF/views/site/uomo.jsp").forward(request, response);
                break;
            case "/donna":
                request.getRequestDispatcher("/WEB-INF/views/site/donna.jsp").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
