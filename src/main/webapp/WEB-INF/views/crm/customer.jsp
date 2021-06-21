<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Clienti"/>
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
    <section class="content grid-y" id="main">
        <button class="openbtn" onclick="openNav()"><img src="/AVAClothing_war_exploded/icons/menu.png"></button>
        <table class="allCustomer">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Email</th>
                <th>Username</th>
                <th>Indirizzo</th>
                <th>Telefono</th>
            </tr>

            <tr>
                <td>1</td>
                <td>Mario</td>
                <td>Rossi</td>
                <td>mariorossi00@example.com</td>
                <td>Mario00Rossi</td>
                <td>Via Ponzio Pilato, 12, Milano</td>
                <td>3514235768</td>
            </tr>

            <tr>
                <td>2</td>
                <td>Luca</td>
                <td>Gialli</td>
                <td>lucagialli98@example.com</td>
                <td>Gialli_Luca98</td>
                <td>Via Giulio Cesare, 21, Roma</td>
                <td>3337756898</td>
            </tr>

            <tr>
                <td>3</td>
                <td>Matteo</td>
                <td>Neri</td>
                <td>matteoneri89@example.com</td>
                <td>MatteoNeri</td>
                <td>Via Napoli, 58, Napoli</td>
                <td>3774621432</td>
            </tr>

            <tr>
                <td>4</td>
                <td>Gennaro</td>
                <td>Costagliola</td>
                <td>gencos@unisa.it</td>
                <td>admin</td>
                <td>Via Unisa, 10, Salerno</td>
                <td>3774621542</td>
            </tr>

        </table>
        <div>
            <button id="add" class="btn primary">Aggiungi Cliente</button>
        </div>
        <form action="/AVAClothing_war_exploded/crm/addcust" method="post" >
            <div class="newCustomer">

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

    $(document).ready(function(){
        $("#add").click(function (){
            $(".allCustomer").hide();
            $(".newCustomer").show().html("<fieldset>  <legend>Aggiungi Cliente:</legend> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Cognome: </span> <input type='text' name='cognome' id='cognome' placeholder='Cognome'> <br>" +
                "<span> Username: </span> <input type='text' name='username' id='username' placeholder='Username'> <br>" +
                "<span> Email: </span> <input type='text' name='email' id='email' placeholder='Email'> <br>" +
                "<span> Password: </span> <input type='password' name='password' id='password' placeholder='Password'> <br>" +
                "<span> Indirizzo: </span> <input type='text' name='indirizzo' id='indirizzo' placeholder='Indirizzo'> <br>" +
                "<span> Telefono: </span> <input type='text' name='tel' id='tel' placeholder='Telefono'> <br>" +
                "<span> isAdmin: </span> <select name='admin'><option>true</option> <option>false</option></select> <br>" +
                "<button class='btn primary' type='submit'>Salva</button> " +
                "<button class='btn primary' type='button' id='annulla'>Annulla</button> </fieldset>")
            $("#annulla").click(function (){
                $(".allCustomer").show();
                $(".newCustomer").hide();
            });
        });

    });

</script>
</body>
</html>

<!--"<fieldset class="grid-y cell w50 login"> <span> Nome </span> <label for="nome" class="field"> <input type="text" name="nome" id="nome" placeholder="Nome">  </label>
<span> Cognome </span> <label for="cognome" class="field"> <input type="text" name="cognome" id="cognome" placeholder="Cognome"> </label>
<span> Username </span> <label for="username" class="field"> <input type="text" name="username" id="username" placeholder="Username"></label>
<span> Email </span> <label for="email" class="field"> <input type="email" name="email" id="email" placeholder="Email"> </label>
<span> Password </span> <label for="password" class="field"> <input type="password" name="password" id="password" placeholder="Password"></label>
<span> Indirizzo </span> <label for="indirizzo" class="field"> <input type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo"></label>
<span> Telefono </span> <label for="telefono" class="field"> <input type="text" name="telefono" id="telefono" placeholder="Telefono"></label>
<button class="btn primary" type="submit">Salva</button> </fieldset>";-->