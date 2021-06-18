use avabase;

/* Categorie */
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('T-Shirts Uomo', 'Fai scorta di t-shirt da uomo online da AVAClothing. Rinnova il tuo guardaroba con t-shirt stampate con tanti motivi trendy e pattern per riflettere la tua personalita\'.', 1);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Pantaloni Uomo', 'La linea di pantaloni da Uomo include capi eleganti con tonalita\' dal chiaro al grigio scuro, capi casual con tasche laterali e da abbinare alle occasioni piu\' sportive.', 2);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Scarpe Uomo', 'Completa il tuo outfit con le nostre raffinate scarpe da uomo. Se cerchi dei modelli da indossare tutti i giorni, scopri tanti modelli di sneakers da uomo da infilare o da allacciare, sia minimal che in colori vivaci per adattarsi ai tuoi gusti.', 3);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Accessori Uomo', 'Crea un look elegante e raffinato grazie alla selezione di accessori da Uomo. Cinture, bretelle, gioielli, basta poco per riuscire a personalizzare ogni outfit con il tuo stile', 4);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Felpe Uomo', 'Aggiungi un tocco di calore al tuo guardaroba per tutti i giorni, con la nostra selezione di felpe con o senza cappuccio da uomo. Scopri giacche con cappuccio in colori neutri o felpe stampate con il tuo motivo preferito per il weekend.', 5);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Camicie Uomo', 'Rendi elegante il tuo look per tutti i giorni con le nostre camicie da uomo. Abbiamo camicie dalla linea slim o regular per adattarsi ai tuoi gusti e alle diverse occasioni.', 6);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Top Donna', 'La linea di top da Donna di AVAClothing include modelli per il lavoro e per il fine settimana. Facili da abbinare a una gonna elegante e un jeans casual. Trova il modello che meglio fa al caso tuo.', 7);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Pantaloni Donna e Gonne', 'Classici, moderni, basic e casual. I pantaloni e leggings da Donna di AVAClothing includono modelli adatti ad ogni stile e occasione. Aggiorna il tuo guardaroba con le tue gonne preferite.', 8);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Scarpe Donna', 'Regalati un paio di scarpe nuove: basse e comode o a tacco alto. Stivali, sandali eleganti o sneakers sportive.', 9);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Accessori Donna', 'La linea di accessori Donna include cinture scamosciate da annodare a un maxi pull in tinta unita per un look sbarazzino e alla moda.', 10);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Felpe Donna', 'Comoda e trendy. La felpa con o senza cappuccio è la scelta più cool per giornate di relax. Scopri tante stampe e modelli alla moda e aggiungi un tocco street-wear al tuo look!', 11);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Camicie Donna', 'Scopri le camicie e le bluse della nuova collezione Donna. Abbina una tunica lunga a un biker di pelle o indossa una camicia di jeans con un pantalone a palazzo in tinta unita.', 12);

/* Clienti */
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isAdmin, telefono, idCliente)values ('Mario', 'Rossi', 'mariorossi00@example.com', 'Mario00Rossi', SHA1('passwordMario'), 'Via Ponzio Pilato, 12, Milano', false, '3514235768', 1);
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isAdmin, telefono, idCliente)values ('Luca', 'Gialli', 'lucagialli98@example.com', 'Gialli_Luca98', SHA1('passwordLuca'), 'Via Giulio Cesare, 21, Roma', false, '3337756898', 2);
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isAdmin, telefono, idCliente)values ('Matteo', 'Neri', 'matteoneri89@example.com', 'MatteoNeri', SHA1('passwordMatteo'), 'Via Napoli, 58, Napoli', false, '3774621432', 3);
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isAdmin, telefono, idCliente) values ('Gennaro', 'Costagliola', 'gencos@unisa.it', 'admin', SHA1('admin'), 'Via Unisa, 10, Salerno', true, '3774621542', 4);

