<header class=" navbar align-center">

    <div class="topnav" id="myTopnav">
        <a href="<%=request.getContextPath()%>/index.jsp" class="active">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Prodotti
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="content-product">
                <a href="<%=request.getContextPath()%>/prodotto/prodottouomo">Uomo</a>
                <a href="<%=request.getContextPath()%>/prodotto/prodottodonna">Donna</a>
            </div>
        </div>
        <a href="<%=request.getContextPath()%>/info.jsp">Info</a>
        <div class="iconWrapper">
            <div class="dropdown user">
                <button class="dropbtn"><img src="<%=request.getContextPath()%>/icons/user.png" width="15" height="15">
                </button>
                <div class="dropdown-content">
                    <a href="<%=request.getContextPath()%>/cliente/secret">Login Admin</a>
                    <a href="<%=request.getContextPath()%>/cliente/signup">Registrati</a>
                    <a href="<%=request.getContextPath()%>/cliente/signin">Login Utente</a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/cliente/carrello" class="carrello"><img
                    src="<%=request.getContextPath()%>/icons/shopping-cart.png" width="15" height="15"></a>
        </div>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">&#9776;</a>
    </div>

    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
</header>