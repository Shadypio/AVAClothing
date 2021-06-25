package controller;

import model.prodotto.Prodotto;
import model.prodotto.ProdottoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/JSON")
public class JSON extends HttpServlet {
    private static final long serialVersionUID= 1L;
    public JSON(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data=request.getParameter("data");
        ProdottoDAO proDAO=new ProdottoDAO();
        ArrayList<Prodotto> lista=proDAO.doRetrieveAll();
        ArrayList<Prodotto> result= new ArrayList<>();
        for(int i=0; i<lista.size(); i++){
            if (lista.get(i).getNome().contains(data))
                result.add(lista.get(i));
        }

        response.setContentType("text/plain;charset=UTF-8");
        response.getWriter().append("[");
        for (int i=0; i<result.size(); i++){
            response.getWriter().append("{\"nome\":\"").append(result.get(i).getNome()).append("\"}");
            if (i!=result.size()-1)
                response.getWriter().append(",");
        }
        response.getWriter().append("]");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
