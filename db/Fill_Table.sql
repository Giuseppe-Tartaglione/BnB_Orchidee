use BnB_DB;

insert into utente (CF,Nome,Cognome,Email,Password,Via,Città,Cap,Provincia,Telefono,Data_Nascita,Iscritto,Card,Scadenza_Card)	
	values  ("CRLGLN81H28G157P","Carolina","Giuliani","carolinia12@gmail.com","Carolina1234","via dionto 14","Recale","81020","Caserta","3285478945","1981-07-14","0","00012402598423651087","2022-03-15"),
		    ("CRLGNN78N01R564U","Carlo","Giannetti","Gianetticarlo@hotmail.com","Gian14Carlo","viale como 1","Napoli","81100","NApoli","4578956325","1998-01-01","1","12547800036985412015","2021-07-07"),
		    ("ALFSGN74L15C847O","Alfonso","Signorini","Anfo_Sign@libero.it","Alfonso1803","viale benduce 24","Milano","20121","Milano","4562871594","1985-12-25","0",null,null),
		    ("GLNMRR47K25R784U","Giuliana","Moreira","Mor.Giuliana@gmail.com","Mor1212Giuls","viale acquaviva 28","Recale","81020","Caserta","7412698456","2000-11-03","1",null,null);
 
 INSERT INTO pagamento(Titolare_Carta,Numero_Carta,Scadenza,CVV,ID_Utente)
	values  ("Carolina Giullari","1234587496588524","2025-01-01","254","CRLGNN78N01R564U"),
			("Giacomo Castoro","8541256936521458","2025-01-01","254","CRLGNN78N01R564U"),
			("Giuliana Moreira","7410258963477458","2027-09-01","741","GLNMRR47K25R784U"),
			("Alfonso Signorini","1124558524247720","2022-12-01","081","ALFSGN74L15C847O");
            
 INSERT INTO stanza(ID_Stanza,Nome,TV,Panorama,Prezzo,Matrimoniali,Singoli)  
	values  ("001","Stella del nord","1","1","1200","1","2"),
			("002","Luce Polare","1","0","200","1","1"),
            ("003","Giardino estivo","0","1","150","0","2"),
            ("004","Relax Autunnale","0","0","80","1","0");
            