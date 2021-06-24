<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Registrazione Utente"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/cliente/create"  method="post">
        <div class="imgcontainer">
            <img src="<%=request.getContextPath()%>/img/logo.png" class="avatar"/>
        </div>
        <fieldset class="grid-y cell w50 login">
            <span> Nome </span>
            <label for="nome" class="field">
                <input type="text" name="nome" id="nome" placeholder="Nome" required>
            </label>

            <span> Cognome </span>
            <label for="cognome" class="field">
                <input type="text" name="cognome" id="cognome" placeholder="Cognome" required>
            </label>

            <span> Username </span>
            <label for="username" class="field">
                <input type="text" name="username" id="username" placeholder="Username" required>
            </label>

            <span> Email </span>
            <label for="email" class="field">
                <input type="email" name="email" id="email" placeholder="Email">
            </label>

            <span> Password </span>
            <label for="password" class="field">
                <input type="password" name="password" id="password" placeholder="Password" required>
            </label>

            <span> Indirizzo </span>
            <label for="indirizzo" class="field">
                <input type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo" required>
            </label>

            <span> Telefono </span>
            <label for="telefono" class="field">
                <input type="text" name="telefono" id="telefono" placeholder="Telefono" required>
            </label>

            <button class="btn primary" type="submit">Registrati</button>
        </fieldset>
    </form>
</body>
</html>