/* Magazzini */
insert into avabase.magazzino (Nome, Indirizzo, idMagazzino) values ('IlVestitoPerTe', 'Via Roma, 35, Napoli', 1);
insert into avabase.magazzino (Nome, Indirizzo, idMagazzino) values ('ClothesAndCo', 'Via Torino, 2, Napoli', 2);
insert into avabase.magazzino (Nome, Indirizzo, idMagazzino) values ('LaBoutique', 'Via Napoleone, 14, Napoli', 3);

/* T-Shirts uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt bianca', 12.52, 'T-Shirt di colore bianco, taglia small, fresca, estiva', 'T-shirt in jersey bianca di cotone. Maniche con risvolto cucito. Parte posteriore leggermente più lunga e arrotondata.', 0, 1, 1, 1, 5);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt rosa', 10.53, 'T-Shirt di colore rosa, taglia medium', 'T-shirt in morbido jersey di cotone con stampa. Scollo rotondo con bordo sottile.', 0, 2, 2, 1, 10);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt nera', 8, 'T-Shirt di colore nero, taglia large', 'T-shirt in morbido jersey di cotone con stampa. Scollo rotondo con bordo sottile.', 0, 3, 3, 1, 8);

/* Pantaloni uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Pantaloni blu scuro', 17.99, 'Pantaloni di colore blu scuro, lunghi, skinny', 'Chinos in twill di cotone super elasticizzato. Tasche laterali, tasche posteriori a filetto con bottone e taschina portamonete. Patta con cerniera.', 0, 4, 1, 2, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Shorts verdi', 16.99, 'Pantaloni di colore verde, corti', 'Shorts in tessuto di cotone. Elastico rivestito e coulisse in vita. Tasche laterali oblique, una tasca aperta dietro. Finta patta.', 0, 5, 2, 2, 9);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Jeans semplici, scuri', 19.99, 'Jeans di colore scuro, lunghi, comodi', 'Jeans a cinque tasche in denim. Vita normale, patta con cerniera e bottone. Gamba stretta. Garantiscono morbidezza, elasticità, massima libertà di movimento e comfort ottimale.', 0, 6, 1, 2, 12);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Jeans semplici', 19.99, 'Jeans semplici, lunghi, dritti', 'Jeans a 5 tasche in denim di cotone lavato. Vita normale e gamba ampia e dritta. Patta con cerniera e bottone. Realizzati in cotone parzialmente riciclato.', 0, 7, 3, 2, 6);

/* Scarpe uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers bianche', 19.99, 'Sneakers di colore bianco','Sneakers in finta pelle con bordo imbottito in alto. Linguetta e lacci davanti. Suola zigrinata in gomma.', 0, 8, 3, 3, 18);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Scarpe nere', 39.99, 'Scarpe di colore nero, modello derby','Scarpe modello derby con allacciatura aperta davanti. Fodera e soletta in tela. Tacco 2,5 cm.', 0, 9, 1, 3, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers slip-on', 25.50, 'Sneakers slip on di colore nero','Sneakers in tessuto. Elastico sui lati, passante dietro. Soletta in finto sughero, suola strutturata e antiscivolo, altezza 2 cm.', 0, 10, 1, 3, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers alte', 30.50, 'Sneakers alte di colore nero e bianco','Sneakers alte in consistente tela di cotone con motivo stampato e occhielli sui lati. Gambale alla caviglia, linguetta e lacci davanti. Fodera e soletta in tela di cotone. Suola 3 cm.', 0, 11, 2, 3, 20);

/* Accessori uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Berretto giallo', 7.99, 'Berretto giallo con ricamo','Berretto in twill di cotone con ricamo davanti. Fascetta regolabile con fibbia in metallo dietro.', 0, 12, 2, 4, 13);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Cappello in paglia', 7.99, 'Cappello in paglia','Cappello in paglia intrecciata con nastro in gross-grain attorno alla cupola. Fodera in mesh. Larghezza della tesa circa 4 cm.', 0, 13, 1, 4, 7);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Occhiali da sole', 14.99, 'Occhiali da sole polarizzati','Occhiali da sole con montatura in metallo e plastica. Lenti polarizzate con protezione UV.', 0, 14, 3, 4, 11);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Bretelle', 6.99, 'Bretelle blu scuro','Bretelle elastiche e regolabili con pinze in metallo e dettagli in finta pelle.', 0, 15, 2, 4, 6);

/* Felpe uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa Star Wars', 20.50, 'Felpa regular fit di colore bianco','Maglia in tessuto felpato con maniche lunghe. Cappuccio a due strati con coulisse e bordo anteriore incrociato. Tasca a marsupio davanti. Bordo a costine a fondo manica e in basso.', 0, 16, 1, 5, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa semplice', 20.50, 'Felpa grigio chiaro','Maglia in morbido tessuto felpato con linea casual e spalle basse. Bordi a costine sullo scollo, a fondo manica e in basso. Morbido interno spazzolato.', 0, 17, 3, 5, 4);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa verde scuro', 9.99, 'Felpa grigio chiaro','Maglia in morbido tessuto felpato con linea casual e spalle basse. Bordi a costine sullo scollo, a fondo manica e in basso. Morbido interno spazzolato.', 0, 18, 1, 5, 7);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Maglia sportiva', 24.99, 'Maglia sportiva grigio scuro','Maglietta sportiva in jersey consistente con dettagli nastrati. Cappuccio foderato in mesh e con coulisse. Maniche corte con fori di ventilazione sotto.', 0, 19, 1, 5, 17);

/* Camicie uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia in lino', 29.99, 'Camicia in lino bianca','Camicia in denim lavato. Colletto turn-down, abbottonatura alla francese. Maniche lunghe con bottone, abbottonatura regolabile sul polsino.', 0, 20, 3, 6, 10);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia nera Slim fit', 20.50, 'Camicia di colore nero','Camicia in tessuto con colletto cut-away e abbottonatura alla francese. Maniche lunghe, polsino con bottone. Carré dietro e bordo arrotondato in basso.', 0, 21, 2, 6, 13);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia hawaiana', 14.99, 'Camicia hawaiana con stampa','Camicia a maniche corte in tessuto con motivi stampati. Colletto bowling, abbottonatura alla francese, taschino sul petto.', 0, 22, 2, 6, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia in cotone', 12.99, 'Camicia in cotone Regular fit','Camicia a maniche corte in leggero tessuto di cotone. Colletto turn-down, bottoniera classica e un taschino sul petto.', 0, 23, 1, 6, 14);

/* Top donna */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Top corto', 9.99, 'Top corto marrone.', 'Top corot marrone con spalline sottili, scollo a v con dettagli in pizzo e orlo arricciato.', 0, 24, 1, 7, 5);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Top ricamato', 10.53, 'Top ricamato senza maniche bianco', 'Top senza maniche in tessuto cannete\' con ricamo anteriore a contrasto e collo rotondo a coste.', 0, 25, 2, 7, 10);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Maglietta basic', 8, 'Maglietta basic viola tessuto quadrettato.', 'Maglietta basic in tessuto quadrettato con collo rotondo e arricciature sulle maniche corte e sull’orlo. Realizzata in cotone e disponibile in diversi colori..', 0, 26, 3, 7, 8);

