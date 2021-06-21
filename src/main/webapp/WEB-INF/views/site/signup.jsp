<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Utente"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/crm/dashboard"  method="get">
        <div class="imgcontainer">
            <img src="<%=request.getContextPath()%>/img/logo.png" class="avatar"/>
        </div>
        <fieldset class="grid-y cell w50 login">
            <span> Nome </span>
            <label for="nome" class="field">
                <input type="text" name="nome" id="nome" placeholder="Nome">
            </label>

            <span> Cognome </span>
            <label for="cognome" class="field">
                <input type="text" name="cognome" id="cognome" placeholder="Cognome">
            </label>

            <span> Username </span>
            <label for="username" class="field">
                <input type="text" name="username" id="username" placeholder="Username">
            </label>

            <span> Email </span>
            <label for="email" class="field">
                <input type="email" name="email" id="email" placeholder="Email">
            </label>

            <span> Password </span>
            <label for="password" class="field">
                <input type="password" name="password" id="password" placeholder="Password">
            </label>

            <span> Indirizzo </span>
            <label for="indirizzo" class="field">
                <input type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo">
            </label>

            <span> Telefono </span>
            <label for="telefono" class="field">
                <input type="text" name="telefono" id="telefono" placeholder="Telefono">
            </label>

            <button class="btn primary" type="submit">Accedi</button>
        </fieldset>
    </form>
    <jsp:include page="/WEB-INF/views/partials/footer.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
</body>
</html>
