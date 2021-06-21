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
            <img src="/AVAClothing_war_exploded/img/logo.png" width="100" height="115">
            <a href="/AVAClothing_war_exploded/crm/dashboard">Dashboard</a>
            <a href="/AVAClothing_war_exploded/crm/profile">Profilo</a>
            <a href="/AVAClothing_war_exploded/crm/customer">Gestione Clienti</a>
            <a href="/AVAClothing_war_exploded/crm/order">Gestione Ordini</a>
            <a href="/AVAClothing_war_exploded/crm/product">Gestione Prodotti</a>
            <a href="/AVAClothing_war_exploded/crm/category">Gestione Categorie</a>
            <a href="/AVAClothing_war_exploded/crm/logout">Logout</a>
        </nav>
    </aside>
    <div>
        <button class="openbtn" onclick="toggleNav()"><img src="/AVAClothing_war_exploded/icons/menu.png"></button>
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
                <tr>
                    <td id="1">1</td>
                    <td id="1">T-Shirts Uomo</td>
                    <td id="1">Fai scorta di t-shirt da uomo online da AVAClothing. Rinnova il tuo guardaroba con t-shirt stampate con tanti motivi trendy e pattern per riflettere la tua personalita'.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="2">2</td>
                    <td id="2">Pantaloni Uomo</td>
                    <td id="2">La linea di pantaloni da Uomo include capi eleganti con tonalita' dal chiaro al grigio scuro, capi casual con tasche laterali e da abbinare alle occasioni piu' sportive.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="3">3</td>
                    <td id="3">Scarpe Uomo</td>
                    <td id="3">Completa il tuo outfit con le nostre raffinate scarpe da uomo. Se cerchi dei modelli da indossare tutti i giorni, scopri tanti modelli di sneakers da uomo da infilare o da allacciare, sia minimal che in colori vivaci per adattarsi ai tuoi gusti.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="4">4</td>
                    <td id="4">Accessori Uomo</td>
                    <td id="4">Crea un look elegante e raffinato grazie alla selezione di accessori da Uomo. Cinture, bretelle, gioielli, basta poco per riuscire a personalizzare ogni outfit con il tuo stile</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="5">5</td>
                    <td id="5">Felpe Uomo</td>
                    <td id="5">Aggiungi un tocco di calore al tuo guardaroba per tutti i giorni, con la nostra selezione di felpe con o senza cappuccio da uomo. Scopri giacche con cappuccio in colori neutri o felpe stampate con il tuo motivo preferito per il weekend.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="6">6</td>
                    <td id="6">Camicie Uomo</td>
                    <td id="6">Rendi elegante il tuo look per tutti i giorni con le nostre camicie da uomo. Abbiamo camicie dalla linea slim o regular per adattarsi ai tuoi gusti e alle diverse occasioni.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="7">7</td>
                    <td id="7">Top Donna</td>
                    <td id="7">La linea di top da Donna di AVAClothing include modelli per il lavoro e per il fine settimana. Facili da abbinare a una gonna elegante e un jeans casual. Trova il modello che meglio fa al caso tuo.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="8">8</td>
                    <td id="8">Pantaloni Donna e Gonne</td>
                    <td id="8">Classici, moderni, basic e casual. I pantaloni e leggings da Donna di AVAClothing includono modelli adatti ad ogni stile e occasione. Aggiorna il tuo guardaroba con le tue gonne preferite.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="9">9</td>
                    <td id="9">Scarpe Donna</td>
                    <td id="9">Regalati un paio di scarpe nuove: basse e comode o a tacco alto. Stivali, sandali eleganti o sneakers sportive.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="10">10</td>
                    <td id="10">Accessori Donna</td>
                    <td id="10">La linea di accessori Donna include cinture scamosciate da annodare a un maxi pull in tinta unita per un look sbarazzino e alla moda.</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="11">11</td>
                    <td id="11">Felpe Donna</td>
                    <td id="11">Comoda e trendy. La felpa con o senza cappuccio è la scelta più cool per giornate di relax. Scopri tante stampe e modelli alla moda e aggiungi un tocco street-wear al tuo look!</td>
                </tr>
                </tbody>

                <tbody>
                <tr>
                    <td id="12">12</td>
                    <td id="12">Camicie Donna</td>
                    <td id="12">Scopri le camicie e le bluse della nuova collezione Donna. Abbina una tunica lunga a un biker di pelle o indossa una camicia di jeans con un pantalone a palazzo in tinta unita.</td>
                </tr>
                </tbody>

            </table>


            <div class="btnProp">
                <button class="butAdd btn primary">Aggiungi Categoria</button> <!--Button Add-->

                <form action="/AVAClothing_war_exploded/crm/updatecat" method="post" >
                    <select name="catSelezionata" id="selected">

                        <option>1 </option>

                        <option>2 </option>

                        <option>3 </option>

                        <option>4 </option>

                        <option>5 </option>

                        <option>6 </option>

                        <option>7 </option>

                        <option>8 </option>

                        <option>9 </option>

                        <option>10 </option>

                        <option>11 </option>

                        <option>12 </option>

                    </select>

                    <button class="butMod btn primary" type="button">Modifica Categoria</button> <!--Button Modify-->
                    <div class="modCat">
                        <!--Al click Form Modify-->
                    </div>
                </form>
            </div>
        </div>
        <form action="/AVAClothing_war_exploded/crm/addcat" method="post" >
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