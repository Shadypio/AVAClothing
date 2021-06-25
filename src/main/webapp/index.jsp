<%@ page import="model.prodotto.ProdottoDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.prodotto.Prodotto" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/prodotti.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Home Page"/>
    </jsp:include>
    <c:choose>
        <c:when test="${log}">
            <jsp:include page="/WEB-INF/views/partials/headerLoggato.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/partials/header.jsp">
                <jsp:param name="title" value=""/>
            </jsp:include>
        </c:otherwise>
</c:choose>

    <style>
        h2 {
            font-family: Raleway;
            color: var(--darkcream);
            position: center;
        }
    </style>
</head>
<body>
<main>
    <div class="slideshow-container">
        <div class="mySlides">
            <img class="imageShow" src="<%=request.getContextPath()%>/img/cop1.jpg" style="width: 100%;">
            <div class="text"><!--Inserire testo--></div>
        </div>

        <div class="mySlides">
            <img class="imageShow" src="<%=request.getContextPath()%>/img/cop2.jpg" style="width: 100%;">
            <div class="text"><!--Inserire testo--></div>
        </div>

        <div class="mySlides">
            <img class="imageShow" src="<%=request.getContextPath()%>/img/cop3.jpg" style="width: 100%;">
            <div class="text"><!--Inserire testo--></div>
        </div>
    </div>
    <div class="main-text">
        <div>
            <h1>AVA CLOTHING</h1>
        </div>
    </div>
    <div style="text-align:center; background-color: var(--cream);">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>

    <%ProdottoDAO proDAO=new ProdottoDAO();
      ArrayList<Prodotto> offerta=proDAO.doRetrieveProdottiinOfferta();%>
      <div class="saldi">
          <h2>Prodotti in offerta</h2>
          <%for (int i=0; i<offerta.size(); i++){ %>
            <div class="card">
                <img src="data:image/jpg;base64,<%=offerta.get(i).getBase64Image()%>" width="350" height="370">
                <span>Nome: <%=offerta.get(i).getNome()%></span><br>
                <span>Prezzo: <%=offerta.get(i).getPrezzo()%></span><br>
                <span>Descrizione Dettagliata: <%=offerta.get(i).getDescrizioneDettagliata()%></span><br>
                <span>Quantità: <%=offerta.get(i).getQuantita()%></span>
            </div>
          <%}%>
      </div>

</main>

<script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 4000);
    }
</script>
</body>
</html>