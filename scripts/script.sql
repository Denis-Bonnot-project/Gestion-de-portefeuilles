#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: TITRE
#------------------------------------------------------------

CREATE TABLE TITRE(
        CODTITRE Varchar (4) NOT NULL ,
        LIBTITRE Varchar (30) NOT NULL ,
        CODMAR   Varchar (2) NOT NULL ,
        CODCAT   Varchar (2) NOT NULL ,
        PRIMARY KEY (CODTITRE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CLIENT
#------------------------------------------------------------

CREATE TABLE CLIENT(
        IDCLI   Int NOT NULL ,
        NOM     Varchar (30) NOT NULL ,
        RUE     Varchar (30) NOT NULL ,
        CODPOST Int NOT NULL ,
        VILLE   Varchar (30) NOT NULL ,
        PRIMARY KEY (IDCLI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: DATE
#------------------------------------------------------------

CREATE TABLE DATE(
        JJMMAAAA Date NOT NULL ,
        PRIMARY KEY (JJMMAAAA )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MARCHE
#------------------------------------------------------------

CREATE TABLE MARCHE(
        CODMAR Varchar (2) NOT NULL ,
        LIBMAR Varchar (30) NOT NULL ,
        PRIMARY KEY (CODMAR )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CATEGORIE
#------------------------------------------------------------

CREATE TABLE CATEGORIE(
        CODCAT Varchar (2) NOT NULL ,
        LIBCAT Varchar (30) NOT NULL ,
        PRIMARY KEY (CODCAT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: QUOTE
#------------------------------------------------------------

CREATE TABLE QUOTE(
        COURS    Int ,
        CODTITRE Varchar (4) NOT NULL ,
        JJMMAAAA Date NOT NULL ,
        PRIMARY KEY (CODTITRE ,JJMMAAAA )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: DETENU_PAR
#------------------------------------------------------------

CREATE TABLE DETENU_PAR(
        QUANTITE Int NOT NULL ,
        CODTITRE Varchar (4) NOT NULL ,
        IDCLI    Int NOT NULL ,
        PRIMARY KEY (CODTITRE ,IDCLI )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EST_NEGOCIE
#------------------------------------------------------------

CREATE TABLE EST_NEGOCIE(
        QUANTNEGO Int ,
        SENS      Varchar (1) ,
        IDCLI     Int NOT NULL ,
        CODTITRE  Varchar (4) NOT NULL ,
        JJMMAAAA  Date NOT NULL ,
        PRIMARY KEY (IDCLI ,CODTITRE ,JJMMAAAA )
)ENGINE=InnoDB;

ALTER TABLE TITRE ADD CONSTRAINT FK_TITRE_CODMAR FOREIGN KEY (CODMAR) REFERENCES MARCHE(CODMAR);
ALTER TABLE TITRE ADD CONSTRAINT FK_TITRE_CODCAT FOREIGN KEY (CODCAT) REFERENCES CATEGORIE(CODCAT);
ALTER TABLE QUOTE ADD CONSTRAINT FK_QUOTE_CODTITRE FOREIGN KEY (CODTITRE) REFERENCES TITRE(CODTITRE);
ALTER TABLE QUOTE ADD CONSTRAINT FK_QUOTE_JJMMAAAA FOREIGN KEY (JJMMAAAA) REFERENCES DATE(JJMMAAAA);
ALTER TABLE DETENU_PAR ADD CONSTRAINT FK_DETENU_PAR_CODTITRE FOREIGN KEY (CODTITRE) REFERENCES TITRE(CODTITRE);
ALTER TABLE DETENU_PAR ADD CONSTRAINT FK_DETENU_PAR_IDCLI FOREIGN KEY (IDCLI) REFERENCES CLIENT(IDCLI);
ALTER TABLE EST_NEGOCIE ADD CONSTRAINT FK_EST_NEGOCIE_IDCLI FOREIGN KEY (IDCLI) REFERENCES CLIENT(IDCLI);
ALTER TABLE EST_NEGOCIE ADD CONSTRAINT FK_EST_NEGOCIE_CODTITRE FOREIGN KEY (CODTITRE) REFERENCES TITRE(CODTITRE);
ALTER TABLE EST_NEGOCIE ADD CONSTRAINT FK_EST_NEGOCIE_JJMMAAAA FOREIGN KEY (JJMMAAAA) REFERENCES DATE(JJMMAAAA);
