<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="notification" ${alert.type}>
    <ol class="cell">
        <c:forEach var="msg" items="${alert.messages}">
            <li>${msg}</li>
        </c:forEach>
    </ol>
    <span id="notification-close" class="close">
        <%--include file x.svg--%>
    </span>
</div>