

CREATE TABLE MEMBRE (
	email VARCHAR(255) NOT NULL, 
	mdp VARCHAR(100) NOT NULL,
	nom VARCHAR(100) NOT NULL, 
	prenom VARCHAR(100) NOT NULL,
	num_tel VARCHAR(12) NOT NULL,
	adresse VARCHAR(255), 
	date_naissance DATE,

	PRIMARY KEY (email)
);

CREATE TABLE AVIS (
	id INT NOT NULL, 
	email_receveur VARCHAR(255) NOT NULL, 
	email_donneur VARCHAR(255) NOT NULL, 
	note NUMERIC(2, 0) NOT NULL,
	date_avis DATETIME NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_email_receveur FOREIGN KEY (email_receveur) REFERENCES MEMBRE (email),
	CONSTRAINT FK_email_donneur FOREIGN KEY (email_donneur) REFERENCES MEMBRE (email)
);

CREATE TABLE ADMIN (
	id INT NOT NULL, 
	email_admin VARCHAR(255) NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_email_admin FOREIGN KEY (email_admin) REFERENCES MEMBRE (email)
);

CREATE TABLE BANNI (
	id INT NOT NULL,
	email_ban VARCHAR(255) NOT NULL,
	date_debut DATETIME NOT NULL,
	date_fin DATETIME NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_email_ban FOREIGN KEY (email_ban) REFERENCES MEMBRE (email)
);

CREATE TABLE TRAJET (
	id INT NOT NULL,
	email_conducteur VARCHAR(255) NOT NULL,
	ville_dep VARCHAR(100) NOT NULL,
	ville_ar VARCHAR(100) NOT NULL,	
	adresse_dep VARCHAR(255) NOT NULL,
	adresse_ar VARCHAR(255) NOT NULL,
	date_dep DATETIME NOT NULL,
	type_voit VARCHAR(255) NOT NULL,
	nb_places INT NOT NULL,
	prix INT NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_email_conducteur FOREIGN KEY (email_conducteur) REFERENCES MEMBRE (email)
);

CREATE TABLE TRAJET_TYPE (
	id INT NOT NULL,
	ville_dep VARCHAR(100) NOT NULL,
	ville_ar VARCHAR(100) NOT NULL,	
	distance INT NOT NULL,
	temps_moyen TIME NOT NULL,

	PRIMARY KEY (id)
)

CREATE TABLE DEMANDE_TRAJET (
	id INT NOT NULL,
	id_trajet INT NOT NULL,
	email_dem VARCHAR(255) NOT NULL,
	date_dem DATETIME NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_id_trajet FOREIGN KEY (id_trajet) REFERENCES TRAJET (id),
	CONSTRAINT FK_email_dem FOREIGN KEY (email_dem) REFERENCES MEMBRE (email)
);


CREATE TABLE VOITURE (
	id INT NOT NULL,
	marque VARCHAR(100) NOT NULL,
	nom_v VARCHAR(100) NOT NULL,
	type_v VARCHAR(255) NOT NULL,
	couleur VARCHAR(100) NOT NULL,

	PRIMARY KEY (id)
);

CREATE TABLE VOITURE_MEMBRE (
	id INT NOT NULL,
	id_voiture INT NOT NULL,
	email_possesseur VARCHAR(255) NOT NULL,

	PRIMARY KEY (id),
	CONSTRAINT FK_id_voiture FOREIGN KEY (id_voiture) REFERENCES VOITURE(id),
	CONSTRAINT FK_email_possesseur FOREIGN KEY (email_possesseur) REFERENCES MEMBRE(email)
);