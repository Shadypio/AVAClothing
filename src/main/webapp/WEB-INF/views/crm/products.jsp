<%@ page import="model.prodotto.ProdottoDAO" %>
<%@ page import="model.prodotto.Prodotto" %>
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
        <table class="allProducts" style="overflow: auto">
            <tr>
                <th>Immagine</th>
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
                    <td><img src="data:image/jpg;base64,${prodotto.base64Image}" width="80" height="100"></td>
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
        <div>
            <button class="butAdd btn primary">Aggiungi Prodotto</button> <!--Button Add-->

            <form action="${pageContext.request.contextPath}/crm/deletepro" method="post">
                <select name="selezioneDelete" id="selectedDel">
                    <c:forEach var="pro" items="${listaPro}">
                        <option>${pro.idProdotto} </option>
                    </c:forEach>
                </select>
                <button type="submit" class="butDel btn primary">Elimina Prodotto</button> <!--Button Delete-->
            </form>
            <form action="${pageContext.request.contextPath}/crm/updatepro" method="post" name="up">
                <select name="selezioneMod" id="selectedMod">
                    <c:forEach var="pro" items="${listaPro}">
                        <option>${pro.idProdotto} </option>
                    </c:forEach>
                </select>
                <button class="butMod btn primary" type="button">Modifica Prodotto</button><!--Button Modify-->
                <div class="modPro" name="upp">
                    <!--Al click Form Modify-->
                </div>
            </form>

        </div>
        <form action="${pageContext.request.contextPath}/crm/addpro" method="post" >
            <div class="newPro">
                <!--Al click Form Add-->
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
            $(".allProducts").hide();
            $(".newPro").show().html("<fieldset>  <legend>Aggiungi Prodotto</legend> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Prezzo: </span> <input type='text' name='prezzo' id='prezzo' placeholder='Prezzo'> <br>" +
                "<span> Descrizione Breve: </span> <input type='text' name='descBreve' id='descBreve' placeholder='Descrizione Breve'> value='' <br>" +
                "<span> Descrizione Dettagliata: </span> <input type='text' name='descDett' id='descDett' placeholder='Descrizione Dettagliata'> <br>" +
                "<span> In Offerta: </span> <select name='offerta'> <option>true</option> <option>false</option> </select> <br>" +
                "<span> Quantità: </span> <input type='text' name='quantita' id='quantita' placeholder='Quantità'> <br>" +
                "<span> ID Prodotto: </span> <input type='text' name='idPro' id='idPro' placeholder='ID Prodotto'> <br>" +
                "<span> ID Categoria: </span> <input type='text' name='idCat' id='idCat' placeholder='ID Categoria'> <br>" +
                "<span> ID Magazzino: </span> <input type='text' name='idMag' id='idMag' placeholder='ID Magazzino'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button> " +
                "<button class='btn primary' type='button' id='annulla'>Annulla</button> </fieldset>");
            $("#annulla").click(function () {
                $(".allProducts").show();
                $(".newPro").hide();
            });
        });
        $(".butMod").click(function () {
            $(".modPro").show().html("<fieldset> <legend>Modifica Prodotto</legend><span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Prezzo: </span> <input type='text' name='prezzo' id='prezzo' placeholder='Prezzo'> <br>" +
                "<span> Descrizione Breve: </span> <input type='text' name='descB' id='descB' placeholder='Descrizione Breve'> <br>" +
                "<span> Descrizione Dettagliata: </span> <input type='text' name='descD' id='descD' placeholder='Descrizione Dettagliata'> <br>" +
                "<span> In Offerta: </span> <select name='offerta'> <option>true</option> <option>false</option> </select> <br>" +
                "<span> Quantità: </span> <input type='text' name='quantita' id='quantita' placeholder='Quantità'> <br>" +
                "<span> ID Categoria: </span> <input type='text' name='idCat' id='idCat' placeholder='ID Categoria'> <br>" +
                "<span> ID Magazzino: </span> <input type='text' name='idMag' id='idMag' placeholder='ID Magazzino'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button>" +
                "<button class='btn primary' type='button' id='annulla2'>Annulla</button> </fieldset>")
            $("#annulla2").click(function () {
                $(".modPro").hide();
            });
        });
    });
</script>
</body>
</html>