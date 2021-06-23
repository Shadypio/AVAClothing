<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value="/css/index.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Home Page"/>
    </jsp:include>
</head>
<body>
<main>
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

    <div class="slideshow-container">
        <div class="mySlides">
            <img src="<%=request.getContextPath()%>/img/cop1.jpeg" style="width: 100%;">
            <div class="text">Caption Text</div>
        </div>

        <div class="mySlides">
            <img src="<%=request.getContextPath()%>/img/cop2.jpeg" style="width: 100%;">
            <div class="text">Caption Two</div>
        </div>

        <div class="mySlides">
            <img src="<%=request.getContextPath()%>/img/cop3.jpeg" style="width: 100%;">
            <div class="text">Caption Three</div>
        </div>
    </div>
    <div style="text-align:center; background-color: var(--cream);">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
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
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }
</script>
</script>
</body>
</html>