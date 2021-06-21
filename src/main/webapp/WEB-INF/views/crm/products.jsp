<%@ page import="model.prodotto.ProdottoDAO" %>
<%@ page import="model.prodotto.Prodotto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/views/partials/head.jsp">
        <jsp:param name="title" value="Gestione Prodotti"/>
        <jsp:param name="styles" value="crm,dashboard"/>
        <jsp:param name="scripts" value="crm,dashboard"/>
    </jsp:include>
    <link href="<%=request.getContextPath()%>/css/crm.css" type="text/css" rel="stylesheet">

</head>
<body>
<main class="app">
    <aside class="sidebar" id="sideBar">
        <nav class="grid-y align-center">
            <img src="/AVAClothing_war_exploded/img/logo.png" width="100" height="115">
            <a href="/AVAClothing_war_exploded/crm/dashboard">Dashboard</a>
            <a href="/AVAClothing_war_exploded/crm/profile">Profilo</a>
            <a href="/AVAClothing_war_exploded/crm/customer">Gestione Clienti</a>
            <a href="/AVAClothing_war_exploded/crm/order">Gestione Ordini</a>
            <a href="/AVAClothing_war_exploded/crm/product">Gestione Prodotti</a>
            <a href="/AVAClothing_war_exploded/crm/category">Gestione Categorie</a>
            <a href="/AVAClothing_war_exploded/crm/logout">Logout</a>
        </nav>
    </aside>
    <section class="content grid-y" id="main">
        <div>
            <button class="openbtn" onclick="toggleNav()"><img src="/AVAClothing_war_exploded/icons/menu.png"></button>
        </div>
        <table class="allProducts" style="overflow: auto">
            <tr>
                <th>Immagine</th>
                <th>ID Prodotto</th>
                <th>Nome</th>
                <th>Prezzo</th>
                <th>Quantita</th>
                <th>Descrizione Breve</th>
                <th>in Offerta</th>
                <th>ID Categoria</th>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>1</td>
                <td>T-Shirt bianca</td>
                <td>13.0</td>
                <td>5</td>
                <td>T-Shirt di colore bianco, taglia small, fresca, estiva</td>
                <td>false</td>
                <td>1</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>2</td>
                <td>T-Shirt rosa</td>
                <td>11.0</td>
                <td>10</td>
                <td>T-Shirt di colore rosa, taglia medium</td>
                <td>false</td>
                <td>1</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>3</td>
                <td>T-Shirt nera</td>
                <td>8.0</td>
                <td>8</td>
                <td>T-Shirt di colore nero, taglia large</td>
                <td>false</td>
                <td>1</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>4</td>
                <td>Pantaloni blu scuro</td>
                <td>18.0</td>
                <td>14</td>
                <td>Pantaloni di colore blu scuro, lunghi, skinny</td>
                <td>false</td>
                <td>2</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>5</td>
                <td>Shorts verdi</td>
                <td>17.0</td>
                <td>9</td>
                <td>Pantaloni di colore verde, corti</td>
                <td>false</td>
                <td>2</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>6</td>
                <td>Jeans semplici, scuri</td>
                <td>20.0</td>
                <td>12</td>
                <td>Jeans di colore scuro, lunghi, comodi</td>
                <td>false</td>
                <td>2</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>7</td>
                <td>Jeans semplici</td>
                <td>20.0</td>
                <td>6</td>
                <td>Jeans semplici, lunghi, dritti</td>
                <td>false</td>
                <td>2</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>8</td>
                <td>Sneakers bianche</td>
                <td>20.0</td>
                <td>18</td>
                <td>Sneakers di colore bianco</td>
                <td>false</td>
                <td>3</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>9</td>
                <td>Scarpe nere</td>
                <td>40.0</td>
                <td>14</td>
                <td>Scarpe di colore nero, modello derby</td>
                <td>false</td>
                <td>3</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>10</td>
                <td>Sneakers slip-on</td>
                <td>25.0</td>
                <td>8</td>
                <td>Sneakers slip on di colore nero</td>
                <td>false</td>
                <td>3</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>11</td>
                <td>Sneakers alte</td>
                <td>30.0</td>
                <td>20</td>
                <td>Sneakers alte di colore nero e bianco</td>
                <td>false</td>
                <td>3</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>12</td>
                <td>Berretto giallo</td>
                <td>8.0</td>
                <td>13</td>
                <td>Berretto giallo con ricamo</td>
                <td>false</td>
                <td>4</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>13</td>
                <td>Cappello in paglia</td>
                <td>8.0</td>
                <td>7</td>
                <td>Cappello in paglia</td>
                <td>false</td>
                <td>4</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>14</td>
                <td>Occhiali da sole</td>
                <td>15.0</td>
                <td>11</td>
                <td>Occhiali da sole polarizzati</td>
                <td>false</td>
                <td>4</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>15</td>
                <td>Bretelle</td>
                <td>7.0</td>
                <td>6</td>
                <td>Bretelle blu scuro</td>
                <td>false</td>
                <td>4</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>16</td>
                <td>Felpa Star Wars</td>
                <td>20.0</td>
                <td>8</td>
                <td>Felpa regular fit di colore bianco</td>
                <td>false</td>
                <td>5</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>17</td>
                <td>Felpa semplice</td>
                <td>20.0</td>
                <td>4</td>
                <td>Felpa grigio chiaro</td>
                <td>false</td>
                <td>5</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>18</td>
                <td>Felpa verde scuro</td>
                <td>10.0</td>
                <td>7</td>
                <td>Felpa grigio chiaro</td>
                <td>false</td>
                <td>5</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>19</td>
                <td>Maglia sportiva</td>
                <td>25.0</td>
                <td>17</td>
                <td>Maglia sportiva grigio scuro</td>
                <td>false</td>
                <td>5</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>20</td>
                <td>Camicia in lino</td>
                <td>30.0</td>
                <td>10</td>
                <td>Camicia in lino bianca</td>
                <td>false</td>
                <td>6</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>21</td>
                <td>Camicia nera Slim fit</td>
                <td>20.0</td>
                <td>13</td>
                <td>Camicia di colore nero</td>
                <td>false</td>
                <td>6</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>22</td>
                <td>Camicia hawaiana</td>
                <td>15.0</td>
                <td>8</td>
                <td>Camicia hawaiana con stampa</td>
                <td>false</td>
                <td>6</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>23</td>
                <td>Camicia in cotone</td>
                <td>13.0</td>
                <td>14</td>
                <td>Camicia in cotone Regular fit</td>
                <td>false</td>
                <td>6</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>24</td>
                <td>Top corto</td>
                <td>10.0</td>
                <td>5</td>
                <td>Top corto marrone.</td>
                <td>false</td>
                <td>7</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>25</td>
                <td>Top ricamato</td>
                <td>11.0</td>
                <td>10</td>
                <td>Top ricamato senza maniche bianco</td>
                <td>false</td>
                <td>7</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>26</td>
                <td>Maglietta basic</td>
                <td>8.0</td>
                <td>8</td>
                <td>Maglietta basic viola tessuto quadrettato.</td>
                <td>false</td>
                <td>7</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>27</td>
                <td>Pantaloni larghi</td>
                <td>26.0</td>
                <td>14</td>
                <td>Pantaloni larghi vita alta – Cotone organico, bianco</td>
                <td>false</td>
                <td>8</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>28</td>
                <td>Pantaloni morbidi</td>
                <td>20.0</td>
                <td>9</td>
                <td>Pantaloni morbidi con stampa fantasia</td>
                <td>false</td>
                <td>8</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>29</td>
                <td>Gonna midi</td>
                <td>20.0</td>
                <td>12</td>
                <td>Gonna midi stampata arricciatura fantasia</td>
                <td>false</td>
                <td>8</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>30</td>
                <td>Gonna midi</td>
                <td>20.0</td>
                <td>6</td>
                <td>Gonna midi stampa corallo</td>
                <td>false</td>
                <td>8</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>31</td>
                <td>Sneakers bianche</td>
                <td>40.0</td>
                <td>18</td>
                <td>Sneakers di colore bianco</td>
                <td>false</td>
                <td>9</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>32</td>
                <td>Sandali con tacco e fascette</td>
                <td>20.0</td>
                <td>14</td>
                <td>Sandali con tacco e fascette di colore bianco</td>
                <td>false</td>
                <td>9</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>33</td>
                <td>Stivaletti bassi</td>
                <td>40.0</td>
                <td>8</td>
                <td>Stivaletti bassi in pelle stringati di colore nero</td>
                <td>false</td>
                <td>9</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>34</td>
                <td>Sneakers casual</td>
                <td>30.0</td>
                <td>20</td>
                <td>Sneakers di colore bianco con stampa</td>
                <td>false</td>
                <td>9</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>35</td>
                <td>Elastico</td>
                <td>6.0</td>
                <td>13</td>
                <td>Elastico per capelli</td>
                <td>false</td>
                <td>10</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>36</td>
                <td>Anelli</td>
                <td>8.0</td>
                <td>7</td>
                <td>Pacco da 4 anelli</td>
                <td>false</td>
                <td>10</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>37</td>
                <td>Occhiali da sole</td>
                <td>15.0</td>
                <td>11</td>
                <td>Occhiali da sole cat eye menta</td>
                <td>false</td>
                <td>10</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>38</td>
                <td>Orecchini</td>
                <td>4.0</td>
                <td>6</td>
                <td>Orecchini delfini</td>
                <td>false</td>
                <td>10</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>39</td>
                <td>Felpa verde</td>
                <td>26.0</td>
                <td>8</td>
                <td>Felpa color block malva verde</td>
                <td>false</td>
                <td>11</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>40</td>
                <td>Felpa college</td>
                <td>20.0</td>
                <td>4</td>
                <td>Felpa grigia stile college logo</td>
                <td>false</td>
                <td>11</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>41</td>
                <td>Felpa con stampa</td>
                <td>30.0</td>
                <td>7</td>
                <td>Felpa tie-dye verde stampa grafica stile college</td>
                <td>false</td>
                <td>11</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>42</td>
                <td>Felpa oversize</td>
                <td>26.0</td>
                <td>17</td>
                <td>Felpa oversize arancione ricamo</td>
                <td>false</td>
                <td>11</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>43</td>
                <td>Camicia popeline</td>
                <td>20.0</td>
                <td>10</td>
                <td>Camicia popeline rosa maniche lunghe</td>
                <td>false</td>
                <td>12</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>44</td>
                <td>Camicia a tunica</td>
                <td>20.0</td>
                <td>13</td>
                <td>Camicia a tunica stampata viola</td>
                <td>false</td>
                <td>12</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>45</td>
                <td>Camicia morbida a righe</td>
                <td>15.0</td>
                <td>8</td>
                <td>Camicia morbida a righe azzurra</td>
                <td>false</td>
                <td>12</td>
            </tr>

            <tr>
                <td><img src="data:image/jpg;base64," width="80" height="100"></td>
                <td>46</td>
                <td>Camicia popeline</td>
                <td>26.0</td>
                <td>14</td>
                <td>Camicia popeline taschino bianco</td>
                <td>false</td>
                <td>12</td>
            </tr>

        </table>
        <div>
            <button class="butAdd btn primary">Aggiungi Prodotto</button> <!--Button Add-->

            <form action="/AVAClothing_war_exploded/crm/deletepro" method="post">
                <select name="selezioneDelete" id="selectedDel">

                    <option>1 </option>

                    <option>2 </option>

                    <option>3 </option>

                    <option>4 </option>

                    <option>5 </option>

                    <option>6 </option>

                    <option>7 </option>

                    <option>8 </option>

                    <option>9 </option>

                    <option>10 </option>

                    <option>11 </option>

                    <option>12 </option>

                    <option>13 </option>

                    <option>14 </option>

                    <option>15 </option>

                    <option>16 </option>

                    <option>17 </option>

                    <option>18 </option>

                    <option>19 </option>

                    <option>20 </option>

                    <option>21 </option>

                    <option>22 </option>

                    <option>23 </option>

                    <option>24 </option>

                    <option>25 </option>

                    <option>26 </option>

                    <option>27 </option>

                    <option>28 </option>

                    <option>29 </option>

                    <option>30 </option>

                    <option>31 </option>

                    <option>32 </option>

                    <option>33 </option>

                    <option>34 </option>

                    <option>35 </option>

                    <option>36 </option>

                    <option>37 </option>

                    <option>38 </option>

                    <option>39 </option>

                    <option>40 </option>

                    <option>41 </option>

                    <option>42 </option>

                    <option>43 </option>

                    <option>44 </option>

                    <option>45 </option>

                    <option>46 </option>

                </select>
                <button type="submit" class="butDel btn primary">Elimina Prodotto</button> <!--Button Delete-->
            </form>
            <form action="/AVAClothing_war_exploded/crm/updatepro" method="post" name="up">
                <select name="selezioneMod" id="selectedMod">

                    <option>1 </option>

                    <option>2 </option>

                    <option>3 </option>

                    <option>4 </option>

                    <option>5 </option>

                    <option>6 </option>

                    <option>7 </option>

                    <option>8 </option>

                    <option>9 </option>

                    <option>10 </option>

                    <option>11 </option>

                    <option>12 </option>

                    <option>13 </option>

                    <option>14 </option>

                    <option>15 </option>

                    <option>16 </option>

                    <option>17 </option>

                    <option>18 </option>

                    <option>19 </option>

                    <option>20 </option>

                    <option>21 </option>

                    <option>22 </option>

                    <option>23 </option>

                    <option>24 </option>

                    <option>25 </option>

                    <option>26 </option>

                    <option>27 </option>

                    <option>28 </option>

                    <option>29 </option>

                    <option>30 </option>

                    <option>31 </option>

                    <option>32 </option>

                    <option>33 </option>

                    <option>34 </option>

                    <option>35 </option>

                    <option>36 </option>

                    <option>37 </option>

                    <option>38 </option>

                    <option>39 </option>

                    <option>40 </option>

                    <option>41 </option>

                    <option>42 </option>

                    <option>43 </option>

                    <option>44 </option>

                    <option>45 </option>

                    <option>46 </option>

                </select>
                <button class="butMod btn primary" type="button">Modifica Prodotto</button><!--Button Modify-->
                <div class="modPro" name="upp">
                    <!--Al click Form Modify-->
                </div>
            </form>

        </div>
        <form action="/AVAClothing_war_exploded/crm/addpro" method="post" >
            <div class="newPro">
                <!--Al click Form Add-->
            </div>
        </form>
    </section>
