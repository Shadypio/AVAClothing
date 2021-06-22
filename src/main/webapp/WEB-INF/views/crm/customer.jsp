<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/css/crm.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Clienti"/>
    </jsp:include>

</head>
<body>
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

    <section class="content grid-y" id="main">
        <div>
            <div>
                <button class="openbtn" onclick="toggleNav()"><img src="<%=request.getContextPath()%>/icons/menu.png"></button>
            </div>
        <table class="redTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Indirizzo</th>
                    <th>Telefono</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>

        </table>
        <div>
            <button id="add" class="btn primary">Aggiungi Cliente</button>
        </div>
        <form action="${pageContext.request.contextPath}/crm/addcust" method="post" class="formWrapper">
            <div class="newCustomer">

            </div>
        </form>
        </div>
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