<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione Effettuata con Successo!</title>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/registered.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Show Ordine"/>
    </jsp:include>

    <style>
        h1, h3, a {
            font-family: Raleway;
            color: var(--cream);
            position: center;
        }

        a:link, a:visited {
            color: #b380ff;
        }

        a:active {
            color: #9a51ff;
        }

    </style>
</head>
<body>
<div class="bg">
</div>
<div class="registeredtext">
    <h1>Ti diamo il benvenuto!</h1>
    <h3>Registrazione effettuata con successo.</h3>
    <!--div style="color: #EE4037;">
        <Error message: <%/*exception.printStackTrace()*/%>>
    </div--><br>
    <a href="<%=request.getContextPath()%>/index.jsp">Torna alla Home</a>
</div>
<a href="<%=request.getContextPath()%>/WEB-INF/views/site/signin.jsp">Accedi</a>
</body>
</html>
