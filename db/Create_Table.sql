drop database if exists BnB_DB;
create database BnB_DB;
use BnB_DB;

drop table if exists Utente;

create table Utente (
CF char(16) primary key not null,
Nome char(30) not null,
Cognome char(30) not null,
Email char(50) not null,
Password char(50) not null,
Via char(50) not null,
Città char(50) not null,
Cap char(7) not null,
Provincia char(40) not null,
Telefono char(15) not null,
Data_Nascita date not null,
Iscritto boolean,
Card char(20),
Scadenza_Card date
);
drop table if exists Pagamento;

create table Pagamento( 
Titolare_Carta char(50) not null,
Numero_Carta char(30) primary key not null,
Scadenza date not null,
CVV int(3), 
ID_Utente char(16) not null  references Utente (CF)
);
drop table if exists Stanza;

create table Stanza (
ID_Stanza int(5) primary key auto_increment not null,
Nome char(30) not null,
TV boolean,
Panorama boolean,
Prezzo int not null,
Matrimoniali int not null,
Singoli int not null
);

drop table if exists Pacchetto;

create table Pacchetto (
ID_Pacchetto int primary key auto_increment not null,
ID_Stanza int(5) references Stanza(ID_Stanza),
Check_in datetime,
Check_out datetime,
Piscina boolean,
Ristorante boolean,
Prezzo int not null
);

drop table if exists Fattura;

create table Fattura(
ID_Fattura int primary key not null,
Nome char(30) not null,
Cognome char(30) not null,
Email char(50) not null references Utente(Email),
Indirizzo char(50) not null,
Telefono int(10) not null,
Check_in datetime,
Check_out datetime,
Nome_Stanza char(30) not null,
Iva int(2) not null,
Prezzo int not null,
ID_Prenotazione int not null references Prenotazione(ID_Prenotazione)
);

drop table if exists Prenotazione;

create table Prenotazione(
ID_Prenotazione int primary key auto_Increment not null,
ID_Utente char(16) not null references Utente(Email),
ID_Pacchetto int,
Data_Ordine date not null,
Check_in datetime,
Check_out datetime,
Piscina boolean,
Ristorante boolean,
Nome char(30) not null,
TV boolean,
Vista_Panoramica boolean,
Letti_Matrimoniali int not null,
Letti_Singoli int not null,
iva int(2) not null,
Prezzo int not null,
Stato char not null
); 