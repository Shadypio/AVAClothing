<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Utente"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <h3>Login Utente</h3>
    <form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/cliente/signin"  method="post">
        <div class="imgcontainer">
            <img src="<%=request.getContextPath()%>/img/logo.png" class="avatar"/>
        </div>
        <fieldset class="grid-y cell w50 login">
            <span> Email </span>
            <label for="email" class="field">
                <input type="email" name="email" id="email" placeholder="Email">
            </label>
            <span> Password </span>
            <label for="password" class="field">
                <input type="password" name="password" id="password" placeholder="Password">
            </label>
            <button class="btn primary" type="submit">Accedi</button>
        </fieldset>
    </form>
</body>
</html>
