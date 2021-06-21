<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Donna"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/partials/header.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<div class="grid-y">
    <div class="dropdown">
        <button class="dropbtn">Seleziona Categoria</button>
        <div class="dropdown-content">
            <% request.getSession().setAttribute("genere","donna");%>
            <c:forEach items="${listaCat}" var="categoria" >
                <a href="<%=request.getContextPath()%>/prodotto/selezione?id=${categoria.idCategoria}" >${categoria.nome}</a>
            </c:forEach>
        </div>
    </div>
</div>
<div class="viewProduct">
    <c:forEach items="${prodotti}" var="prodotto" >
        <div class="card">
            <img src="data:image/jpg;base64,${prodotto.base64Image}" width="350" height="370">
            <span>Nome: ${prodotto.nome}</span><br> <span>Prezzo: ${prodotto.prezzo}</span><br>
        </div>
    </c:forEach>
</div>
<!--FOOTER DI MERDA DA INSERIRE-->
</body>
</html>
