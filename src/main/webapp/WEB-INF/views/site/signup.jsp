<%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 12/06/2021
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <jsp:include page="/WEB-INF/views/partials/head.jsp">
            <jsp:param name="title" value="Login Utente"/>
        </jsp:include>
        <style>
            .app{
                background: #f7f7f7;
            }

            .login{
                padding: 1rem;
                background-color: white;
            }

            .login > * {
                margin: 10px;
            }

            body {
                font-family: Raleway;
            }

            input{
                background-color: var(--cream) ;
                padding: 10px 20px;
                border: 1px solid grey;
            }

            span{
                position: relative;
                top: 16px;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 24px 0;
            }
            img.avatar {
                width: 50%;
            }

            fieldset{
                position:relative;
                bottom:40px;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 24px 0;
            }

            img.avatar {
                width: 50%;
            }

            fieldset {
                position: relative;
                bottom: 40px;
            }
        </style>
</head>
<body>
<h1>Registrazione Utente</h1>
                                                                    <%--CAMBIARE ACTION--%>
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
</body>
</html>
