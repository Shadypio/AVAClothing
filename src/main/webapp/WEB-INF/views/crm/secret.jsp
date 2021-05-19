
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
    <style>
        .app{
            background: linear-gradient(var(--cream), var(--darkcream));
        }

        .login{
            padding: 1rem;
            background-color: var(--cream);
            border-radius: 10px;
        }

        .login > * {
            margin: 10px;
        }

        body {
            font-family: Raleway;
        }

    </style>

</head>
<body>
<form class="app grid-x justify-center align-center" action="${pageContext.request.contextPath}/crm/dashboard" method="post">
    <fieldset class="grid-y cell w50 login">
        <h2> Login Pannello Admin</h2>
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