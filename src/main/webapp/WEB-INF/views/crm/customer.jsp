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
            <c:forEach var="cliente" items="${listaCli}">
                <tr>
                    <td>${cliente.idCliente}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.cognome}</td>
                    <td>${cliente.email}</td>
                    <td>${cliente.username}</td>
                    <td>${cliente.indirizzo}</td>
                    <td>${cliente.telefono}</td>
                </tr>
        </c:forEach>
        </table>
        <button id="add" >Aggiungi Cliente</button> <!--ON CLICK DA FARE-->
        <form action="${pageContext.request.contextPath}/crm/addcust" method="post" >
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
            $(".newCustomer").show().html("<fieldset> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
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

        /**/
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