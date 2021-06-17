<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Prodotti"/>
        <jsp:param name="styles" value="crm,dashboard"/>
        <jsp:param name="scripts" value="crm,dashboard"/>
    </jsp:include>
    <link href="<%=request.getContextPath()%>/css/crm.css" type="text/css" rel="stylesheet">
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
        <table>
            <tr>
                <th>ID Prodotto</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Quantita</th>
                <th>Descrizione Breve</th>
                <th>in Offerta</th>
                <th>ID Categoria</th>
            </tr>

            <c:forEach var="prodotto" items="${listaPro}">
                <tr>
                    <td>${prodotto.idProdotto}</td>
                    <td>${prodotto.nome}</td>
                    <td>${prodotto.prezzo}</td>
                    <td>${prodotto.quantita}</td>
                    <td>${prodotto.descrizioneBreve}</td>
                    <td>${prodotto.inOfferta}</td>
                    <td>${(prodotto.categoria).idCategoria}</td>
                </tr>
            </c:forEach>
        </table>
        <button onclick="">Aggiungi Prodotto</button>
        <button onclick="">Elimina Prodotto</button>
        <button onclick="">Modifica Prodotto</button>  <!--ON CLICK DA FARE-->
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
</script>

</body>
</html>