/* Pantaloni donna e gonne */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Pantaloni larghi', 25.99, 'Pantaloni larghi vita alta – Cotone organico, bianco', 'Pantaloni larghi a vita alta con cintura a contrasto, chiusura con cerniera e bottone, tasche e orli con risvolto.', 0, 27, 1, 8, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Pantaloni morbidi', 19.99, 'Pantaloni morbidi con stampa fantasia', 'Pantaloni morbidi stampati con bordura sull’orlo.', 0, 28, 2, 8, 9);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Gonna midi', 19.99, 'Gonna midi stampata arricciatura fantasia', 'Gonna midi stampata con arricciatura, vita aderente e spacco.', 0, 29, 1, 8, 12);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Gonna midi', 19.99, 'Gonna midi stampa corallo', 'Gonna midi stampata in tonalità corallo con fascette in vita e chiusura con cerniera. Realizzata in viscosa.', 0, 30, 3, 8, 6);

/* Scarpe donna */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers bianche', 39.99, 'Sneakers di colore bianco','Sneakers comode in edizione limitata. Altezza della suola 4cm.', 0, 31, 3, 9, 18);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sandali con tacco e fascette', 19.99, 'Sandali con tacco e fascette di colore bianco','Sandali freschi, adatti per le stagioni calde per un look estivo e alla moda.', 0, 32, 1, 9, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Stivaletti bassi', 39.99, 'Stivaletti bassi in pelle stringati di colore nero','Stivaletti bassi stringati in pelle nera. Chiusura con cerniera sulla parte interna. Suola track. Altezza della suola: 6,5 cm.', 0, 33, 1, 9, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers casual', 30.50, 'Sneakers di colore bianco con stampa','Sneakers casual bianche licenza Lilo & Stitch. Immagine multicolore laterale. Chiusura con lacci di colore sfumato rosa e blu. Altezza della suola: 3 cm.', 0, 34, 2, 9, 20);

