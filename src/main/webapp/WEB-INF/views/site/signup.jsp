<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="<c:url value="/css/navbar.css"/>" rel="stylesheet">
    <link href="<c:url value="/css/sign.css"/>" rel="stylesheet">
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Registrazione Utente"/>
    </jsp:include>

    <style>
        .inner{
            background-color:var(--cream);
            border:5px solid var(--darkcream);
            margin:25px;
            padding:25px;
            width: 300px;
            display: none;
            position: absolute;
            right: 100%
        }

        #info {
            display: none;
            font-size: 15px;
            color: var(--darkcream);
        }

    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
        <jsp:param name="title" value=""/>
    </jsp:include>
    <h3>Registrazione Utente</h3>
    <form class="app justify-center align-center grid-x" action="${pageContext.request.contextPath}/cliente/create"  method="post" onsubmit="return comparePasswords()">
        <div class="imgcontainer">
            <img src="<%=request.getContextPath()%>/img/logo.png" class="avatar"/>
        </div>
        <fieldset class="grid-y cell w50 login">
            <span> Nome </span>
            <label for="nome" class="field">
                <input type="text" name="nome" id="nome" placeholder="Nome" required>
            </label>

            <span> Cognome </span>
            <label for="cognome" class="field">
                <input type="text" name="cognome" id="cognome" placeholder="Cognome" required>
            </label>

            <span> Username </span>
            <label for="username" class="field">
                <input type="text" name="username" id="username" placeholder="Username" required>
            </label>

            <span> Email </span>
            <label for="email" class="field">
                <input type="email" name="email" id="email" placeholder="Email">
            </label>

            <span> Password </span>
            <label for="password" class="field">
                <input onfocusout="hideInfoPassword()" onfocusin="showInfoPassword()" type="password" name="password" id="password" placeholder="Password" required><br>
            </label>
                <div class="inner" id="inner">
                    <div id="info">La password deve essere lunga almeno 8 caratteri, deve contenere almeno una minuscola,
                    una maiuscola, un numero e un carattere speciale</div>
                </div>

            <span>Conferma  Password </span>
            <label for="confermapassword" class="field">
                <input type="password" name="confermapassword" id="confermapassword" placeholder="Conferma Password" required><br>
            </label>

            <span> Indirizzo </span>
            <label for="indirizzo" class="field">
                <input type="text" name="indirizzo" id="indirizzo" placeholder="Indirizzo" required>
            </label>

            <span> Telefono </span>
            <label for="telefono" class="field">
                <input type="text" name="telefono" id="telefono" placeholder="Telefono" required>
            </label>

            <button class="btn primary" type="submit">Registrati</button>
        </fieldset>
    </form>

<script>
    function showInfoPassword(){
        var x = document.getElementById("info")
        x.style.display = "block"

        var y = document.getElementById("inner");
        y.style.display = "block"

        /**
         * REGEX FOR THIS PASSWORD
         * ^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&? "]).*$
         * ---

         ^.*              : Start
         (?=.{8,})        : Length
         (?=.*[a-zA-Z])   : Letters
         (?=.*\d)         : Digits
         (?=.*[!#$%&? "]) : Special characters
         .*$              : End

         OPPURE

         /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/
         ---

         (/^
         (?=.*\d)                //should contain at least one digit
         (?=.*[a-z])             //should contain at least one lower case
         (?=.*[A-Z])             //should contain at least one upper case
         [a-zA-Z0-9]{8,}         //should contain at least 8 from the mentioned characters

         $/)
         */
    }

    function hideInfoPassword(){
        document.getElementById("inner").style.display = "none"
    }

    function comparePasswords(){
        var x = $('#password').val();
        var y = $('#confermapassword').val();

        if(x === y) {
            return true
        }
        else {
            alert('Le password non corrispondono')
            return false
        }

    }
</script>
</body>
</html>
