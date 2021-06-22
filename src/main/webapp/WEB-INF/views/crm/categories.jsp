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
    <style>
        table.redTable {
            border: 6px solid var(--darkred);
            background-color: var(--white);
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            box-sizing: border-box;
        }

        table.redTable td, table.redTable th {
            border: 1px solid var(--white);
            padding: 3px 2px;
        }

        table.redTable tbody td {
            font-size: 13px;
            font-weight: bold;
            color: #000000;
            border-bottom: 1px solid var(--red);
        }

        table.redTable thead {
            background: var(--red);
        }

        table.redTable thead th {
            font-size: 19px;
            font-weight: bold;
            color: #FFFFFF;
            text-align: center;
        }

        table.redTable td{
            font-size: 13px;
        }

        table.redTable{
            text-align: left;
        }

        @media screen and (max-width: 768px) {
            table.redTable {
                float:left;
            }
            .btnProp {
                float:left;
                clear: left;
            }
            table.redTable thead{
                display: none;
            }

            table.redTable, table.redTable tbody, table.redTable td, table.redTable th{
                display: block;
                width:100%;
            }

            table.redTable tr{
                margin-bottom: 15px;
            }

            table.redTable td{
                text-align: right;
                padding-left: 50%;
                text-align: right;
                position: relative;
            }

            table.redTable td::before{
                content: attr(data-label);
                position: absolute;
                left: 0;
                width: 50%;
                padding-left: 15px;
                font-size: 15px;
                font-weight: bold;
                text-align: left;
            }



        }
    </style>
</head>
<body style="background-color: var(--cream)">
<main class="app">
    <aside class="sidebar" id="sideBar">
        <nav class="grid-y align-center">
            <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
            <a href="<%=request.getContextPath()%>/crm/dashboard">Dashboard</a>
            <a href="<%=request.getContextPath()%>/crm/profile">Profilo</a>
            <a href="<%=request.getContextPath()%>/crm/customer">Gestione Clienti</a>
            <a href="<%=request.getContextPath()%>/crm/order">Gestione Ordini</a>
            <a href="<%=request.getContextPath()%>/crm/product">Gestione Prodotti</a>
            <a href="<%=request.getContextPath()%>/crm/category">Gestione Categorie</a>
            <a href="<%=request.getContextPath()%>/crm/logout">Logout</a>
        </nav>
    </aside>
    <div>
        <button class="openbtn" onclick="toggleNav()"> <img src="<%=request.getContextPath()%>/icons/menu.png"></button>
    </div>
    <section class="content grid-y" id="main">


        <div id="wrapper" class="content">
            <table class="redTable">
                <thead>
                <tr>
                    <th class="id-center">ID Categoria</th>
                    <th>Nome</th>
                    <th>Descrizione</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cate" items="${listaCat}">
                    <tr>
                        <td id="${cate.idCategoria}">${cate.idCategoria}</td>
                        <td id="${cate.idCategoria}">${cate.nome}</td>
                        <td id="${cate.idCategoria}">${cate.descrizione}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="btnProp">
                <button class="butAdd btn primary">Aggiungi Categoria</button> <!--Button Add-->

                <form action="${pageContext.request.contextPath}/crm/updatecat" method="post" >
                    <select name="catSelezionata" id="selected">
                        <c:forEach var="cate" items="${listaCat}">
                            <option>${cate.idCategoria} </option>
                        </c:forEach>
                    </select>

                    <button class="butMod btn primary" type="button">Modifica Categoria</button> <!--Button Modify-->
                    <div class="modCat">
                        <!--Al click Form Modify-->
                    </div>
                </form>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/crm/addcat" method="post" >
            <div class="newCat">
                <!--Al click Form Add-->
            </div>
        </form>


    </section>
</main>
<footer class="info">
    Copyright 2021, AVAClothing - Tutti i diritti riservati
</footer>

<script>
    let status = false;

    function toggleNav(){
        if(status) {
            document.getElementById("sideBar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
            status = false;
        }else{
            document.getElementById("sideBar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            status = true;
        }
    }

    $(document).ready(function() {
        $(".butAdd").click(function () {
            $(".allCategories").hide();
            $(".newCat").show().html("<fieldset>  <legend>Aggiungi Categoria</legend> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
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
                "<span> Descrizione: </span> <input type='text' name='desc' id='desc' placeholder='Descrizione'> <br>" +
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