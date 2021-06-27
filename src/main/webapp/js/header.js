function navResponsive() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

function enterKey(){
    $("#search").keypress(function(event) {
        if (event.keyCode === 13) {
            search();
        }
    });
}

function search(){
    var x=document.getElementById("search").value;
    var xmlhttp= new XMLHttpRequest();
    xmlhttp.onreadystatechange= function() {
        if (this.readyState==4 && this.status==200){
            searchDB(this);
        }
    };
    xmlhttp.open("GET","/AVAClothing_war_exploded/JSON?data="+x,true);
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

function hiddenSearch(){
    $("#demo").hide();
}

function showSearch(){
    $("#demo").show();
}