 <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>

    <style>
        html{
            background-color: #f7f7f7;
        }

        h3{
            font-family: Raleway;
            color: var(--darkcream);
            position: center;
        }
    </style>

</head>
<body>
<form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/crm/dashboard" method="post">
    <div class="imgcontainer">
    <img src="<%=request.getContextPath()%>/img/logo.png" class="avatar"/>
    </div>
    <fieldset class="grid-y cell w50 login">
        <h3>Login Admin</h3>
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