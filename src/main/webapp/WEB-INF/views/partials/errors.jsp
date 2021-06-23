<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet">
<link href="<c:url value="/css/library.css"/>" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
    <style>
        body, html {
            height: 100%;
            text-align: center;
            font-size: x-large;
        }

        .bg {

            background-image: url('https://cdn.shopify.com/s/files/1/1529/9657/articles/Copy_of_Copy_of_Copy_of_Copy_of_Untitled_6.jpg?v=1587571845');
            filter: blur(4px);
            -webkit-filter: blur(4px);
            height: 100%;

            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .errortext {
            background-color: rgba(0,0,0, 0.6); /* Black w/opacity/see-through */
            color: white;
            font-weight: bold;
            border: 3px solid #f1f1f1;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 2;
            width: 80%;
            padding: 20px;
            text-align: center;
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
<div class="errortext">
    <h1>Ops! Sembra che qualcosa sia andato storto. Riprova più tardi.</h1>
    <div style="color: #EE4037;">
        Error message: <%= exception.printStackTrace()%>
    </div><br>
    <a href="<%=request.getContextPath()%>/index.jsp">Torna alla Home</a>
</div>
</body>
</html>
