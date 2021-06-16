package controller;

import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProdottoServlet", value = "/prodotto/*")
public class ProdottoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String genere;
        ProdottoDAO proDAO;
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path) {
            case "/tshirt":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(1);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(7);
                    session.setAttribute("prodotti",lista);
                }
                break;
            case "/pantaloni":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(2);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(8);
                    session.setAttribute("prodotti",lista);
                }
                break;
            case "/felpe":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(5);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(11);
                    session.setAttribute("prodotti",lista);
                }
                break;
            case "/accessori":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(4);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(10);
                    session.setAttribute("prodotti",lista);
                }
                break;
            case "/camicie":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(6);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(12);
                    session.setAttribute("prodotti",lista);
                }
                break;
            case "/scarpe":
                genere= (String) session.getAttribute( "genere");
                proDAO=new ProdottoDAO();
                if (genere.equalsIgnoreCase("uomo")) {
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(3);
                    session.setAttribute("prodotti",lista);
                }else{
                    ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(9);
                    session.setAttribute("prodotti",lista);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita");
        }
        request.getRequestDispatcher("/WEB-INF/views/site/showproducts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
