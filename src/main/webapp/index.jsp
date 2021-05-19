<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="AVAClothing"/>
    </jsp:include>
</head>
<body>
<% response.sendRedirect("./cliente/secret");%>
</body>
</html>