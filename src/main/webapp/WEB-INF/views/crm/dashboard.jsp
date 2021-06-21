<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="AVAClothing-Home"/>
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
        <div class="menu">
            <!-- HAMBURGER -->
        </div>
        <div class="dash">
            <h4>Gestione Ordini</h4>
            <p>N° Ordini: <%=request.getAttribute("numeroOrdini")%></p>
            <a href="<%=request.getContextPath()%>/crm/order">Gestisci &#8594;</a>
        </div>
        <div class="dash">
            <h4>Gestione Clienti</h4>
            <p>N° Cliente: <%=request.getAttribute("numeroClienti")%></p>
            <a href="<%=request.getContextPath()%>/crm/customer">Gestisci &#8594;</a>
        </div>
        <div class="dash">
            <h4>Gestione Categorie</h4>
            <p>N° Categorie: <%=request.getAttribute("numeroCategorie")%></p>
            <a href="<%=request.getContextPath()%>/crm/category">Gestisci &#8594;</a>
        </div>
        <div class="dash">
            <h4>Gestione Prodotti</h4>
            <p>N° Prodotti: <%=request.getAttribute("numeroProdotti")%></p>
            <a href="<%=request.getContextPath()%>/crm/product">Gestisci &#8594;</a>
        </div>


    </section>
</main>
<jsp:include page="/WEB-INF/views/partials/footer.jsp">
    <jsp:param name="title" value=""/>
</jsp:include>
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
