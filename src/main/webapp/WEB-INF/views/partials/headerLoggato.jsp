<header class=" navbar align-center">
    <nav class="grid-inline align-center">
        <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
        <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Prodotti </button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/prodotto/prodottouomo">Uomo</a>
                <a href="<%=request.getContextPath()%>/prodotto/prodottodonna">Donna</a>
            </div>
        </div>
        <a href="<%=request.getContextPath()%>/info.jsp">Info</a>
        <div class="grid-inline align-center icons">
            <div class="dropdown">
                <button class="dropbtn"><img src="<%=request.getContextPath()%>/icons/user.png" width="30" height="30"></button>
                <div class="dropdown-content">
                    <p> Bentornato ${profilo.nome} </p>
                    <a href="<%=request.getContextPath()%>/cliente/show">Gestione Profilo</a>
                    <a href="<%=request.getContextPath()%>/cliente/logout">Logout</a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/cliente/carrello">
                <img src="<%=request.getContextPath()%>/icons/shopping-cart.png" width="30" height="30">
            </a>
        </div>
    </nav>
</header>