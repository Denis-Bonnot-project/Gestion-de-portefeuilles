# Gestion de portefeuilles  
_(extrait de "Initiation à Merise", auteur inconnu)_


## **Exposé du problème**
 
Il s'agit d'étudier le système d'information d'un gestionnaire de portefeuilles de valeurs mobilières. Ce gestionnaire place en Bourse les fonds déposés chez un agent de change par ses clients qui lui en confient la gestion. Il passe des ordres d'achats ou de ventes de titres pour le compte de ses clients à cet agent de change.
On supposera pour ne pas compliquer qu'il n'y a que des valeurs françaises, qu'il n'y a pas de frais de courtage ni de TVA sur les opérations en Bourse, qu'aucune valeur du marché à Règlement mensuel n'est négociée en Règlement immédiat et qu'il n'y a qu'un cours par jour. Les règles de gestion sont les suivantes:

* RG1) Les cotations d'un titre peuvent être suspendues un certain temps;
* RG2) Le client donne au gestionnaire un mandat de gestion concernant son portefeuille de valeurs mobilières chez l'agent de change;
* RG3) Le gestionnaire a l'autorisation de procéder à toute opération de vente ou d'achat de valeurs pour le compte du client;
* RG4) Il travaille exclusivement sur un certain nombre de valeurs qu'il suit même si toutes ces valeurs ne sont pas dans les portefeuilles de ses clients;
* RG5) Toute valeur appartient à une catégorie de titres bien précise et est cotée sur l'un des marchés de la place de Paris;
* RG6) Chaque jour, au vu des cours, le gestionnaire détermine sur une courbe la tendance de chaque valeur suivie et en déduit les éventuels ordres d'achat ou vente à passer à l'agent de change pour le compte de ses clients;
* RG7) Lorsqu'un ordre a pu être exécuté en Bourse, l'agent de change en avise le client (avis d'opéré) ainsi que le gestionnaire qui enregistre cette opération. Périodiquement le gestionnaire transmet au client un relevé d'opérations;
* RG8) En fin d'année, le gestionnaire transmet à chaque client une évaluation de son portefeuille.



## Documents collectés lors des interviews du gestionnaire

#### LISTE DES MARCHÉS

CODE | LIBELLÉ
--- | ---
RM | Marché à règlement mensuel
T | Marché au comptant
SM | Second marché
HC | Hors-cote
... | ...   


#### LISTE DES CATÉGORIES DE VALEURS

CODE | LIBELLÉ
--- | ---
AC | Action
OB | Obligation
TP | Titre participatif
OC | Oblig. convertible
... | ...   


#### GRAPHIQUE:

![Graphique](/images/graphique.png)



### ÉVALUATION DU PORTEFEUILLE AU 31/12/2017
```
N° DE CLIENT	: 018
NOM 		: Durand
ADRESSE		: 5 Rue Monge, 75005 Paris
```

###### TITRES

| 	CODE	 | 	DÉSIGNATION	 | 	MARCHÉ	 | 	CATÉGORIE	 | QUANTITÉ EN PORTEFEUILLE | COURS | MONTANT | 
| 	 :---: 	 | 	   --- 	     | 	 :---: 	 | 	 :---: 	 | 	             :---: 	    |  ---: |  ---:   | 
| 	017	 | 	Air liquide	 | 	RM	 | 	AC	 | 	10	 | 	630	 | 	6300	 | 
| 	042	 | 	Casino	 | 	RM	 | 	AC	 | 	20	 | 	1000	 | 	20000	 | 
| 		 | 		 | 		 | 		 | 		 | 		 | 		 | 
| 		 | 		 | 		 | 		 | 		 | 	**TOTAL PORTEFEUILLE**	 | 	26300	 | 
| 		 | 		 | 		 | 		 | 		 | 	**LIQUIDITÉS**	 | 	4000,12	 | 
| 		 | 		 | 		 | 		 | 		 | 	**TOTAL**	 | 	30300,12	 | 




### RELEVÉ PÉRIODIQUE D'OPÉRATIONS EN BOURSE
```
N° DE CLIENT	: 018
NOM 		: Durand
ADRESSE		: 5 Rue Monge, 75005 Paris
```

###### TITRES

| 	CODE	 | 	DÉSIGNATION	 | 	MARCHÉ	 | 	CATÉGORIE	 | ACHAT | VENTE | DATE | COURS | MONTANT | 
| 	 :---: 	 | 	 :--- 	     | 	 :---: 	 | 	 :---: 	 | :---: | :---: | :---:| ---:  |  ---:   | 
| 	042	 | 	Casino	 | 	RM	 | 	AC	 | 			 | 	10		 | 	02/01/2017	 | 	1100	 | 	11000	 | 
| 	017	 | 	Air liquide	  |	RM	 | 	AC	 | 	5		 | 		 | 	03/01/2017	 | 	650	 | 	3250	 | 
| 	042	 | 	Casino	 | 	RM	 | 	AC	 | 			 | 	10		 | 	03/01/2017	 | 	1150	 | 	11500	 | 






## **Objectif:**
Mettre en place un système d'information aisé à maintenir et tenant compte des règles de gestion de l'entreprise.

## **Solution proposée**



#### 1. Dictionnaire des données (DD)

NOM	 | 	SIGNIFICATION	 | 	TYPE 	 | 	LONGUEUR	 | 	NATURE	 | 	INTÉGRITÉ
---	 | 	---	 | 	---	 | 	---:	 | 	---	 | 	---	 
CODMAR	 | 	code marché	    | 	A	 | 	2	 | 	élémentaire   signalétique 	 | 	
LIBMAR	 | 	libellé marché  | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	
CODCAT	 | 	code catégorie  | 	A	 | 	2	 | 	élémentaire   signalétique	 | 	
LIBCAT	 |libellé catégorie | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	
CODTITRE | 	code titre      | 	A	 | 	4	 | 	élémentaire   signalétique	 | 
LIBTITRE | 	libellé titre   | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	 
COURS	 | 	cours titre     | 	N	 | 	8	 | 	élémentaire   situation      | 	
JJMMAAA	 | 	date d'emprunt	| 	N	 | 	8	 | 	élémentaire   signalétique	 | 	date plausible
IDCLI	 |identifiant client| 	N	 | 	3	 | 	élémentaire   signalétique	 | 	
NOM	     | 	nom client	    | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	
RUE	     | 	rue 	        | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	
CODPOST	 | 	code postal	    | 	N	 | 	5	 | 	élémentaire	  signalétique   | 	
VILLE	 | 	ville           | 	A	 | 	30	 | 	élémentaire   signalétique	 | 	entier
QUANTITE | quantité détenue | 	N	 | 	10	 | 	élémentaire   situation	     | 	QUANTITE * COURS
MONTANT	 | 	montant         | 	A	 | 	8	 | 	calculé       situation 	 | 	
QUANTITENEGO|quantité négociée| N	 | 	10   | 	élémentaire   mouvement	     | 	entier
SENS	 | 	achat ou vente  | 	A	 | 	1	 | 	élémentaire   mouvement 	 | 	A ou V 




#### 2. Modèle conceptuel des données (MCD)
![MCD](/images/MCD.jpg)



#### 3. Modèle logique des données (MLD)
![MLD](/images/MLD.jpg)



#### 4. Script MySQL
![Cliquer ici pour afficher le script MySQL.](/scripts/script.sql)

---
