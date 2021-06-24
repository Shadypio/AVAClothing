<%@ page import="java.util.ArrayList" %>
<%@ page import="model.prodotto.Prodotto" %>
<%@ page import="model.cliente.Cliente" %>
<%@ page import="model.prodottoordine.ProdottoOrdine" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Carrello"/>
    </jsp:include>
    <style>
        body{
            background-color: var(--cream);
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/partials/headerLoggato.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include> <br>

    <%ArrayList<Prodotto> lista=(ArrayList<Prodotto>) request.getSession().getAttribute("cart");
      Cliente c=(Cliente) request.getSession().getAttribute("profilo");
      ArrayList<ProdottoOrdine> elenco =(ArrayList<ProdottoOrdine>) request.getSession().getAttribute("elencocart");
      double totale=0;
      Double tot=(Double) request.getSession().getAttribute("totale");
      if(tot!=null)
          totale=tot;
    %>
    <div class="totale">
        <span>Totale Carrello:<%=totale%></span>
    </div>
    <%if (lista.isEmpty()){%>
    <div class="card">
        <p>Carrello Vuoto</p>
    </div>
    <%}else {
        for (int i=0; i<lista.size(); i++){%>
        <form method="post">
            <div class="card">
                    <img src="data:image/jpg;base64,<%=lista.get(i).getBase64Image()%>" width="350" height="370">
                    <span>Nome: <%=lista.get(i).getNome()%></span><br>
                    <span>Prezzo: <%=lista.get(i).getPrezzo()%></span><br>
                    <span>Descrizione Dettagliata: <%=lista.get(i).getDescrizioneDettagliata()%></span><br>
                    <span>Quantità: <%=elenco.get(i).getQuantita()%></span>
                    <button type="submit" class="delete btn primary" name="delete" value="<%=lista.get(i).getIdProdotto()%>">Elimina</button>
            </div>
            <%}
        }%>
            <button type="submit" class="buy btn primary" name="buy">Acquista</button>
        </form>
<script>
    $(document).ready(function(){
        $(".delete").click(function () {
            $('form').attr('action', '${pageContext.request.contextPath}/cliente/deletepro');

        })
        $(".buy").click(function () {
            $('form').attr('action', '${pageContext.request.contextPath}/cliente/acquistacarrello');
        })
    });
</script>

</body>
</html>
