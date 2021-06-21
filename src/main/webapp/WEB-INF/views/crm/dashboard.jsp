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
    <style>
        .dash {
            display: flex;
            position: relative;
            flex-direction: column;
            align-items: center;
            border: solid 5px var(--cream);
            border-radius: 10px;
            width: 50%;
            float: left;
            background-color: var(--darkcream);
            margin: 0 auto;
            padding: 24px;
            box-sizing: border-box;
        }

        @media screen and (max-width: 768px){
            .dash {
                display: flex;
                position: relative;
                align-items: center;
                border: solid 5px var(--cream);
                border-radius: 5px;
                width: 100%;
                background-color: var(--darkcream);
                padding: 24px;
                box-sizing: border-box;
                margin: 0 auto;
            }
        }

        .dash:link{
            background-color: var(--darkcream);
        }

        .dash:visited{
            background-color: var(--darkcream);
        }

        .dash:hover{
            background-color: var(--darkred);
            color: var(--cream);
            cursor: pointer;
        }

        .dash:active{
            background-color: var(--red);
            cursor: pointer;
        }
    </style>

</head>

<body style="background-color: var(--cream)">
<main class="app ">

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

    <section class="content grid-y" id="main">
        <div>
            <div>
                <button class="openbtn" onclick="toggleNav()"><img src="/AVAClothing_war_exploded/icons/menu.png"></button>
            </div>

            <div class="dash" onclick="window.open('/AVAClothing_war_exploded/crm/order', '_self');">
                <h4>Gestione Ordini</h4>
                <p>N° Ordini: 4</p>
            </div>
            <div class="dash" onclick="window.open('/AVAClothing_war_exploded/crm/customer', '_self');">
                <h4>Gestione Clienti</h4>
                <p>N° Cliente: 4</p>
            </div>
            <div class="dash" onclick="window.open('/AVAClothing_war_exploded/crm/category', '_self');">
                <h4>Gestione Categorie</h4>
                <p>N° Categorie: 12</p>
            </div>
            <div class="dash" onclick="window.open('/AVAClothing_war_exploded/crm/product', '_self');">
                <h4>Gestione Prodotti</h4>
                <p>N° Prodotti: 46</p>
            </div>

            <footer class="info grid-y">
                <div>Copyright 2021, AVAClothing</div>
            </footer>

        </div>
    </section>
</main>



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

    function modify(){
        document.getElementsByTagName("input").readOnly = true
    }
</script>

</body>
</html>
