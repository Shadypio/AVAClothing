 <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Admin"/>
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

<form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/crm/dashboard" method="post">
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