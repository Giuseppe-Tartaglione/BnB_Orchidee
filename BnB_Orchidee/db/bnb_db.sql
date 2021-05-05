DROP DATABASE IF EXISTS bnb_db;
CREATE DATABASE bnb_db;
USE bnb_db;

DROP TABLE IF EXISTS stanza;

create table stanza (
ID_Stanza int primary key not null,
Nome char(30) not null,
TV boolean,
Panorama boolean,
Prezzo int not null default 0,
Matrimoniali int not null default 0,
Singoli int not null default 0
);

INSERT INTO stanza values 	
			("001","Stella del nord","1","1","1200","1","2"),
			("002","Luce Polare","1","0","200","1","1"),
            ("003","Giardino estivo","0","1","150","0","2"),
            ("004","Relax Autunnale","0","0","80","1","0");
            