<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>${param.title}</title>
<meta name="description" content="Ecommerce Clothing">
<link rel="icon" type="image/png" href="img/logo.jpg">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone-no">
<meta name="apple-mobile-web-app-title" content="Ava Clothing">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<link rel="apple-touch-icon" href="img/logo.jpg">
<link rel="apple-touch-startup-image" href="img/logo.jpg">
<meta name="theme-color" content="#000000">
<link href="<c:url value="/css/reset.css"/>" rel="stylesheet">
<link href="<c:url value="/css/library.css"/>" rel="stylesheet">

<c:if test="${not empty param.style}">
    <link rel="stylesheet" href="css/${param.style}">
</c:if>
<script src="<c:url value="/js/library.js"/>" defer> </script>
<c:if test="${not empty param.script}">
    <script src="./js/${param.script}" defer></script>
</c:if>
