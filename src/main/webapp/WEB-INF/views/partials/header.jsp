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
        <input type="search" name="search" id="search" placeholder="Ricerca"/><button onclick="search()" name="cerca">Cerca</button>
        <div id="demo" hidden></div>
        <div class="iconWrapper">
            <div class="dropdown">
                <button class="dropbtn"><img src="<%=request.getContextPath()%>/icons/user.png" width="15" height="15"></button>
                <div class="dropdown-content">
                    <a href="<%=request.getContextPath()%>/cliente/secret">Login Admin</a>
                    <a href="<%=request.getContextPath()%>/cliente/signup">Registrati</a>
                    <a href="<%=request.getContextPath()%>/cliente/sign">Login Utente</a>
                </div>
            </div>
            <a href="<%=request.getContextPath()%>/cliente/carrello" class="carrello"><img src="<%=request.getContextPath()%>/icons/shopping-cart.png" width="15" height="15"></a>
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

        function search(){
           var x=document.getElementById("search").value;
           var xmlhttp= new XMLHttpRequest();
           xmlhttp.onreadystatechange= function() {
               if (this.readyState==4 && this.status==200){
                   searchDB(this);
               }
           };
           xmlhttp.open("GET","JSON?data="+x,true);
           xmlhttp.send();
        }

        function searchDB(xmlhttp){
            var result=JSON.parse(xmlhttp.responseText);
            let text;
            text="<div class='dropdown-search'>";
            for (let i in result){
                var x=JSON.stringify(result[i].nome);
                var y=JSON.stringify(result[i].idProdotto);
                idp = eval(y);
                text+="<a href='/AVAClothing_war_exploded/cliente/product?id="+idp+"'>";
                text+=x+"</a>";
            }
            text+="</div>";
            document.getElementById("demo").hidden=false;
            document.getElementById("demo").innerHTML= text;//id elemento
        }

    </script>
</header>