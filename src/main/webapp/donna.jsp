<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Donna"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/views/partials/header.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<section class="centerSide">
    <% request.getSession().setAttribute("genere","donna");%>
    <a href="<%=request.getContextPath()%>/prodotto/tshirt">T-Shirt</a>
    <a href="<%=request.getContextPath()%>/prodotto/pantaloni">Pantaloni</a>
    <a href="<%=request.getContextPath()%>/prodotto/scarpe">Scarpe</a>
    <a href="<%=request.getContextPath()%>/prodotto/accessori">Accessori</a>
    <a href="<%=request.getContextPath()%>/prodotto/felpe">Felpe</a>
    <a href="<%=request.getContextPath()%>/prodotto/camicie">Camicie</a>
</section>
<jsp:include page="/WEB-INF/views/partials/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
</body>
</html>
