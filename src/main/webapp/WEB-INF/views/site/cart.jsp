<%@ page import="model.ordine.Ordine" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
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

    <%Ordine cart=(Ordine) request.getSession().getAttribute("cart");%>
    <%=cart.getProdotti()%>
    <c:choose>
        <c:when test="${not empty cart.prodotti}">
            <c:forEach var="pro" items="${cart.prodotti}">
                <div class="card">
                    <img src="data:image/jpg;base64,${pro.base64Image}" width="350" height="370">
                    <span>Nome: ${pro.nome}</span><br> <span>Prezzo: ${pro.prezzo}</span><br>
                    <span>Descrizione Dettagliata: ${pro.getDescrizioneDettagliata}</span><br>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="card">
                <p>Carrello Vuoto</p>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>
