use avabase;

/* Categorie */
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('T-Shirts Uomo', 'Fai scorta di t-shirt e canotte da uomo online da AVAClothing. Rinnova il tuo guardaroba con t-shirt stampate con tanti motivi trendy e pattern per riflettere la tua personalita\'.', 1);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Pantaloni Uomo', 'La linea di pantaloni da Uomo include capi eleganti con tonalita\' dal chiaro al grigio scuro, capi casual con tasche laterali e da abbinare alle occasioni piu\' sportive.', 2);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Scarpe Uomo', 'Completa il tuo outfit con le nostre raffinate scarpe da uomo. Se cerchi dei modelli da indossare tutti i giorni, scopri tanti modelli di sneakers da uomo da infilare o da allacciare, sia minimal che in colori vivaci per adattarsi ai tuoi gusti.', 3);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Accessori Uomo', 'Crea un look elegante e raffinato grazie alla selezione di accessori da Uomo. Cinture, bretelle, gioielli, basta poco per riuscire a personalizzare ogni outfit con il tuo stile', 4);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Felpe Uomo', 'Aggiungi un tocco di calore al tuo guardaroba per tutti i giorni, con la nostra selezione di felpe con o senza cappuccio da uomo. Scopri giacche con cappuccio in colori neutri o felpe stampate con il tuo motivo preferito per il weekend.', 5);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Camicie Uomo', 'Rendi elegante il tuo look per tutti i giorni con le nostre camicie da uomo. Abbiamo camicie dalla linea slim o regular per adattarsi ai tuoi gusti e alle diverse occasioni.', 6);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Top Donna', 'La linea di top da Donna di AVAClothing include modelli per il lavoro e per il fine settimana. Facili da abbinare a una gonna elegante e un jeans casual. Trova il modello che meglio fa al caso tuo.', 7);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Pantaloni Donna e Gonne', 'Classici, moderni, basic e casual. I pantaloni e leggings da Donna di AVAClothing includono modelli adatti ad ogni stile e occasione. Aggiorna il tuo guardaroba con le tue gonne preferite.', 8);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Scarpe Donna', 'Regalati un paio di scarpe nuove: basse e comode o a tacco alto. Stivali, sandali eleganti o sneakers sportive.', 9);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Accessori Donna', 'La linea di accessori Donna include cinture scamosciate da annodare a un maxi pull in tinta unita per un look sbarazzino e alla moda.', 10);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Felpe Donna', 'Comoda e trendy. La felpa con o senza cappuccio è la scelta più cool per giornate di relax. Scopri tante stampe e modelli alla moda e aggiungi un tocco streetwear al tuo look!', 11);
insert into avabase.categoria (Nome, Descrizione, idCategoria) values ('Camicie Donna', 'Scopri le camicie e le bluse della nuova collezione Donna. Abbina una tunica lunga a un biker di pelle o indossa una camicia di jeans con un pantalone a palazzo in tinta unita.', 12);

/* Clienti */
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isRegistrato, telefono, idCliente) values ('Mario', 'Rossi', 'mariorossi00@example.com', 'Mario00Rossi', SHA1('passwordMario'), 'Via Ponzio Pilato, 12, Milano', true, '3514235768', 1);
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isRegistrato, telefono, idCliente) values ('Luca', 'Gialli', 'lucagialli98@example.com', 'Gialli_Luca98', SHA1('passwordLuca'), 'Via Giulio Cesare, 21, Roma', true, '3337756898', 2);
insert into avabase.cliente (nome, cognome, email, username, password, indirizzo, isRegistrato, telefono, idCliente) values ('Matteo', 'Neri', 'matteoneri89@example.com', 'MatteoNeri', SHA1('passwordMatteo'), 'Via Napoli, 58, Napoli', true, '3774621432', 3);

/* Magazzini */
insert into avabase.magazzino (Nome, Indirizzo, idMagazzino) values ('Il Vestiario', 'Via Roma, 35, Napoli', 1);
insert into avabase.magazzino (Nome, Indirizzo, idMagazzino) values ('ClothesAndCo', 'Via Torino, 35, Napoli', 2);

/* T-Shirts Uomo*/
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt rossa', 12.52, 'T-Shirt di colore rosso, taglia small, fresca, estiva.', 'T-shirt in jersey rossa di cotone. Maniche con risvolto cucito. Parte posteriore leggermente più lunga e arrotondata.', 0, 1, 1, 1, 5);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt rossa', 10.53, 'T-Shirt di colore rosso, taglia medium.', 'T-shirt in morbido jersey di cotone con stampa. Scollo rotondo con bordo sottile.', 0, 2, 2, 1, 10);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('T-Shirt azzurra', 8, 'T-Shirt di colore azzurro, taglia large.', 'T-shirt in morbido jersey di cotone con stampa. Scollo rotondo con bordo sottile.', 0, 3, 1, 1, 8);

/* Pataloni Uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Pantaloni neri', 17.99, 'Pantaloni di colore nero, lunghi, skinny.', 'Chinos in twill di cotone super elasticizzato. Tasche laterali, tasche posteriori a filetto con bottone e taschina portamonete. Patta con cerniera.', 0, 4, 1, 2, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Shorts bianchi', 16.99, 'Pantaloni di colore bianco, corti.', 'Shorts in tessuto di cotone. Elastico rivestito e coulisse in vita. Tasche laterali oblique, una tasca aperta dietro. Finta patta.', 0, 5, 2, 2, 9);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Jeans semplici', 19.99, 'Jeans semplici, lunghi, comodi', 'Jeans a cinque tasche in denim. Vita normale, patta con cerniera e bottone. Gamba stretta. Garantiscono morbidezza, elasticità, massima libertà di movimento e comfort ottimale.', 0, 6, 1, 2, 12);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Jeans semplici', 19.99, 'Jeans semplici di colore nero, lunghi, skinny', 'Jeans a 5 tasche in denim lavato. Gamba stretta e vita normale. Chiusura con cerniera.', 0, 7, 2, 2, 6);

/* Scarpe uomo */
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers bianche', 19.99, 'Sneakers di colore bianco','Sneakers in finta pelle con bordo imbottito in alto. Linguetta e lacci davanti. Suola zigrinata in gomma.', 0, 8, 2, 3, 18);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Scarpe nere', 39.99, 'Scarpe di colore nero, modello derby','Scarpe modello derby con allacciatura aperta davanti. Fodera e soletta in tela. Tacco 2,5 cm.', 0, 9, 1, 3, 14);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers slip-on', 25.50, 'Sneakers slip on di colore nero','Sneakers in tessuto. Elastico sui lati, passante dietro. Soletta in finto sughero, suola strutturata e antiscivolo, altezza 2 cm.', 0, 10, 1, 3, 8);
insert into avabase.prodotto (Nome, Prezzo, DescrizioneBreve, DescrizioneDettagliata, inOfferta, idProdotto, mag_fk, cat_fk, quantita) values ('Sneakers alte', 30.50, 'Sneakers alte di colore nero e bianco','Sneakers alte in consistente tela di cotone con motivo stampato e occhielli sui lati. Gambale alla caviglia, linguetta e lacci davanti. Fodera e soletta in tela di cotone. Suola 3 cm.', 0, 11, 2, 3, 20);






