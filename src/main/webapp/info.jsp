<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Info"/>
    </jsp:include>
    <style>
        body{
            background-color: var(--cream);
            font-family: 'Raleway';
            font-weight: bold;
            font-style: normal;
            font-size: 30px;
        }
        .card{
            display: flex;
            position: relative;
            flex-direction: column;
            align-items: center;
            border: solid 5px var(--cream);
            width: 90%;
            float: left;
            margin: 0 auto;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/partials/header.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
<fieldset>
    <legend>Obiettivo</legend>
    <p class="card">
        Il sito si pone come obiettivo quello di diventare un punto di riferimento tra gli e-commerce del
        fast fashion. Prendendo spunto dalle features più interessanti dei siti competitors, AVA
        Clothing propone un’interfaccia semplice, minimale e funzionale sia dal punto di vista
        dell’utente, sia dal punto di vista amministrativo. All’interno del catalogo saranno presenti
        capi d’abbigliamento rivolti a un pubblico giovane che cerca uno stile casual senza
        rinunciare alla qualità.
        Allo scopo di coinvolgere sia utenti che utilizzano smartphone sia utenti che utilizzano
        computer, il sito web è strutturato in modo responsive.
    </p>
</fieldset>
<fieldset>
    <legend>Orari di Apertura</legend>
    <p>Lunedì – Venerdì 08.00 – 21.00</p>
    <p>Sabato e Domenica 09.00 – 17.00</p>
    <p>Giorni festivi 09.00 – 17.00</p>
</fieldset>

</body>
</html>