</main>
<footer class="info">
    Copyright 2021, AVAClothing - Tutti i diritti riservati
</footer>
<script>
    let status = false;
    function toggleNav(){
        if(status) {
            document.getElementById("sideBar").style.width = "0";
            document.getElementById("main").style.marginLeft = "0";
            status = false;
        }else{
            document.getElementById("sideBar").style.width = "250px";
            document.getElementById("main").style.marginLeft = "250px";
            status = true;
        }
    }

    $(document).ready(function() {
        $(".butAdd").click(function () {
            $(".allProducts").hide();
            $(".newPro").show().html("<fieldset>  <legend>Aggiungi Prodotto</legend> <span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Prezzo: </span> <input type='text' name='prezzo' id='prezzo' placeholder='Prezzo'> <br>" +
                "<span> Descrizione Breve: </span> <input type='text' name='descBreve' id='descBreve' placeholder='Descrizione Breve'><br>" +
                "<span> Descrizione Dettagliata: </span> <input type='text' name='descDett' id='descDett' placeholder='Descrizione Dettagliata'><br>" +
                "<span> In Offerta: </span> <select name='offerta'> <option>true</option> <option>false</option> </select> <br>" +
                "<span> Quantità: </span> <input type='text' name='quantita' id='quantita' placeholder='Quantità'> <br>" +
                "<span> ID Prodotto: </span> <input type='text' name='idPro' id='idPro' placeholder='ID Prodotto'> <br>" +
                "<span> ID Categoria: </span> <input type='text' name='idCat' id='idCat' placeholder='ID Categoria'> <br>" +
                "<span> ID Magazzino: </span> <input type='text' name='idMag' id='idMag' placeholder='ID Magazzino'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button> " +
                "<button class='btn primary' type='button' id='annulla'>Annulla</button> </fieldset>");
            $("#annulla").click(function () {
                $(".allProducts").show();
                $(".newPro").hide();
            });
        });
        $(".butMod").click(function () {
            $(".modPro").show().html("<fieldset> <legend>Modifica Prodotto</legend><span> Nome: </span> <input type='text' name='nome' id='nome' placeholder='Nome'> <br> " +
                "<span> Prezzo: </span> <input type='text' name='prezzo' id='prezzo' placeholder='Prezzo'> <br>" +
                "<span> Descrizione Breve: </span> <input type='text' name='descB' id='descB' placeholder='Descrizione Breve'> <br>" +
                "<span> Descrizione Dettagliata: </span> <input type='text' name='descD' id='descD' placeholder='Descrizione Dettagliata'> <br>" +
                "<span> In Offerta: </span> <select name='offerta'> <option>true</option> <option>false</option> </select> <br>" +
                "<span> Quantità: </span> <input type='text' name='quantita' id='quantita' placeholder='Quantità'> <br>" +
                "<span> ID Categoria: </span> <input type='text' name='idCat' id='idCat' placeholder='ID Categoria'> <br>" +
                "<span> ID Magazzino: </span> <input type='text' name='idMag' id='idMag' placeholder='ID Magazzino'> <br>" +
                "<button class='btn primary' type='submit'>Salva</button>" +
                "<button class='btn primary' type='button' id='annulla2'>Annulla</button> </fieldset>")
            $("#annulla2").click(function () {
                $(".modPro").hide();
            });
        });
    });
</script>
</body>
</html>