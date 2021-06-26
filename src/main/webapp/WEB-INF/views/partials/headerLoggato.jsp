<header class=" navbar align-center">

    <div class="topnav" id="myTopnav">
        <a href="<%=request.getContextPath()%>/index.jsp" class="active">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Prodotti</button>
            <div class="content-product">
                <a href="<%=request.getContextPath()%>/prodotto/prodottouomo">Uomo</a>
                <a href="<%=request.getContextPath()%>/prodotto/prodottodonna">Donna</a>
            </div>
        </div>
        <a href="<%=request.getContextPath()%>/info.jsp">Info</a>
        <div class="search-bar" onmouseleave="hiddenSearch()" onmouseover="showSearch()">
            <input type="search" id="search" onkeyup="enterKey()" autocomplete="off">
            <i class="fa fa-search" onclick="search()"><img src="<%=request.getContextPath()%>/icons/search-512.webp"></i>
            <div id="demo" hidden></div>
        </div>
        <div class="iconWrapper">
            <div class="dropdown">
                <button class="dropbtn"><img src="<%=request.getContextPath()%>/icons/user.png" width="15" height="15"></button>
                <div class="dropdown-content">
                    <a href="#"> Bentornato ${profilo.nome} </a>
                    <a href="<%=request.getContextPath()%>/cliente/show">Gestione Profilo</a>
                    <a href="<%=request.getContextPath()%>/cliente/logout">Logout</a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/cliente/carrello"><img src="<%=request.getContextPath()%>/icons/shopping-cart.png" width="15" height="15"></a>
        </div>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
    </div>
</header>
