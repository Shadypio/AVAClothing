
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
<%--Prova--%>
<body>
<main class="app">
    <aside class="sidebar" id="sideBar">
        <nav class="grid-y align-center">
            <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
            <a class="closebtn" onclick="closeNav()">x</a>
            <a href="#home">Profilo</a>
            <a href="#clienti">Gestione Clienti</a>
            <a href="#ordini">Gestione Ordini</a>
            <a href="#prodotti">Gestione Prodotti</a>
            <a href="#logout">Logout</a>
        </nav>


    </aside>
    <section class="content grid-y" id="main">
        <button class="openbtn" onclick="openNav()"><img src="<%=request.getContextPath()%>/icons/menu.png"></button>
        <div class="menu">
            <!-- HAMBURGER -->
        </div>
        <div class="body">
            ciao
        </div>

        <footer class="info">
         <p> Copyright 2021, AVAClothing - Tutti i diritti riservati </p>
        </footer>
    </section>
</main>

<script>
    function openNav() {
        document.getElementById("sideBar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("sideBar").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }
</script>

</body>
</html>
