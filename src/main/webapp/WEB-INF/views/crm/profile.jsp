<%@ page import="com.mysql.cj.xdevapi.Client" %>
<%@ page import="model.cliente.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Profilo"/>
        <jsp:param name="styles" value="crm,dashboard"/>
        <jsp:param name="scripts" value="crm,dashboard"/>
    </jsp:include>
    <link href="<%=request.getContextPath()%>/css/crm.css" type="text/css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<main class="app">
    <aside class="sidebar" id="sideBar">
        <nav class="grid-y align-center">
            <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
            <a class="closebtn" onclick="closeNav()">x</a>
            <a href="<%=request.getContextPath()%>/crm/dashboard">Dashboard</a>
            <a href="<%=request.getContextPath()%>/crm/profile">Profilo</a>
            <a href="<%=request.getContextPath()%>/crm/customer">Gestione Clienti</a>
            <a href="<%=request.getContextPath()%>/crm/order">Gestione Ordini</a>
            <a href="<%=request.getContextPath()%>/crm/product">Gestione Prodotti</a>
            <a href="<%=request.getContextPath()%>/crm/category">Gestione Categorie</a>
            <a href="<%=request.getContextPath()%>/crm/logout">Logout</a>

        </nav>
    </aside>
    <section class="content grid-y" id="main">
        <button class="openbtn" onclick="openNav()"><img src="<%=request.getContextPath()%>/icons/menu.png"></button>

        <form action="${pageContext.request.contextPath}/crm/updatecust" method="post">

            <%Cliente c= (Cliente) session.getAttribute("profilo");%>
            <span>ID: </span>
            <input type="hidden" name="idAdmin" value="<%=c.getIdCliente()%>">
            <span>Nome: </span>
            <input type="text" value="<%=c.getNome()%>" readonly name="nome"><br>
            <span>Cognome: </span>
            <input type="text" value="<%=c.getCognome()%>" readonly name="cognome"><br>
            <span>Email: </span>
            <input type="text" value="<%=c.getEmail()%>" readonly name="email"><br>
            <span>Username: </span>
            <input type="text" value="<%=c.getUsername()%>" readonly name="username"><br>
            <span>Password: </span>
            <input type="password" value="<%=c.getPassword()%>" readonly name="password"><br>
            <span>Indirizzo: </span>
            <input type="text" value="<%=c.getIndirizzo()%>" readonly name="indirizzo"><br>
            <span>Telefono: </span>
            <input type="text" value="<%=c.getTelefono()%>" readonly name="telefono"><br>
            <button type="submit" onclick="salva()">Salva</button>
            <button type="button" id="mod">Modifica</button>
        </form>
    </section>
</main>
<footer class="info">
    Copyright 2021, AVAClothing - Tutti i diritti riservati
</footer>

<script>
    function openNav() {
        document.getElementById("sideBar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("sideBar").style.width = "0";
        document.getElementById("main").style.marginLeft= "0";
    }

    $(document).ready(function(){
       $("#mod").click(function(){
           $("input").removeAttr("readonly");
        })
    });

    function salva(){
        var elemento = document.getElementsByTagName("input");
        var i;
        for(i=0; i<elemento.length; i++)
            elemento[i].setAttribute("readonly", true);
    }
</script>

</body>
</html>
