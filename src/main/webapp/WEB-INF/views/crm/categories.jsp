<%@ page import="java.util.ArrayList" %>
<%@ page import="model.categoria.Categoria" %>
<%@ page import="model.categoria.CategoriaDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Categorie"/>
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
        <table class="allCategories">
            <tr>
                <th>ID Categoria</th>
                <th>Nome</th>
                <th>Descrizione</th>
            </tr>
            <c:forEach var="cate" items="${listaCat}">
                <tr>
                    <td id="${cate.idCategoria}">${cate.idCategoria}</td>
                    <td id="${cate.idCategoria}">${cate.nome}</td>
                    <td id="${cate.idCategoria}">${cate.descrizione}</td>
                </tr>
            </c:forEach>
        </table>
        <div>
            <button class="butAdd btn primary">Aggiungi Categoria</button>
            <select name="catSelezionata" id="selected">
            <c:forEach var="cate" items="${listaCat}">
                <option>${cate.idCategoria} </option>
            </c:forEach>
            </select><button class="butMod btn primary">Modifica Categoria</button>
        </div>
        <form action="${pageContext.request.contextPath}/crm/addcat" method="post" >
            <div class="newCat">

            </div>
        </form>
        <form action="${pageContext.request.contextPath}/crm/updatecat" method="post" >
            <div class="modCat">

            </div>
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

    $(document).ready(function() {
        $(".butAdd").click(function () {
            $(".allCategories").hide();
            $(".newCat").show().html("<fieldset> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Descrizione: </span> <input type='text' name='descrizione' id='descrizione' placeholder='Descrizione'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button> " +
                "<button class='btn primary' type='button' id='annulla'>Annulla</button> </fieldset>")
            $("#annulla").click(function () {
                $(".allCategories").show();
                $(".newCat").hide();
            });
        });

        $(".butMod").click(function () {
            $(".modCat").show().html("<fieldset> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Descrizione: </span> <input type='text' name='descrizione' id='descrizione' placeholder='Descrizione'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button>" +
                "<button class='btn primary' type='button' id='annulla2'>Annulla</button> </fieldset>")
            $("#annulla2").click(function () {
                $(".modCat").hide();
            });
        });
    });
</script>

</body>
</html>