/* Accessori donna */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Elastico', 5.99, 'Elastico per capelli','Elastico per capelli con fiocco e stampa paisley.', 0, 35, 2, 10, 13);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Anelli', 7.99, 'Pacco da 4 anelli','Pacco da 4 anelli in resina di vari colori con strass.', 0, 36, 1, 10, 7);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Occhiali da sole', 14.99, 'Occhiali da sole cat eye menta','Occhiali da sole cat eye color menta con lenti scure.', 0, 37, 3, 10, 11);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Orecchini', 3.99, 'Orecchini delfini','Orecchini metallizzati a forma di delfino.mg', 0, 38, 2, 10, 6);

/* Felpe donna */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa verde', 25.99, 'Felpa color block malva verde','Felpa con collo rotondo, orli a coste e motivo color block malva e verde sulle maniche lunghe.', 0, 39, 1, 11, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa college', 19.99, 'Felpa grigia stile college logo','Felpa stile college a maniche lunghe con collo rotondo e scritta e logo sul davanti.', 0, 40, 3, 11, 4);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa con stampa', 29.99, 'Felpa tie-dye verde stampa grafica stile college','Felpa tie-dye a maniche lunghe con stampa grafica stile college sul petto, scritta, orlo elasticizzato e collo rotondo.', 0, 41, 1, 11, 7);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Felpa oversize', 25.99, 'Felpa oversize arancione ricamo','Felpa oversize arancione a maniche lunghe con ricamo sul davanti e collo rotondo.', 0, 42, 1, 11, 17);

/* Camicie donna */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia popeline', 19.99, 'Camicia popeline rosa maniche lunghe','Camicia in popeline rosa a maniche lunghe con orlo arrotondato e chiusura mediante bottoni anteriori.', 0, 43, 3, 12, 10);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia a tunica', 19.99, 'Camicia a tunica stampata viola','Camicia a tunica stampata dal taglio morbido a maniche lunghe con scollo a v con bottoni.', 0, 44, 2, 12, 13);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia morbida a righe', 14.99, 'Camicia morbida a righe azzurra','Camicia a righe morbida a maniche lunghe con tasca anteriore e chiusura con bottoni.', 0, 45, 2, 12, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Camicia popeline', 25.99, 'Camicia popeline taschino bianco','Camicia in popeline a maniche lunghe con taschino anteriore, colletto classico e chiusura con bottoni. Realizzata in 100% cotone.', 0, 46, 1, 12, 14);

/*Ordini*/

insert into avabase.ordine (iva, dataInserimento, idOrdine, cli_fk) VALUES (21,20210618,100,2);
insert into avabase.ordine (iva, dataInserimento, idOrdine, cli_fk) VALUES (21,20210401,101,1);
insert into avabase.ordine (iva, dataInserimento, idOrdine, cli_fk) VALUES (21,20210112,102,3);
insert into avabase.ordine (iva, dataInserimento, idOrdine, cli_fk) VALUES (21,20210517,103,2);

