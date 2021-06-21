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
            <img src="/AVAClothing_war_exploded/img/logo.png" width="100" height="115">
            <a class="closebtn" onclick="closeNav()">x</a>
            <a href="/AVAClothing_war_exploded/crm/dashboard">Dashboard</a>
            <a href="/AVAClothing_war_exploded/crm/profile">Profilo</a>
            <a href="/AVAClothing_war_exploded/crm/customer">Gestione Clienti</a>
            <a href="/AVAClothing_war_exploded/crm/order">Gestione Ordini</a>
            <a href="/AVAClothing_war_exploded/crm/product">Gestione Prodotti</a>
            <a href="/AVAClothing_war_exploded/crm/category">Gestione Categorie</a>
            <a href="/AVAClothing_war_exploded/crm/logout">Logout</a>

        </nav>
    </aside>
    <div class="content grid-y" id="main">
        <button class="openbtn" onclick="openNav()"><img src="/AVAClothing_war_exploded/icons/menu.png"></button>
        <table class="allOrders">
            <tr>
                <th>ID Ordine</th>
                <th>Data Inserimento</th>
                <th>IVA</th>
                <th>ID Cliente</th>
            </tr>

            <tr>
                <td>100</td>
                <td>2020-12-10</td>
                <td>21.0</td>
                <td>2</td>
            </tr>

            <tr>
                <td>101</td>
                <td>2021-04-01</td>
                <td>21.0</td>
                <td>1</td>
            </tr>

            <tr>
                <td>102</td>
                <td>2021-01-12</td>
                <td>21.0</td>
                <td>3</td>
            </tr>

            <tr>
                <td>103</td>
                <td>2021-05-17</td>
                <td>21.0</td>
                <td>2</td>
            </tr>

        </table>
        <div>
            <form action="/AVAClothing_war_exploded/crm/updateord" method="post" >
                <select name="ordSelezionato" id="selected">

                    <option>100</option>

                    <option>101</option>

                    <option>102</option>

                    <option>103</option>

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

