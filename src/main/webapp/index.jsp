<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Home Page"/>
    </jsp:include>
</head>
<body>

<img src="<%=request.getContextPath()%>/img/logo.png">
<div>
    <a href="./cliente/secret">Login Admin</a>
    <a href="./cliente/signup">Registrazione Nuovo utente</a>
    <a href="./cliente/signin">Login utente</a>
    <%--CARRELLO--%>
</div>

<div>
    <a href="${pageContext.request.contextPath}/uomo.jsp">UOMO</a>
    <a href="${pageContext.request.contextPath}/donna.jsp">DONNA</a>
</div>

<img src="immagini prodotto copertina">
<img src="immagini prodotto copertina">
<img src="immagini prodotto copertina">


</body>
</html>