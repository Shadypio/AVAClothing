<header class=" navbar align-center">
    <nav class="grid-inline align-center">
        <img src="<%=request.getContextPath()%>/img/logo.png" width="100" height="115">
        <a href="<%=request.getContextPath()%>/index.jsp">Home</a>
        <div class="dropdown">
            <button class="dropbtn">Prodotti <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/uomo.jsp">Uomo</a>
                <a href="${pageContext.request.contextPath}/donna.jsp">Donna</a>
            </div>
        </div>
        <a href="#">Info</a>
        <div class="grid-inline align-center icons">
            <div class="dropdown">
                <button class="dropbtn"><img src="<%=request.getContextPath()%>/icons/user.png" width="30" height="30"></button>
                <div class="dropdown-content">
                    <a href="<%=request.getContextPath()%>/cliente/secret">Login Admin</a>
                    <a href="<%=request.getContextPath()%>/cliente/signup">Registrazione Nuovo utente</a>
                    <a href="<%=request.getContextPath()%>/cliente/signin">Login utente</a>
                </div>
            </div>
            <img src="<%=request.getContextPath()%>/icons/shopping-cart.png" width="30" height="30">
        </div>
    </nav>
</header>