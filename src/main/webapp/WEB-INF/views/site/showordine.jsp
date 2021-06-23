<%@ page import="model.prodotto.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.prodottoordine.ProdottoOrdine" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Show Ordine"/>
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
    </jsp:include>

    <%ArrayList<Prodotto> showOrdine=(ArrayList<Prodotto>) request.getSession().getAttribute("showOrdine");
      ArrayList<ProdottoOrdine> result =(ArrayList<ProdottoOrdine>) request.getSession().getAttribute("result");
      double tot=(Double) request.getSession().getAttribute("totOrdine");%>
    <div>
        <h2>Riepilogo Ordine:</h2>
        <h4>Totale: €<%=tot%></h4>
    </div>
    <%for (int i=0; i<showOrdine.size(); i++){%>
        <div class="card">
            <img src="data:image/jpg;base64,<%=showOrdine.get(i).getBase64Image()%>" width="350" height="370">
            <span>Nome: <%=showOrdine.get(i).getNome()%></span><br>
            <span>Prezzo: <%=showOrdine.get(i).getPrezzo()%></span><br>
            <span>Descrizione Dettagliata: <%=showOrdine.get(i).getDescrizioneDettagliata()%></span><br>
            <span>Quantità: <%=result.get(i).getQuantita()%></span>
        </div>
    <%}%>

</body>
</html>
