
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="AVAClothing-Home"/>
        <jsp:param name="styles" value="crm,dashboard"/>
        <jsp:param name="scripts" value="crm,dashboard"/>
    </jsp:include>
    <link href="<%=request.getContextPath()%>/css/crm.css" type="text/css" rel="stylesheet">
</head>

<body>
<main class="app">
    <aside class="sidebar">
        <nav class="grid-y align-center">
            <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
            <a href="#home">Profilo</a>
            <a href="#clienti">Gestione Clienti</a>
            <a href="#ordini">Gestione Ordini</a>
            <a href="#prodotti">Gestione Prodotti</a>
            <a href="#logout">Logout</a>
        </nav>
    </aside>
    <section class="content grid-y">

        <div class="menu">
            <!-- HAMBURGER -->
        </div>
        <div class="body">
            ciao
        </div>

        <footer class="info">
         <p> Copyright 2020,AVAClothing tutti i diritti riservati </p>
        </footer>
    </section>
</main>
</body>
</html>
