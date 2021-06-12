<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@page errorPage="WEB-INF/views/partials/errorpage.jsp"%>
    <jsp:include page="WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Home Page"/>
    </jsp:include>
</head>
<body>
<%--response.sendRedirect("./cliente/secret");--%>
<div>
    <a href="./cliente/secret">Login Admin</a>
    <a href="./cliente/signup">Registrazione Nuovo utente</a>
    <a href="./cliente/signin">Login utente</a>
    <a href="./cliente/adsda">ueue</a>
</div>

</body>
</html>