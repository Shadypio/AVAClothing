package controller;

import model.categoria.Categoria;
import model.categoria.CategoriaDAO;
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
        //String genere;
        ProdottoDAO proDAO=new ProdottoDAO();
        CategoriaDAO catDAO= new CategoriaDAO();
        String path=(request.getPathInfo() != null) ? request.getPathInfo(): "/";
        switch (path) {
            case "/prodottouomo":
                ArrayList<Categoria> listaGenere=catDAO.doRetrieveByGenere("uomo");
                ArrayList<Prodotto> result= new ArrayList<>();
                for(int i=0; i<listaGenere.size(); i++) {
                    ArrayList<Prodotto> temp = proDAO.doRetrieveProdottiWithCategoria(listaGenere.get(i).getIdCategoria());
                    for(int j=0; j<temp.size(); j++)
                        result.add(temp.get(j));
                }
                session.setAttribute("prodotti",result);
                session.setAttribute("listaCat",listaGenere);
                request.getRequestDispatcher("/WEB-INF/views/site/uomo.jsp").forward(request, response);
                break;
            case "/prodottodonna":
                catDAO=new CategoriaDAO();
                listaGenere=catDAO.doRetrieveByGenere("donna");
                result= new ArrayList<>();
                for(int i=0; i<listaGenere.size(); i++) {
                    ArrayList<Prodotto> temp = proDAO.doRetrieveProdottiWithCategoria(listaGenere.get(i).getIdCategoria());
                    for(int j=0; j<temp.size(); j++)
                        result.add(temp.get(j));
                }
                session.setAttribute("prodotti",result);
                session.setAttribute("listaCat",listaGenere);
                request.getRequestDispatcher("/WEB-INF/views/site/donna.jsp").forward(request, response);
                break;
            case "/selezione":
                int id=Integer.parseInt(request.getParameter("id"));
                ArrayList<Prodotto> lista=proDAO.doRetrieveProdottiWithCategoria(id);
                session.setAttribute("prodotti",lista);
                request.getRequestDispatcher("/WEB-INF/views/site/showproducts.jsp").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Operazione non consentita");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
