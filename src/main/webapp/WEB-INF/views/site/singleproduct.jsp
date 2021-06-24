<%@ page import="model.prodotto.Prodotto" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Single Product"/>
    </jsp:include>
    <style>
        body{
            background-color: var(--cream);
        }
    </style>
</head>
<body>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerLoggato.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
    </c:choose>
    <%Prodotto pro= (Prodotto) request.getSession().getAttribute("prodotto");%>

    <div class="card">
        <form action="${pageContext.request.contextPath}/cliente/inputcarrello" method="post">
            <input type="hidden" name="id" value="<%=pro.getIdProdotto()%>">
            <img src="data:image/jpg;base64,<%=pro.getBase64Image()%>" width="500" height="500">
            <span>Nome: <%=pro.getNome()%></span><br> <span>Prezzo: <%=pro.getPrezzo()%></span><br>
            <span>Descrizione Dettagliata: <%=pro.getDescrizioneDettagliata()%></span><br>
            <span>Quantità: <%=pro.getQuantita()%></span><br>
            <span>Seleziona Quantità</span>
            <input type="number" min="1" max="<%=pro.getQuantita()%>" name="selected"><br>
            <button type="submit" class="butAdd btn primary">Aggiungi al Carrello</button>
        </form>
    </div>

</body>
</html>