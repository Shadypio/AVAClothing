
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
    </jsp:include>
    <style>
        h2 {
            font-family: 'Raleway';
            font-weight: normal;
            font-style: normal;
            color: green;
        }
    </style>
</head>
<body>

<form action="/secret" method="post">
    <fieldset>
         <h2> Login Pannello Admin</h2>
         <span> Email </span>
         <label for="email">
             <input type="email" name="email" id="email" placeholder="Email">
         </label>
         <span> Password </span>
         <label for="password">
             <input type="password" name="password" id="password" placeholder="Password">
         </label>
         <button type="submit">Accedi</button>
    </fieldset>
</form>

</body>
</html>
