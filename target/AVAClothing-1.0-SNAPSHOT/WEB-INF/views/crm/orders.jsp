<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Ordini"/>
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
    <div class="content grid-y" id="main">
        <button class="openbtn" onclick="openNav()"><img src="<%=request.getContextPath()%>/icons/menu.png"></button>
        <table class="allOrders">
            <tr>
                <th>ID Ordine</th>
                <th>Data Inserimento</th>
                <th>IVA</th>
                <th>ID Cliente</th>
            </tr>
            <c:forEach var="order" items="${listaOrd}">
                <tr>
                    <td>${order.idOrdine}</td>
                    <td>${order.dataInserimento}</td>
                    <td>${order.iva}</td>
                    <td>${(order.cliente).idCliente}</td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <form action="${pageContext.request.contextPath}/crm/updateord" method="post" >
                <select name="ordSelezionato" id="selected">
                <c:forEach var="ord" items="${listaOrd}">
                    <option>${ord.idOrdine}</option>
                </c:forEach>
                </select>
                <button class="butMod btn primary" type="button">Modifica Ordine</button>
                <div class="modOrd">

                </div>
            </form>
        </div>
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
    $(document).ready(function() {
        $(".butMod").click(function () {
            $(".modOrd").show().html("<fieldset> <legend>Modifica Ordine</legend><span> IVA: </span> <input type='text' name='iva' id='iva' placeholder='IVA'> <br> " +
                "<span> Data Inserimento: </span> <input type='date' name='data' id='data' placeholder='Data Inserimento'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button>" +
                "<button class='btn primary' type='button' id='annulla'>Annulla</button> </fieldset>")
            $("#annulla").click(function () {
                $(".modOrd").hide();
            });
        });
    });

</script>
</body>
</html>
