<%@ page import="model.cliente.Cliente" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/footer.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Login Utente"/>
    </jsp:include>
    <style>
        body{
            background-color: var(--cream);
        }
    </style>
</head>
    <body>
    <jsp:include page="/WEB-INF/views/partials/headerLoggato.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <br>
    <section class="content grid-y" id="main">
        <fieldset class="grid-y cell w50 login">
            <legend> Profilo: </legend>
            <form action="${pageContext.request.contextPath}/cliente/update" method="post" class="agg">
                <%Cliente c= (Cliente) session.getAttribute("profilo");%>
                <span>ID: </span>
                <input type="hidden" name="id" value="<%=c.getIdCliente()%>">
                <span>Nome: </span>
                <input type="text" value="<%=c.getNome()%>" readonly name="nome"><br>
                <span>Cognome: </span>
                <input type="text" value="<%=c.getCognome()%>" readonly name="cognome"><br>
                <span>Email: </span>
                <input type="text" value="<%=c.getEmail()%>" readonly name="email"><br>
                <span>Username: </span>
                <input type="text" value="<%=c.getUsername()%>" readonly name="username"><br>
                <span>Password: </span>
                <input type="password" value="<%=c.getPassword()%>" readonly name="password"><br>
                <span>Indirizzo: </span>
                <input type="text" value="<%=c.getIndirizzo()%>" readonly name="indirizzo"><br>
                <span>Telefono: </span>
                <input type="text" value="<%=c.getTelefono()%>" readonly name="telefono"><br><br>
                <button type="submit" onclick="salva()" class="btn primary">Salva</button>
                <button type="button" id="mod" class="btn primary">Modifica</button>
            </form>
            <!--<button type="button" id="riduci" class="btn primary">Mostra Profilo</button>-->
        </fieldset>
    </section>

    <section class="content grid-y" id="main">
        <fieldset>
            <legend> Ordini: </legend>
            <table class="allOrders">
                <tr>
                    <th>ID Ordine</th>
                    <th>Data Inserimento</th>
                    <th>IVA</th>
                </tr>
                <c:forEach var="order" items="${listaOrd}">
                    <tr>
                        <td>${order.idOrdine}</td>
                        <td>${order.dataInserimento}</td>
                        <td>${order.iva}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
    </section>
    <!--<button class="btn primary" id="showOrdini">Mostra Ordini</button>
           AGGIUNGI BOTTONE RIMUOVI ORDINE-->
    <script>

        $(document).ready(function(){
            $("#mod").click(function(){
                $("input").removeAttr("readonly");
            })
        });

        $(document).ready(function(){
            $("#riduci").click(function(){
                $(form).toggle();
            })
        });
        $(document).ready(function(){
            $("#showOrdini").click(function(){
                $(table).toggle();
            })
        });

    </script>
    </body>
</html>

