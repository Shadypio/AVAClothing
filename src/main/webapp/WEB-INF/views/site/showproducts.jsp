<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Products"/>
    </jsp:include>
</head>
<body>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}/uomo.jsp">UOMO</a>
        <a href="${pageContext.request.contextPath}/donna.jsp">DONNA</a>
    </div>
</nav>
<section>
    <a href="<%=request.getContextPath()%>/prodotto/tshirt">T-Shirt</a>
    <a href="<%=request.getContextPath()%>/prodotto/pantaloni">Pantaloni</a>
    <a href="<%=request.getContextPath()%>/prodotto/scarpe">Scarpe</a>
    <a href="<%=request.getContextPath()%>/prodotto/accessori">Accessori</a>
    <a href="<%=request.getContextPath()%>/prodotto/felpe">Felpe</a>
    <a href="<%=request.getContextPath()%>/prodotto/camicie">Camicie</a>
</section>
<c:forEach items="${prodotti}" var="prodotto" >
    <p>${prodotto.nome} ${prodotto.prezzo} ${prodotto.descrizioneBreve} ${prodotto.descrizioneDettagliata}
    ${prodotto.inOfferta} ${prodotto.idProdotto}</p>
</c:forEach>
</body>
</html>
