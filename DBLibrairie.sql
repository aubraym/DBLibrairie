--Projet "Librairie" par Atif, Audrey, Emilien, Wissam

USE librairie
--Jean Cultamert :o
---------- DESTRUCTION DES FOREIGN--------------------
-- TABLE PERMISSION
ALTER TABLE Permission
DROP CONSTRAINT fkPermissionStatut

--TABLE MODERATION
ALTER TABLE Moderation
DROP CONSTRAINT fkModerationStatut

--TABLE LIVREUR
ALTER TABLE Livreur
DROP CONSTRAINT fkLivreurStatut

--TABLE ORGANISMEPAIEMENT
ALTER TABLE OrganismePaiement
DROP CONSTRAINT fkOrganismePaiementStatut

--TABLE LIGNECOMMANDE
ALTER TABLE LigneCommande
DROP CONSTRAINT fkLigneCommandeStatut

--TABLE TVA
ALTER TABLE TVA
DROP CONSTRAINT fkTVAStatut

--TABLE REALTION
ALTER TABLE Relation
DROP CONSTRAINT fkRelationStatut

--TABLE THEME
ALTER TABLE Theme
DROP CONSTRAINT fkThemeStatut

--TABLE SOUSTHEME
ALTER TABLE SousTheme
DROP CONSTRAINT fkSousThemeStatut

--TABLE LIAISON
ALTER TABLE Liaison
DROP CONSTRAINT fkLiaisonStatut

--TABLE DESCRIPTION
ALTER TABLE Description
DROP CONSTRAINT fkDescriptionStatut

--TABLE MOTCLEF
ALTER TABLE MotClef
DROP CONSTRAINT fkMotClefStatut

--TABLE MISEENAVANT
ALTER TABLE MiseEnAvant
DROP CONSTRAINT fkMiseEnAvantStatut

--TABLE GENRE
ALTER TABLE Genre
DROP CONSTRAINT fkGenreStatut

--TABLE EDITEUR
ALTER TABLE Editeur
DROP CONSTRAINT fkEditeurStatut

--TABLE PRESENTATION
ALTER TABLE Presentation
DROP CONSTRAINT fkPresentationStatut

--TABLE ECRITURE
ALTER TABLE Ecriture
DROP CONSTRAINT fkEcritureStatut

--TABLE GENREAUTEUR
ALTER TABLE GenreAuteur
DROP CONSTRAINT fkGenreAuteurStatut

--TABLE DOCUMENTATION
ALTER TABLE Documentation
DROP CONSTRAINT fkDocumentationStatut

--TABLE AUTEUR
ALTER TABLE Auteur
DROP CONSTRAINT fkAuteurStatut


--TABLE INFOLIBRAIRIE
ALTER TABLE InfoLibrairie
DROP CONSTRAINT fkInfoLibrairieStatut

ALTER TABLE [dbo].[Documentation] 
	DROP CONSTRAINT [fkDocumentationGenreAuteur]
	
ALTER TABLE [dbo].[Documentation] 
	DROP CONSTRAINT [fkDocumentationAuteur]
	
ALTER TABLE [dbo].[Ecriture] 
	DROP CONSTRAINT [fkEcritureIdLivre]
	
ALTER TABLE [dbo].[Ecriture] 
	DROP CONSTRAINT [fkEcritureIdAuteur]
	
ALTER TABLE [dbo].[Presentation] 
	DROP CONSTRAINT [fkPresentationLivre]
	
ALTER TABLE [dbo].[Presentation] 
	DROP CONSTRAINT [fkPresentationEvenement]

ALTER TABLE SousTheme
	DROP CONSTRAINT fkSousThemeTheme

ALTER TABLE Adresse
	DROP CONSTRAINT fkAdresseCompteClient

ALTER TABLE Adresse
	DROP CONSTRAINT fkAdresseCompteEmploye

ALTER TABLE Compte
	DROP CONSTRAINT fkComptePermission

ALTER TABLE Moderation
	DROP CONSTRAINT fkModerationCompte

ALTER TABLE Moderation
	DROP CONSTRAINT fkModerationAvis

ALTER TABLE LigneCommande
	DROP CONSTRAINT fkLigneCommandeCommande

ALTER TABLE LigneCommande
	DROP CONSTRAINT fkLigneCommandeLivre

ALTER TABLE Avis
	DROP CONSTRAINT fkAvisLigneCommande

ALTER TABLE Avis
	DROP CONSTRAINT fkAvisCompte

ALTER TABLE Avis
	DROP CONSTRAINT fkAvisLivre

ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeCompte

ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeAdresseLivraison

ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeAdresseFacturation

ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeLivreur

ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeOrganismePaiement

ALTER TABLE [dbo].[MiseEnAvant] 
	DROP CONSTRAINT [fkMiseEnAvantLivre]

ALTER TABLE [dbo].[MiseEnAvant] 
	DROP CONSTRAINT [fkMiseEnAvantCoupDeCoeur]

ALTER TABLE [dbo].[Liaison] 
	DROP CONSTRAINT [fkLiaisonMotClef]

ALTER TABLE [dbo].[Liaison] 
	DROP CONSTRAINT [fkLiaisonLivre]

ALTER TABLE [dbo].[Description] 
	DROP CONSTRAINT [fkDescriptionLivre]
	
ALTER TABLE [dbo].[Description] 
	DROP CONSTRAINT [fkDescriptionGenre]

ALTER TABLE [dbo].[Livre]
	DROP CONSTRAINT fkLivreTVA

ALTER TABLE Relation
	DROP CONSTRAINT fkRelationLivre

ALTER TABLE Relation
	DROP CONSTRAINT fkRelationSousTheme
	---------------------------
	
ALTER TABLE CoupDeCoeur
	DROP CONSTRAINT fkCoupDeCoeurStatut
	
ALTER TABLE CoupDeCoeur
	DROP CONSTRAINT fkCoupDeCoeurCompte
		
ALTER TABLE Adresse
	DROP CONSTRAINT fkAdresseStatut
	
ALTER TABLE Avis
	DROP CONSTRAINT fkAvisStatut
	
ALTER TABLE Commande
	DROP CONSTRAINT fkCommandeStatut
	
ALTER TABLE Commande
	DROP CONSTRAINT fkLivraisonStatut --Pb nom fkCommandeLivraisonStatut

ALTER TABLE Commande
	DROP CONSTRAINT fkReglementStatut --Pb nom

ALTER TABLE Compte
	DROP CONSTRAINT fkCompteStatut
	
ALTER TABLE Evenement
	DROP CONSTRAINT fkEvenementStatut
	
ALTER TABLE Livre
	DROP CONSTRAINT fkLivreStatut


-------SUPPRESSION DES TABLES 
DROP TABLE Adresse
DROP TABLE Livre
DROP TABLE OrganismePaiement
DROP TABLE Relation
DROP TABLE SousTheme
DROP TABLE Theme
DROP TABLE TVA
DROP TABLE [dbo].[Description]
DROP TABLE Genre
DROP TABLE InfoLibrairie
DROP TABLE Liaison
DROP TABLE MiseEnAvant
DROP TABLE MotClef
DROP TABLE Statut
DROP TABLE [dbo].[Permission]
DROP TABLE [dbo].[Moderation]
DROP TABLE [dbo].[Livreur]
DROP TABLE [dbo].[LigneCommande]
DROP TABLE [dbo].[Compte]
DROP TABLE [dbo].[Commande]
DROP TABLE [dbo].[Avis]
DROP TABLE [dbo].[Auteur]
DROP TABLE [dbo].[CoupDeCoeur]
DROP TABLE [dbo].[Documentation]
DROP TABLE [dbo].[Ecriture]
DROP TABLE [dbo].[Editeur]
DROP TABLE [dbo].[Evenement]
DROP TABLE [dbo].[Presentation]
DROP TABLE [dbo].[GenreAuteur] 

 ------CREATION DES TABLES

 CREATE TABLE [dbo].[Permission](
	[IDPermission] [int] IDENTITY(1,1) NOT NULL,
	[nomPermission] [varchar](50) NOT NULL,
	[niveauPermission] [varchar](1) NOT NULL,
	[IDStatutPermission] [int] NOT NULL,
	[dateStatutPermission] [Date]   NOT NULL, 
 CONSTRAINT [pkPermission] PRIMARY KEY CLUSTERED 
(
	[IDPermission] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Moderation](
	[IDAvisModeration] [int] NOT NULL,
	[IDCompteModeration] [int] NOT NULL,
	[dateModeration] [datetime] NOT NULL,
	[commentaireModeration] [varchar](500) NULL,
	[IDStatutModeration] [int] NOT NULL,
	[dateStatutModeration] [Date] NOT NULL,
 CONSTRAINT [pkModeration] PRIMARY KEY CLUSTERED 
(
	[IDCompteModeration] ASC,
	[IDAvisModeration] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Livreur](
	[IDLivreur] [int] IDENTITY(1,1) NOT NULL,
	[nomLivreur] [varchar](50) NOT NULL,
	[commentaireLivreur] [varchar](500) NULL,
	[IDStatutLivreur] [int] NOT NULL,
	[dateStatutLivreur] [Date] NOT NULL,
 CONSTRAINT [pkLivreur] PRIMARY KEY CLUSTERED 
(
	[IDLivreur] ASC
)
) ON [PRIMARY]CREATE TABLE [dbo].[LigneCommande](
	[IDLigneCommande] [int] IDENTITY(1,1) NOT NULL,
	[IDCommandeLigneCommande] [int] NOT NULL,
	[IDLivreLigneCommande] [int] NOT NULL,
	[quantiteLigneCommande] [int] NOT NULL,
	[TVALigneCommande] [float] NOT NULL,
	[prixHTLivreLigneCommande] [float] NOT NULL,
	[valeurPromoLigneCommande] [float] NOT NULL,
	[IDStatutLigneCommande] [int] NOT NULL,
	[dateStatutLigneCommande] [Date] NOT NULL,
 CONSTRAINT [pkLigneCommande] PRIMARY KEY CLUSTERED 
(
	[IDLigneCommande] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Compte](
	[IDCompte] [int] IDENTITY(1,1) NOT NULL,
	[IDPermissionCompte] [int] NOT NULL,
	[nomCompte] [varchar](50) NOT NULL,
	[prenomCompte] [varchar](50) NOT NULL,
	[pseudoCompte] [varchar](50) NOT NULL,
	[MDPCompte] [varchar](50) NOT NULL,
	[emailCompte] [varchar](100) NOT NULL,
	[telephoneCompte] [varchar](50) NOT NULL,
	[dateCreationCompte] [Datetime] NOT NULL,
	[dateDestructionCompte] [Datetime] NULL,
	[commentaireCompte] [varchar](500) NULL,
	[IDStatutCompte] [int] NOT NULL,
	[dateStatutCompte] [Date] NOT NULL,
 CONSTRAINT [pkCompte] PRIMARY KEY CLUSTERED 
(
	[IDCompte] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Commande](
	[IDCommande] [int] IDENTITY(1,1) NOT NULL,
	[IDAdresseFacturationCommande] [int] NOT NULL,
	[IDAdresseLivraisonCommande] [int] NOT NULL,
	[IDCompteCommande] [int] NOT NULL,
	[IDLivreurCommande] [int] NOT NULL,
	[IDOrganismePaiementCommande] [int] NOT NULL,
	[dateCommande] [datetime] NOT NULL,
	[adresseIPCommande] [varchar](50) NOT NULL,
	[commentaireCommande] [varchar](500) NULL,
	[IDStatutCommande] [INT] NOT NULL,
	[tarifLivraisonCommande] [float] NOT NULL,
	[modeLivraisonCommande] [varchar](50) NOT NULL,
	[IDLivraisonCommande] [INT] NOT NULL,
	[IDStatutLivraisonCommande] [INT] NOT NULL,
	[montantCommande] [float] NOT NULL,
	[modeReglementCommande] [varchar](50) NOT NULL,
	[numTransactionReglementCommande] [int] NOT NULL,
	[dateExpeditionCommande] [datetime] NULL,
	[IDStatutReglementCommande] [int] NOT NULL,
	[dateStatutCommande] [Date] NOT NULL,
 CONSTRAINT [pkCommande] PRIMARY KEY CLUSTERED 
(
	[IDCommande] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Avis](
	[IDAvis] [int] IDENTITY(1,1) NOT NULL,
	[IDLivreAvis] [int] NOT NULL,
	[IDLigneCommandeAvis] [int] NOT NULL,
	[IDCompteAvis] [int] NOT NULL,
	[noteAvis] [int] NOT NULL,
	[contenuAvis] [varchar](500) NULL,
	[dateAvis] [datetime] NOT NULL,
	[titreAvis] [varchar](100) NULL,
	[IPAvis] [varchar](50) NOT NULL,
	[IDStatutAvis] [int] NOT NULL,
	[dateStatutAvis] [Date] NOT NULL,
 CONSTRAINT [pkAvis] PRIMARY KEY CLUSTERED 
(
	[IDAvis] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Auteur](
	[IDAuteur] [int] IDENTITY(1,1) NOT NULL,
	[nomAuteur] [varchar](50) NOT NULL,
	[prenomAuteur] [varchar](50) NOT NULL,
	[dateNaissanceAuteur] [date] NOT NULL,
	[dateDecesAuteur] [date] NULL,
	[sexeAuteur] [varchar](1) NOT NULL,
	[biographieAuteur] [varchar](500) NOT NULL,
	[commentaireAuteur] [varchar](500) NULL,
	[IDStatutAuteur] [int] NOT NULL,
	[dateStatutAuteur] [Date] NOT NULL,
 CONSTRAINT [pkAuteur] PRIMARY KEY CLUSTERED 
(
	[IDAuteur] ASC
)
) ON [PRIMARY]
CREATE TABLE Adresse(
	IDAdresse int IDENTITY(1,1) NOT NULL,
	IDCompteClientAdresse int NOT NULL,
	IDCompteEmployeAdresse int NOT NULL,
	nomDestinataireAdresse [varchar](50) NOT NULL,
	prenomDestinataireAdresse [varchar](50) NOT NULL,
	numVoieAdresse varchar(50) NULL,
	typeVoieAdresse varchar(50) NULL,
	nomVoieAdresse [varchar](50) NOT NULL,
	complementAdresse varchar(200) NULL,
	codePostalAdresse varchar(5) NOT NULL,
	villeAdresse varchar(100) NOT NULL,
	paysAdresse varchar(100) NOT NULL,
	IDStatutAdresse [int] NOT NULL,
	[dateStatutAdresse] [Date] NOT NULL,
	commentaireAdresse varchar(500) NULL,
CONSTRAINT pkAdresse PRIMARY KEY CLUSTERED 
(
	[IDAdresse] ASC
)
) ON [PRIMARY]
CREATE TABLE Livre(
	IDLivre int IDENTITY(1,1) NOT NULL,
	IDEditeurLivre int NOT NULL,
	IDTVALivre int NOT NULL,
	ISBNLivre varchar(50) NOT NULL,
	titreLivre varchar(50) NOT NULL,
	sousTitreLivre varchar(50) NOT NULL,
	resumeLivre varchar(500) NOT NULL,
	couvertureLivre varchar(100) NOT NULL,
	prixHTLivre float NOT NULL,
	quantiteStockLivre int NOT NULL,
	dateParutionLivre date NULL,
	NBPageLivre int NULL,
	poidsLivre float NULL,
	gabariLivre varchar(50) NULL,
	commentaireLivre varchar(500) NULL,
	IDStatutLivre [int] NOT NULL,
	[dateStatutLivre] [Date] NOT NULL,
CONSTRAINT [pkLivre] PRIMARY KEY CLUSTERED 
(
	[IDLivre] ASC
)
) ON [PRIMARY]
CREATE TABLE OrganismePaiement(
	IDOrganismePaiement int IDENTITY(1,1) NOT NULL,
	nomOrganismePaiement [varchar](50) NOT NULL,
	IDStatutOrganismePaiement [int] NOT NULL,
	[dateStatutOrganismePaiement] [Date] NOT NULL,
	commentaireOrganismePaiement varchar(500) NULL,CONSTRAINT [pkOrganismePaiement] PRIMARY KEY CLUSTERED 
(
	[IDOrganismePaiement] ASC
)
) ON [PRIMARY]
CREATE TABLE Relation(
	IDLivreRelation int NOT NULL,
	IDSousThemeRelation int NOT NULL,
	IDStatutRelation [int] NOT NULL,
	[dateStatutRelation] [Date] NOT NULL,CONSTRAINT [pkRelation] PRIMARY KEY CLUSTERED
	 
(
	[IDLivreRelation] ASC,
	[IDSousThemeRelation] ASC
)
) ON [PRIMARY]
CREATE TABLE SousTheme(
	IDSousTheme int IDENTITY(1,1) NOT NULL,
	IDThemeSousTheme int NOT NULL,
	nomSousTheme [varchar](50) NOT NULL,
	descriptionSousTheme varchar(500) NOT NULL,
	IDStatutSousTheme [int] NOT NULL,
	[dateStatutSousTheme] [Date] NOT NULL
CONSTRAINT [pkSousTheme] PRIMARY KEY CLUSTERED 
(
	[IDSousTheme] ASC
)
) ON [PRIMARY]
CREATE TABLE Theme(
	IDTheme int IDENTITY(1,1) NOT NULL,
	nomTheme [varchar](50) NOT NULL,
	descriptionTheme varchar(500) NOT NULL,
	IDStatutTheme [int] NOT NULL,
	[dateStatutTheme] [Date] NOT NULL
	CONSTRAINT [pkTheme] PRIMARY KEY CLUSTERED 
(
	[IDTheme] ASC
)
) ON [PRIMARY]
CREATE TABLE TVA(
	IDTVA int IDENTITY(1,1) NOT NULL,
	valeurTVA float NOT NULL,
	IDStatutTVA [int] NOT NULL,
	[dateStatutTVA] [Date] NOT NULL, CONSTRAINT [pkTVA] PRIMARY KEY CLUSTERED 
(
	[IDTVA] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[CoupDeCoeur](
	[IDCoupDeCoeur] [int] IDENTITY(1,1) NOT NULL,
	[IDCompteCoupDeCoeur] [int] NOT NULL,
	[nomCoupDeCoeur] [varchar](50) NOT NULL,
	[descriptionCoupDeCoeur] [varchar](500) NOT NULL,
	[IDStatutCoupDeCoeur] [int] NOT NULL,
	[dateStatutCoupDeCoeur] [Date] NOT NULL,
 CONSTRAINT [pkCoupDeCoeurEquipe] PRIMARY KEY CLUSTERED 
(
	[IDCoupDeCoeur] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Documentation](
	[IDAuteurDocumentation] [int] NOT NULL,
	[IDGenreAuteurDocumentation] [int] IDENTITY(1,1) NOT NULL,
	[IDStatutDocumentation] [int] NOT NULL,
	[dateStatutDocumentation] [Date] NOT NULL,
 CONSTRAINT [pkDocumentation] PRIMARY KEY CLUSTERED 
(
	[IDAuteurDocumentation] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Ecriture](
	[IDAuteurEcriture] [int] NOT NULL,
	[IDLivreEcriture] [int] NOT NULL,
	[IDStatutEcriture] [int] NOT NULL,
	[dateStatutEcriture] [Date] NOT NULL,
 CONSTRAINT [pkEcriture] PRIMARY KEY CLUSTERED 
(
	[IDAuteurEcriture] ASC,
	[IDLivreEcriture] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Editeur](
	[IDEditeur] [int] IDENTITY(1,1) NOT NULL,
	[nomEditeur] [varchar](50) NOT NULL,
	[nomEdition] [varchar](50) NULL,
	[commentaireEditeur] [varchar](500) NULL,
	[IDStatutEditeur] [int] NOT NULL,
	[dateStatutEditeur] [Date] NOT NULL,
 CONSTRAINT [pkEditeur] PRIMARY KEY CLUSTERED 
(
	[IDEditeur] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Evenement](
	[IDEvenement] [int] IDENTITY(1,1) NOT NULL,
	[dateDebutEvenement] [date] NOT NULL,
	[dateFinEvenement] [date] NULL,
	[nomEvenement] [varchar](50) NULL,
	[typeEvenement] [varchar](50) NULL,
	[descriptionEvenement] [varchar](500) NULL,
	[commentaireEvenement] [varchar](500) NULL,
	[IDStatutEvenement] [int] NULL,
	[dateStatutEvenement] [Date] NOT NULL,
 CONSTRAINT [pkEvenement] PRIMARY KEY CLUSTERED 
(
	[IDEvenement] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[GenreAuteur](
	[IDGenreAuteur] [int] IDENTITY(1,1) NOT NULL,
	[nomGenreAuteur] [varchar](50) NOT NULL,
	[descriptionGenreAuteur] [varchar](500) NOT NULL,
	[IDStatutGenreAuteur] [int] NULL,
	[dateStatutGenreAuteur] [Date] NOT NULL,
 CONSTRAINT [pkGenreAuteur] PRIMARY KEY CLUSTERED 
(
	[IDGenreAuteur] ASC
)
) ON [PRIMARY]
CREATE TABLE [dbo].[Presentation](
	[IDEvenementPresentation] [int] NOT NULL,
	[IDLivrePresentation] [int] NOT NULL,
	[nomPromoPresentation] [varchar](50) NULL,
	[valeurPromoPresentation] [decimal](18, 0) NULL,
	[IDStatutPresentation] [int] NULL,
	[dateStatutPresentation] [Date] NOT NULL,
 CONSTRAINT [pkPresentation] PRIMARY KEY CLUSTERED 
(
	[IDEvenementPresentation] ASC
)
) ON [PRIMARY]

CREATE TABLE [dbo].[Description](
	[IDLivreDescription] [int] NOT NULL,
	[IDGenreDescription] [int] NOT NULL,
	[IDStatutDescription] [int] NULL,
	[dateStatutDescription] [Date] NOT NULL,
 CONSTRAINT [pkDescription] PRIMARY KEY CLUSTERED 
(
	[IDLivreDescription] ASC,
	[IDGenreDescription] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[Genre](
	[IDGenre] [int] IDENTITY(1,1) NOT NULL,
	[nomGenre] [varchar](50) NOT NULL,
	[descriptionGenre] [varchar](500) NOT NULL,
	[IDStatutGenre] [int] NULL,
	[dateStatutGenre] [Date] NOT NULL,
 CONSTRAINT [pkGenre] PRIMARY KEY CLUSTERED 
(
	[IDGenre] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[InfoLibrairie](
	[IDInfoLibrairie] [int] IDENTITY(1,1) NOT NULL,
	[typeInfoLibrairie] [varchar](100) NOT NULL,
	[contenuInfoLibrairie] [varchar](500) NOT NULL,
	[referenceInfoLibrairie] [varchar](30) NULL,
	[commentaireInfoLibrairie] [varchar](500) NULL,
	[IDStatutInfoLibrairie] [int] NULL,
	[dateStatutInfoLibrairie] [Date] NOT NULL,

 CONSTRAINT [pkInfoLibrairie] PRIMARY KEY CLUSTERED 
(
	[IDInfoLibrairie] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[Liaison](
	[IDLivreLiaison] [int] NOT NULL,
	[IDMotClefLiaison] [int] NOT NULL,
	[IDStatutLiaison] [int] NULL,
	[dateStatutLiaison] [Date] NOT NULL,

 CONSTRAINT [pkLiaison] PRIMARY KEY CLUSTERED 
(
	[IDLivreLiaison] ASC,
	[IDMotClefLiaison] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[MiseEnAvant](
	[IDCoupDeCoeurMiseEnAvant] [int] NOT NULL,
	[IDLivreMiseEnAvant] [int] NOT NULL,
	[IDStatutMiseEnAvant] [int] NULL,
	[dateStatutMiseEnAvant] [Date] NOT NULL,

 CONSTRAINT [pkMiseEnAvant] PRIMARY KEY CLUSTERED 
(
	[IDCoupDeCoeurMiseEnAvant] ASC,
	[IDLivreMiseEnAvant] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[MotClef](
	[IDMotClef] [int] IDENTITY(1,1) NOT NULL,
	[nomMotClef] [varchar](50) NOT NULL,
	[descriptionMotClef] [varchar](500) NOT NULL,
	[IDStatutMotClef] [int] NULL,
	[dateStatutMotClef] [Date] NOT NULL,

 CONSTRAINT [pkMotClef] PRIMARY KEY CLUSTERED 
(
	[IDMotClef] ASC
) ON [PRIMARY])

CREATE TABLE [dbo].[Statut](
	[IDStatut] [int] IDENTITY(1,1) NOT NULL,
	[refStatut] [varchar](200) NOT NULL,
	[descriptionStatut] [varchar](500) NOT NULL,
 CONSTRAINT [pkStatut] PRIMARY KEY CLUSTERED 
(
	[IDStatut] ASC
) ON [PRIMARY])

---------------CREATION DES FOREIGN KEYS -----
--debuT+++++++++++++++++++++++++++++++++++++++++++++++++++
-- TABLE PERMISSION
ALTER TABLE Permission
ADD CONSTRAINT fkPermissionStatut
FOREIGN KEY (IDStatutPermission)
REFERENCES Statut(IDStatut)

--TABLE MODERATION
ALTER TABLE Moderation
ADD CONSTRAINT fkModerationStatut
FOREIGN KEY (IDStatutModeration)
REFERENCES Statut(IDStatut)

--TABLE LIVREUR
ALTER TABLE Livreur
ADD CONSTRAINT fkLivreurStatut
FOREIGN KEY (IDStatutLivreur)
REFERENCES Statut(IDStatut)

--TABLE ORGANISMEPAIEMENT
ALTER TABLE OrganismePaiement
ADD CONSTRAINT fkOrganismePaiementStatut
FOREIGN KEY (IDStatutOrganismePaiement)
REFERENCES Statut(IDStatut)

--TABLE LIGNECOMMANDE
ALTER TABLE LigneCommande
ADD CONSTRAINT fkLigneCommandeStatut
FOREIGN KEY (IDStatutLigneCommande)
REFERENCES Statut(IDStatut)

--TABLE TVA
ALTER TABLE TVA
ADD CONSTRAINT fkTVAStatut
FOREIGN KEY (IDStatutTVA)
REFERENCES Statut(IDStatut)

--TABLE REALTION
ALTER TABLE Relation
ADD CONSTRAINT fkRelationStatut
FOREIGN KEY (IDStatutRelation)
REFERENCES Statut(IDStatut)

--TABLE THEME
ALTER TABLE Theme
ADD CONSTRAINT fkThemeStatut
FOREIGN KEY (IDStatutTheme)
REFERENCES Statut(IDStatut)

--TABLE SOUSTHEME
ALTER TABLE SousTheme
ADD CONSTRAINT fkSousThemeStatut
FOREIGN KEY (IDStatutSousTheme)
REFERENCES Statut(IDStatut)

--TABLE LIAISON
ALTER TABLE Liaison
ADD CONSTRAINT fkLiaisonStatut
FOREIGN KEY (IDStatutLiaison)
REFERENCES Statut(IDStatut)

--TABLE DESCRIPTION
ALTER TABLE Description
ADD CONSTRAINT fkDescriptionStatut
FOREIGN KEY (IDStatutDescription)
REFERENCES Statut(IDStatut)

--TABLE MOTCLEF
ALTER TABLE MotClef
ADD CONSTRAINT fkMotClefStatut
FOREIGN KEY (IDStatutMotClef)
REFERENCES Statut(IDStatut)

--TABLE MISEENAVANT
ALTER TABLE MiseEnAvant
ADD CONSTRAINT fkMiseEnAvantStatut
FOREIGN KEY (IDStatutMiseEnAvant)
REFERENCES Statut(IDStatut)

--TABLE GENRE
ALTER TABLE Genre
ADD CONSTRAINT fkGenreStatut
FOREIGN KEY (IDStatutGenre)
REFERENCES Statut(IDStatut)

--TABLE EDITEUR
ALTER TABLE Editeur
ADD CONSTRAINT fkEditeurStatut
FOREIGN KEY (IDStatutEditeur)
REFERENCES Statut(IDStatut)

--TABLE PRESENTATION
ALTER TABLE Presentation
ADD CONSTRAINT fkPresentationStatut
FOREIGN KEY (IDStatutPresentation)
REFERENCES Statut(IDStatut)

--TABLE ECRITURE
ALTER TABLE Ecriture
ADD CONSTRAINT fkEcritureStatut
FOREIGN KEY (IDStatutEcriture)
REFERENCES Statut(IDStatut)

--TABLE GENREAUTEUR
ALTER TABLE GenreAuteur
ADD CONSTRAINT fkGenreAuteurStatut
FOREIGN KEY (IDStatutGenreAuteur)
REFERENCES Statut(IDStatut)

--TABLE DOCUMENTATION
ALTER TABLE Documentation
ADD CONSTRAINT fkDocumentationStatut
FOREIGN KEY (IDStatutDocumentation)
REFERENCES Statut(IDStatut)

--TABLE AUTEUR
ALTER TABLE Auteur
ADD CONSTRAINT fkAuteurStatut
FOREIGN KEY (IDStatutAuteur)
REFERENCES Statut(IDStatut)

--TABLE INFOLIBRAIRIE
ALTER TABLE InfoLibrairie
ADD CONSTRAINT fkInfoLibrairieStatut
FOREIGN KEY (IDStatutInfoLibrairie)
REFERENCES Statut(IDStatut)

------------------------- CONTRAINTE DATE ----------------------------------
-- TABLE AVIS
ALTER TABLE Avis
	ADD CONSTRAINT dfDateStatutAvis
	DEFAULT GETDATE() for DateStatutAvis

--TABLE ADRESSE
	ALTER TABLE Adresse
	ADD CONSTRAINT dfDateStatutAdresse
	DEFAULT GETDATE() for DateStatutAdresse

-- TABLE AUTEUR
	ALTER TABLE Auteur
	ADD CONSTRAINT dfDateStatutAuteur
	DEFAULT GETDATE() for DateStatutAuteur

	-- TABLE COMMANDE
	ALTER TABLE Commande
	ADD CONSTRAINT dfDateStatutCommande
	DEFAULT GETDATE() for DateStatutCommande

	-- TABLE COMPTE
	ALTER TABLE Compte
	ADD CONSTRAINT dfDateStatutCompte
	DEFAULT GETDATE() for DateStatutCompte

	-- TABLE COUPDECOEUR
	ALTER TABLE CoupDeCoeur
	ADD CONSTRAINT dfDateStatutCoupDeCoeur
	DEFAULT GETDATE() for DateStatutCoupDeCoeur

	-- TABLE DESCRIPTION
	ALTER TABLE Description
	ADD CONSTRAINT dfDateStatutDescription
	DEFAULT GETDATE() for DateStatutDescription

	-- TABLE DOCUMENTATION
	ALTER TABLE Documentation
	ADD CONSTRAINT dfDateStatutDocumentation
	DEFAULT GETDATE() for DateStatutDocumentation

	-- TABLE ECRITURE
	ALTER TABLE Ecriture
	ADD CONSTRAINT dfDateStatutEcriture
	DEFAULT GETDATE() for DateStatutEcriture

	-- TABLE EDITEUR
	ALTER TABLE Editeur
	ADD CONSTRAINT dfDateStatutEditeur
	DEFAULT GETDATE() for DateStatutEditeur

	-- TABLE EVENEMENT
	ALTER TABLE Evenement
	ADD CONSTRAINT dfDateStatutEvenement
	DEFAULT GETDATE() for DateStatutEvenement

	-- TABLE GENRE
	ALTER TABLE Genre
	ADD CONSTRAINT dfDateStatutGenre
	DEFAULT GETDATE() for DateStatutGenre

	-- TABLE GENREAUTEUR
	ALTER TABLE GenreAuteur
	ADD CONSTRAINT dfDateStatutGenreAuteur
	DEFAULT GETDATE() for DateStatutGenreAuteur

	-- TABLE INFOLIBRAIRIE
	ALTER TABLE InfoLibrairie
	ADD CONSTRAINT dfDateStatutInfoLibrairie
	DEFAULT GETDATE() for DateStatutInfoLibrairie

	-- TABLE LIAISON
	ALTER TABLE Liaison
	ADD CONSTRAINT dfDateStatutLiaison
	DEFAULT GETDATE() for DateStatutLiaison

	-- TABLE LIGNECOMMANDE
	ALTER TABLE LigneCommande
	ADD CONSTRAINT dfDateStatutLigneCommande
	DEFAULT GETDATE() for DateStatutLigneCommande

	-- TABLE LIVRE
	ALTER TABLE Livre
	ADD CONSTRAINT dfDateStatutLivre
	DEFAULT GETDATE() for DateStatutLivre

	-- TABLE LIVREUR
	ALTER TABLE Livreur
	ADD CONSTRAINT dfDateStatutLivreur
	DEFAULT GETDATE() for DateStatutLivreur

	-- TABLE MISE EN AVANT
	ALTER TABLE MiseEnAvant
	ADD CONSTRAINT dfDateStatutMiseEnAvant
	DEFAULT GETDATE() for DateStatutMiseEnAvant

	-- TABLE MODERATION
	ALTER TABLE Moderation
	ADD CONSTRAINT dfDateStatutModeration
	DEFAULT GETDATE() for DateStatutModeration

	-- TABLE MOTCLEF
	ALTER TABLE MotClef
	ADD CONSTRAINT dfDateStatutMotClef
	DEFAULT GETDATE() for DateStatutMotClef

	-- TABLE ORGANISMEPAIEMENT
	ALTER TABLE OrganismePaiement
	ADD CONSTRAINT dfDateStatutOrganismePaiement
	DEFAULT GETDATE() for DateStatutOrganismePaiement

	-- TABLE PERMISSION
	ALTER TABLE Permission
	ADD CONSTRAINT dfDateStatutPermission
	DEFAULT GETDATE() for DateStatutPermission

	-- TABLE PRESENTATION
	ALTER TABLE Presentation
	ADD CONSTRAINT dfDateStatutPresentation
	DEFAULT GETDATE() for DateStatutPresentation

	-- TABLE RELATION
	ALTER TABLE Relation
	ADD CONSTRAINT dfDateStatutRelation
	DEFAULT GETDATE() for DateStatutRelation

	-- TABLE SOUSTHEME
	ALTER TABLE SousTheme
	ADD CONSTRAINT dfDateStatutSousTheme
	DEFAULT GETDATE() for DateStatutSousTheme

	-- TABLE THEME
	ALTER TABLE Theme
	ADD CONSTRAINT dfDateStatutTheme
	DEFAULT GETDATE() for DateStatutTheme

	-- TABLE TVA
	ALTER TABLE TVA
	ADD CONSTRAINT dfDateStatutTVA
	DEFAULT GETDATE() for DateStatutTVA

--FIN+++++++++++++++++++++++++++++++++++++++++++++++++++
ALTER TABLE CoupDeCoeur
	ADD CONSTRAINT fkCoupDeCoeurCompte
	FOREIGN KEY (IDCompteCoupDeCoeur)
		REFERENCES Compte(IDCompte)
		
		
ALTER TABLE SousTheme
	ADD CONSTRAINT fkSousThemeTheme
	FOREIGN KEY (idThemeSousTheme)
		REFERENCES Theme(idTheme)

ALTER TABLE Relation
	ADD CONSTRAINT fkRelationLivre
	FOREIGN KEY (idLivreRelation)
		REFERENCES Livre(idLivre)

ALTER TABLE Relation
	ADD CONSTRAINT fkRelationSousTheme
	FOREIGN KEY (idSousThemeRelation)
		REFERENCES SousTheme(idSousTheme)

ALTER TABLE Adresse
	ADD CONSTRAINT fkAdresseCompteClient
	FOREIGN KEY (idCompteClientAdresse)
		REFERENCES Compte(idCompte)

ALTER TABLE [dbo].[Livre] WITH CHECK ADD CONSTRAINT [fkLivreTVA] FOREIGN KEY([IDTVALivre])
	REFERENCES [dbo].[TVA] ([IDTVA])
	
ALTER TABLE [dbo].[Livre] WITH CHECK ADD CONSTRAINT [fkLivreEditeur] FOREIGN KEY([IDEditeurLivre])
	REFERENCES [dbo].[Editeur] ([IDEditeur])
	
ALTER TABLE [dbo].[Compte] WITH CHECK ADD CONSTRAINT [fkComptePermission] FOREIGN KEY([IDPermissionCompte])
	REFERENCES [dbo].[Permission] ([IDPermission])

ALTER TABLE [dbo].[Description] WITH CHECK ADD CONSTRAINT [fkDescriptionGenre] FOREIGN KEY([IDGenreDescription])
	REFERENCES [dbo].[Genre] ([IDGenre])

ALTER TABLE [dbo].[Description] WITH CHECK ADD CONSTRAINT [fkDescriptionLivre] FOREIGN KEY([IDLivreDescription])
	REFERENCES [dbo].[Livre] ([IDLivre])

ALTER TABLE [dbo].[Liaison] WITH CHECK ADD CONSTRAINT [fkLiaisonLivre] FOREIGN KEY([IDLivreLiaison])
	REFERENCES [dbo].[Livre] ([IDLivre])

ALTER TABLE [dbo].[Liaison] WITH CHECK ADD CONSTRAINT [fkLiaisonMotClef] FOREIGN KEY([IDMotClefLiaison])
	REFERENCES [dbo].[MotClef] ([IDMotClef])

ALTER TABLE [dbo].[MiseEnAvant] WITH CHECK ADD CONSTRAINT [fkMiseEnAvantCoupDeCoeur] FOREIGN KEY([IDCoupDeCoeurMiseEnAvant])
	REFERENCES [dbo].[CoupDeCoeur] ([IDCoupDeCoeur])

ALTER TABLE [dbo].[MiseEnAvant] WITH CHECK ADD CONSTRAINT [fkMiseEnAvantLivre] FOREIGN KEY([IDLivreMiseEnAvant])
	REFERENCES [dbo].[Livre] ([IDLivre])

ALTER TABLE Adresse
	ADD CONSTRAINT fkAdresseCompteEmploye
	FOREIGN KEY (idCompteEmployeAdresse)
		REFERENCES Compte(idCompte)

ALTER TABLE Moderation
	ADD CONSTRAINT fkModerationCompte
	FOREIGN KEY (idCompteModeration)
		REFERENCES Compte(idCompte)

ALTER TABLE Moderation
	ADD CONSTRAINT fkModerationAvis
	FOREIGN KEY (idAvisModeration)
		REFERENCES Avis(idAvis)

ALTER TABLE LigneCommande
	ADD CONSTRAINT fkLigneCommandeCommande
	FOREIGN KEY (idCommandeLigneCommande)
		REFERENCES Commande(idCommande)

ALTER TABLE LigneCommande
	ADD CONSTRAINT fkLigneCommandeLivre
	FOREIGN KEY (idLivreLigneCommande)
		REFERENCES Livre(idLivre)

ALTER TABLE Avis
	ADD CONSTRAINT fkAvisLigneCommande
	FOREIGN KEY (idLigneCommandeAvis)
		REFERENCES LigneCommande(idLigneCommande)

ALTER TABLE Avis
	ADD CONSTRAINT fkAvisCompte
	FOREIGN KEY (idCompteAvis)
		REFERENCES Compte(idCompte)

ALTER TABLE Avis
	ADD CONSTRAINT fkAvisLivre
	FOREIGN KEY (idLivreAvis)
		REFERENCES Livre(idLivre)

ALTER TABLE Commande
	ADD CONSTRAINT fkCommandeCompte
	FOREIGN KEY (idCompteCommande)
		REFERENCES Compte(idCompte)

ALTER TABLE Commande
	ADD CONSTRAINT fkCommandeAdresseFacturation
	FOREIGN KEY (idAdresseFacturationCommande)
		REFERENCES Adresse(idAdresse)

ALTER TABLE Commande
	ADD CONSTRAINT fkCommandeAdresseLivraison
	FOREIGN KEY (idAdresseLivraisonCommande)
		REFERENCES Adresse(idAdresse)

ALTER TABLE Commande
	ADD CONSTRAINT fkCommandeLivreur
	FOREIGN KEY (idLivreurCommande)
		REFERENCES Livreur(idLivreur)

ALTER TABLE Commande
	ADD CONSTRAINT fkCommandeOrganismePaiement
	FOREIGN KEY (idOrganismePaiementCommande)
		REFERENCES OrganismePaiement(idOrganismePaiement)

ALTER TABLE [dbo].[Documentation] WITH CHECK ADD CONSTRAINT [fkDocumentationAuteur] FOREIGN KEY([IDAuteurDocumentation])
	REFERENCES [dbo].[Auteur] ([IDAuteur])

ALTER TABLE [dbo].[Documentation] WITH CHECK ADD CONSTRAINT [fkDocumentationGenreAuteur] FOREIGN KEY([IDGenreAuteurDocumentation])
	REFERENCES [dbo].[GenreAuteur] ([IDGenreAuteur])

ALTER TABLE [dbo].[Ecriture] WITH CHECK ADD CONSTRAINT [fkEcritureIdAuteur] FOREIGN KEY([IDAuteurEcriture])
	REFERENCES [dbo].[Auteur] ([IDAuteur])

ALTER TABLE [dbo].[Ecriture] WITH CHECK ADD CONSTRAINT [fkEcritureIdLivre] FOREIGN KEY([IDLivreEcriture])
	REFERENCES [dbo].[Livre] ([IDLivre])

ALTER TABLE [dbo].[Presentation] WITH CHECK ADD CONSTRAINT [fkPresentationEvenement] FOREIGN KEY([IDEvenementPresentation])
	REFERENCES [dbo].[Evenement] ([IDEvenement])

ALTER TABLE [dbo].[Presentation] WITH CHECK ADD CONSTRAINT [fkPresentationLivre] FOREIGN KEY([IDLivrePresentation])
	REFERENCES [dbo].[Livre] ([IDLivre])

--AUTRES CONTRAINTES (unicité, check..)

		--=======================================================
ALTER TABLE LIVRE
	ADD CONSTRAINT dfNBPageLivre
		DEFAULT 0 FOR NBPageLivre
		
ALTER TABLE LIVRE
	ADD CONSTRAINT dfPoidsLivre
		DEFAULT 0 FOR poidsLivre
				
ALTER TABLE LIVRE
	ADD CONSTRAINT dfPrixLivre
		DEFAULT 0 FOR prixHTLivre	
		
ALTER TABLE LIVRE
	ADD CONSTRAINT dfquantiteStockLivre
		DEFAULT 0 FOR quantiteStockLivre

		--=======================================================
		
ALTER TABLE Compte
	ADD CONSTRAINT chDateCreationCompte
		CHECK (dateCreationCompte<DateDestructionCompte)

ALTER TABLE LigneCommande
	ADD CONSTRAINT chTVALigneCommande
		CHECK (TVALigneCommande BETWEEN 0 AND 100)
		
ALTER TABLE LigneCommande
	ADD CONSTRAINT chQuantiteLigneCommande
		CHECK (quantiteLigneCommande>0)
		
ALTER TABLE LigneCommande
	ADD CONSTRAINT chPrixHTLivreLigneCommande
		CHECK (prixHTLivreLigneCommande>0)
 
 ALTER TABLE Auteur
	ADD CONSTRAINT chDateNaissanceAuteur
		CHECK (dateNaissanceAuteur<dateDecesAuteur)
 
ALTER TABLE Auteur
	 ADD CONSTRAINT chSexeAuteur
		CHECK (sexeAuteur IN ('M','F','A'))
		
ALTER TABLE Avis
	ADD CONSTRAINT chNoteAvis
		CHECK (noteAvis BETWEEN 0 and 100)
 
 ALTER TABLE Compte
	ADD CONSTRAINT chEmailAuteur
		CHECK (emailCompte like '%@%')
	/*	
 ALTER TABLE Livre
	ADD CONSTRAINT unISBNLivre
		UNIQUE (dateParutionLivre, ISBNLivre)
*/
ALTER TABLE Evenement
	ADD CONSTRAINT chDateDebutEvenement
		CHECK (dateDebutEvenement < dateFinEvenement)

ALTER TABLE Presentation
	ADD CONSTRAINT chValeurPromoPresentation
		CHECK (valeurPromoPresentation BETWEEN 0 AND 100)
		
--============================================================
--CREATION DES FOREIGN KEY PAR RAPPORT A LA TABLE STATUT
--TABLE ADRESSE
ALTER TABLE Adresse
ADD CONSTRAINT fkAdresseStatut
FOREIGN KEY (IDStatutAdresse)
REFERENCES Statut(IDStatut)

--TABLE AVIS
ALTER TABLE Avis
ADD CONSTRAINT fkAvisStatut
FOREIGN KEY (IDStatutAvis)
REFERENCES Statut(IDStatut)

--TABLE COMMANDE 01
ALTER TABLE Commande
ADD CONSTRAINT fkCommandeStatut
FOREIGN KEY (IDStatutCommande)
REFERENCES Statut(IDStatut)

--TABLE COMMANDE 02
ALTER TABLE Commande
ADD CONSTRAINT fkLivraisonStatut
FOREIGN KEY (IDStatutLivraisonCommande)
REFERENCES Statut(IDStatut)

--TABLE COMMANDE 03
ALTER TABLE Commande
ADD CONSTRAINT fkReglementStatut
FOREIGN KEY (IDStatutReglementCommande)
REFERENCES Statut(IDStatut)

--TABLE COMPTE
ALTER TABLE Compte
ADD CONSTRAINT fkCompteStatut
FOREIGN KEY (IDStatutCompte)
REFERENCES Statut(IDStatut)

--TABLE COUP DE COEUR
ALTER TABLE CoupDeCoeur
	ADD CONSTRAINT fkCoupDeCoeurStatut
	FOREIGN KEY (IDStatutCoupDeCoeur)
		REFERENCES Statut(IDStatut)		

--TABLE EVENEMENT
ALTER TABLE Evenement
ADD CONSTRAINT fkEvenementStatut
FOREIGN KEY (IDStatutEvenement)
REFERENCES Statut(IDStatut)

--TABLE LIVRE
ALTER TABLE Livre
ADD CONSTRAINT fkLivreStatut
FOREIGN KEY (IDStatutLivre)
REFERENCES Statut(IDStatut)

--=======================================================

DELETE FROM Permission
DELETE FROM Moderation
DELETE FROM Compte
DELETE FROM Avis
DELETE FROM Commande
DELETE FROM Livreur
DELETE FROM Permission
DELETE FROM Documentation
DELETE FROM Evenement
DELETE FROM GenreAuteur
DELETE FROM CoupDeCoeur
DELETE FROM Editeur
DELETE FROM Presentation
DELETE FROM Ecriture
DELETE FROM MiseEnAvant
DELETE FROM Description
DELETE FROM Genre
DELETE FROM Liaison
DELETE FROM MotClef
DELETE FROM InfoLibrairie
DELETE FROM Statut
DELETE FROM Livre
DELETE FROM TVA
DELETE FROM Relation
DELETE FROM Theme
DELETE FROM SousTheme
DELETE FROM OrganismePaiement
DELETE FROM Adresse
DELETE FROM Auteur

INSERT INTO Statut
	(refStatut, descriptionStatut)
VALUES
	('AN','annuler'),
	('EC','en cours'),
	('IN','Invisible'),
	('DEF','defaut'),
	('T','terminer'),
	('AV','à venir'),
	('BAN','banni'),
	('AD','Admin'),
	('ES','en stock'),
	('EX','expedié'),
	('DCD','mort'),
	('MD','modere'),
	('NMD', 'non modere')

	
INSERT INTO Livreur (
	nomLivreur, commentaireLivreur ,IDStatutLivreur
)VALUES
	('LaPoste', 'Très bon livreur',1 ),
	('EcoCourrier', 'Il faut essayer et voir s ils sont rapides',1),
	('Speed-', 'Ne plus faire appel à eux trop de pb',1)

INSERT INTO Permission (
	nomPermission, niveauPermission ,IDStatutPermission
)VALUES
	('Banni',0,1),
	('Defaut',1,1),
	('Client',2,1),
	('Stagiaire',3,1),
	('Employé',4,1),
	('Gérant',5,1),
	('Super-Admin',6,1)
	
INSERT INTO Auteur(
	nomAuteur, prenomAuteur, dateNaissanceAuteur, dateDecesAuteur, sexeAuteur, biographieAuteur, commentaireAuteur,IDStatutAuteur
)VALUES
	('Hugo','Victor','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 01-01-1900 à Paris','Auteur très demandé, classic.',1),
	('LaFontaine','Jean','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 02-02-1902 à Montpellier','A écrit les fables comme celle du lièvre et de la tortue.',1),
	('Duthé','Allament','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','A','Né le 03-03-1903 à Marakesh','Auteur inventé qui se sert chaud et sucré.',1),
	('Jean-Charles','Chapuzet','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 03-03-1904 à Nice','Trouvé sur le site librairie.com en cherchant au pif.',1),
	('Pellegrino','Bruno','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 04-04-1900 à Rennes','Poete du XIX',1),
	('Verlaine','Paul','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 04-04-1900 à Poitiers','Poete du XIX',1),
	('Beaudelaire','Charles','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 04-04-1905 à Créteil','Trouvé sur le site librairie.com en cherchant au hasard.',1),
	('Vernes','Jules','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','M','Né le 04-04-1901 à Créteil','Visionnaire science fiction.',1),
	('De Beauvoir','Simone','2000-05-08 12:35:29.123','2007-05-08 12:35:29.123','F','Née le 05-05-1906 à Marseille','Une auteur ou peut être autrice ou encore Aut.eur.trice.',1)

INSERT INTO TVA
	(valeurTVA, IDStatutTVA)
VALUES
	('19.6',1),
	('5.5',1)

INSERT INTO OrganismePaiement
	(nomOrganismePaiement, IDStatutOrganismePaiement, commentaireOrganismePaiement)
VALUES
	('PAYPAL',1,'zer'),
	('MasterCard',1,'sfss'),
	('Visa',2,'zetrer')

INSERT INTO Theme
	(nomTheme, descriptionTheme,IDStatutTheme)
VALUES
	('Architecture','fdhd',1),
	('Architecture d''intérieur','dfh',1),
	('Architecture domestique, habitations','dfhh',1),
	('Architecture et urbanisme','',1),
	('Construction','dfhfh',1),
	('Patrimoine architectural','fdhdf',1),
	('Urbanisme','fdhdfh',1),
	('Arts décoratifs, industriels et commerciaux','fdhdfh',1),
	('Arts graphiques','fdhdf',1),
	('Arts multimédia','fdhfdh',1),
	('Arts plastiques','dfhdd',1),
	('Cinéma','dfhd',1),
	('Danse','dfhdh',1),
	('Ecrits sur l''art','dhtdh',1),
	('Histoire de l''art','ghjfj',1),
	('Musique','ghjgg',1),
	('Peinture','ghjg',1),
	('Photos et vidéos','hjgjgh',1),
	('Sculpture','ghjhg',1),
	('Spectacles','ghjh',1),
	('Techniques et procédés','hgjhg',1),
	('Théâtre','hgjhg',1)

INSERT INTO MotClef 
	(nomMotClef, descriptionMotClef, IDStatutMotClef)
VALUES
	('romantisme','wissam le branleur',1),
	('tragedie','wissam le pti',1),
	('humour','wissam le con',1),
	('action','wissam l''enculer',1),
	('tragedie','wissam le pd',1),
	('melodrame','wissam le chien',1),
	('guerre','violence, epique, historique',1),
	('nature','paysages, voyage, écologie',1),
	('politique','discours, historique, actualité',1),
	('nouveauté','actualité, sorties, récent',1),
	('musique','biographie, historique, société',1)

INSERT INTO GENRE 
	(nomGenre, descriptionGenre, IDStatutGenre)
VALUES
	('Architecture et urbanisme','',1),
	('arts','',1),
	('bandes déssinnées, mangas','',1),
	(' Bien être et vie pratique','',1),
	(' Economie, industrie, technique','',1),
	(' Education, connaissance','',1),
	(' Jeunesse','',1),
	(' Littérature','',1),
	(' Loisirs, Distractions','',1),
	('Sciences humaines, sociales','',1),
	('Drame','Toute pièce de théâtre ( un auteur de théâtre est un dramaturge)',1),
	('Comédie','Pièce de théâtre qui met en scène des personnages de condition moyenne et des évènements communs qui se termine bien, et dont le but est de faire rire .',1),
	('La poésie' , 'Texte en vers ou en prose rythmée.',1),
	('Autobiographie ','Réçit de la vie d''un auteur écrit par l''auteur lui même (=mémoire).',1),
	('Comédie','Pièce de théâtre qui met en scène des personnages de condition moyenne et des évènements communs qui se termine bien, et dont le but est de faire rire .',1),
	('Chanson', 'Texte en vers destiné à être chanté et composé en général de couplets de IDrains.',1),
	('Conte','Réçit assez court d''évènements imaginaires et présentés comme tels.',1)

insert into GenreAuteur
	(nomGenreAuteur,descriptionGenreAuteur, IDStatutGenreAuteur)
values
	('poete','famille de la grande poésie',1),
	('dramaturge','famille de la dramaturgie ',1),
	('nouvelliste','famille des grandes npuvelles',1),
	('romancier','écrit des romans',1),
	('série','écrit des series',1),
	('romantique','epoque des romantiques',1),
	('politicien','ecrit sur le monde politique',1),
	('specialiste sportif','historique et récent',1),
	('bedeiste','famille de la grande bd',1)
	
INSERT INTO InfoLibrairie 
	(typeInfoLibrairie,contenuInfoLibrairie,referenceInfoLibrairie,commentaireInfoLibrairie, IDStatutInfoLibrairie)
VALUES
	('salut','salut salut','1454fdsfghg154','',1),
	('hello','hello hello','1454fdsghfg154','',1),
	('coucou','coucou coucou','1454fdsg154','',1),
	('hey','hey hey','1454fdsg154','',1),
	('hola','hola hola','1454fdfghsg154','',1),
	('salam','salam salam','1454fdsg154','',1),
	('image_ban','baniere page principale','c:\\mesImages\\ban.jpg','ne pas modifier',1),
	('logo','logo principal','c:\\mesImages\\logo.jpg','ne pas modifier',1),
	('logo','logo de noel','c:\\mesImages\\logo_noel.jpg','du 10/12 au 10/01',1)
	
	
insert into Evenement
	(dateDebutEvenement, dateFinEvenement,nomEvenement, typeEvenement,descriptionEvenement , commentaireEvenement, IDStatutEvenement)
values 
	('2018-02-26','2018-03-26','le mois policier','exceptionel','selection des meilleurs ventes de romans policiers','',1),
	('2018-03-16','2018-05-20','Le Salon du Livre','salon','A l occasion du festival du livre 2018','seance dédicace tous les jours',1),
	('2018-01-26','2018-02-26','le mois romantique','exceptionel','selection des meilleurs ventes de romans romantique','',2),
	('2018-04-26','2018-05-26','le weekend','hebdomadaire','selection des meilleurs ventes de romans de la semaine','',2),
	('2018-10-01','2018-11-01','Lannée','annuel','selection des meilleurs ventes de romans de la lannée','',3),
	('2018-09-01','2018-10-01','CoolEvent','semainePromo','selection des meilleurs stroumph','qsdza',3),
	('2018-08-01','2018-9-01','SuperEvent','semainePromo','selection des meilleurs livres de super-héro','azeas',4)

insert into Editeur
	(nomEditeur , nomEdition, commentaireEditeur, IDStatutEditeur)
values
	('galimard' ,'galimard jeunesse' ,'jeunesse',1),
	('hatier','hatier apprentissage' ,'scolaire',1),
	('hatier','hatier' ,'scolaire',1),
	('hatier','hatier senior' ,'scolaire',1),
	('atlas ','LGA' , 'le monde',1),
	('bayard' ,'Bayard Histoire' , 'historique',1),
	('Eyrolles' ,'Collection Noire' , 'Informatique',1)
	
INSERT INTO Livre
	(IDEditeurLivre, IDTVALivre, ISBNLivre, titreLivre, sousTitreLivre, resumeLivre, couvertureLivre, prixHTLivre, quantiteStockLivre, dateParutionLivre, nbPageLivre, poidsLivre, gabariLivre, commentaireLivre, IDStatutLivre)
VALUES
	(1,1,'980-2-7577-0567-4','La tapisserie française','Du Moyen Age à nos jours','Un panorama de l''art de la tapisserie française depuis le Moyen Age. Il présente ses usages, ses commanditaires, l''évolution de son décor, les tentures majeures de son histoire, mais aussi les créations des ateliers contemporains.','tapisserie.png','49', 100 ,'09-11-2017', 351 ,'2230','Grand Format','Pas super',1),
	(2,1,'981-2-7577-0567-4','La tapisserie de française',' Yeah','Un panorama de l''art de la tapisserie française depuis l''age d''or. Il présente ses usages, ses commanditaires, l''évolution de son body, les tentures majeures de son histoire, mais aussi les créations des marsiens.','null.png','15', 20 ,'09-11-2017', 80 ,'530','Moyen Format','Super benef sur celui la',2),
	(2,1,'982-2-7577-0569-4','Star Wars Episode 12','La revanche du retour des jedi du clan des sith','Livre avec beaucoup de force et d effets speciaux','cov_starwars01.jpg' ,'30', 35 ,'29-12-2017', 20 ,'300','Petit Format','Super ventes prévues !',2),
	(5,1,'983-2-7577-6542-4','Les fables','De Lafontaine','Suite de fables','cov_fables01.jpg','40', 15 ,'29-12-1817', 20 ,'300','Petit Format','Prévoir a la rentrée',4),
	(6,1,'984-2-7577-0569-4','20 000 lieues sous les mers','','Voyage au fond des océans.','20000.jpg','15', 20 ,'28-12-2017', 80 ,'530','Petit Format','ID20000',4),
	(7,1,'978-2-2121-4384-3','Le livre de Java','premier langage','Une initiation au langage ainsi qu à Android Studio pour construire une application.','cov_java01.jpg',29.90, 4 ,'24-03-2016', 598 ,850,'Petit Format','Collection Noire',2)

insert into Presentation
	(IDEvenementPresentation, IDLivrePresentation, nomPromoPresentation, valeurPromoPresentation, IDStatutPresentation)
values
	(1, 1, 'promo du jour','10',1),
	(2, 1, 'promo exceptionel','5',1),
	(3, 2, 'promo de la semaine','8',1),
	(4, 2, 'promo du mois','20',1),
	(5, 3, 'promo semaine 22','20',1),
	(6, 4, 'promo 50/50','30',1),
	(7, 5, 'promo stroumph','10',1)
	
INSERT INTO Compte(
	IDPermissionCompte, nomCompte, prenomCompte, pseudoCompte, MDPCompte, emailCompte, dateCreationCompte, telephoneCompte, commentaireCompte, IDStatutCompte
)VALUES
	(6, 'Afpa', 'Panoel', 'Toto', 'afpa', 'afpa.panoel@gmail.com', '2006-05-08 12:35:29.123', '0545641654', 'Compte Afpa', 4),
	(1, 'Jean', 'Bono', 'Jambon2Parm', 'porc', 'jean.bono@gmail.com', '2007-05-08 12:35:29.123', '056421654', 'Notre premier compte!', 1),
	(1, 'Joana', 'Nanas', 'Fruitos', 'Mandarine1!', 'monmail.aze@hotmail.com', '2007-05-08 12:35:29.123', '012346544', 'Bon payeur', 1),
	(2, 'Alain', 'Cognito', 'ACO', 'mlskfdq06546', 'acognito@hopmail.fr', '2007-05-08 12:35:29.123', '0565436554', 'Client VIP', 2),
	(5, 'Escobar', 'Pablo', 'IamZeBoss', 'sldkfj123', 'escoco@hopmail.co', '2017-05-08 12:35:29.123', '056546654', 'Client dangereux', 2),
	(4, 'Admin', 'Admin', 'Admin', 'Admin1!', 'admin@librairie.com', '2013-05-08 12:35:29.123', '026546545', 'Compte Admin', 1),
	(3, 'Duraant', 'Jean', 'ACO', 'mqsd546', 'qsdq@ail.fr', '2007-05-08 12:35:29.123', '0565436554', 'Boss', 1)

	INSERT INTO SousTheme
	(IDThemeSousTheme, nomSousTheme,descriptionSousTheme, IDStatutSousTheme)
VALUES
	(1,'Architectes et paysagistes','hgjghj',1),
	(1,'Architecture et construction','ghjgh',1),
	(2,'Architecture militaire, fortifications','hghj',1),
	(3,'Artisanat','ghjhgj',1),
	(4,'Arts du textile','ghjghj',1),
	(5,'Design graphique, lettrage','ghjghg',1)
	
INSERT INTO Description 
	(IDLivreDescription, IDGenreDescription, IDStatutDescription)
VALUES
	(1, 1,1),
	(2, 2,1),
	(2, 3,1),
	(3, 3,1),
	(4, 4,1),
	(5, 5,1),
	(6, 6,1)
	
insert into Documentation
	(IDAuteurDocumentation, IDStatutDocumentation)
values                       
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1)
	
INSERT INTO Relation
	(IDLivreRelation, IDSousThemeRelation, IDStatutRelation)
VALUES
	(1,1,1),
	(2,4,1),
	(3,2,1),	
	(3,4,1),	
	(4,2,1),	
	(5,2,1)

INSERT INTO CoupDeCoeur 
	(IDCompteCoupDeCoeur, nomCoupDeCoeur, descriptionCoupDeCoeur, IDStatutCoupDeCoeur)
VALUES
	(1,'Notre top 10', 'Les 10 livres les plus aimés de notre équipe de lecteurs du dimanche',2),
	(1,'Top ventes 5', 'Les 5 meilleures ventes de l année',1),
	(2,'Livres naturels', 'Livres équitables bio detox vegan et colo',1),
	(3,'Spécial Elections', 'Livres de l actualité politique',2)

INSERT INTO MiseEnAvant 
	(IDCoupDeCoeurMiseEnAvant,IDLivreMiseEnAvant, IDStatutMiseEnAvant)
VALUES
	(1,1,1),
	(1,2,1),
	(2,2,1),
	(2,3,1),
	(3,3,1),	
	(3,4,1),	
	(3,5,1),	
	(2,6,1),	
	(3,6,1)

INSERT INTO Liaison 
	(IDLivreLiaison, IDMotClefLiaison, IDStatutLiaison)
VALUES
	(1,1,1),
	(1,5,1),
	(2,4,1),
	(2,6,1),
	(3,5,1),	
	(4,5,1),	
	(5,4,1),	
	(5,1,1),		
	(6,6,1),	
	(6,7,1)	
	
insert into Ecriture 
	(IDAuteurEcriture, IDLivreEcriture, IDStatutEcriture)
values 
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,1),
	(5,5,1),
	(6,6,1)

INSERT INTO Adresse
	(IDCompteClientAdresse, IDCompteEmployeAdresse, nomDestinataireAdresse, prenomDestinataireAdresse, numVoieAdresse, typeVoieAdresse, nomVoieAdresse, complementAdresse, codePostalAdresse, villeAdresse, paysAdresse, IDStatutAdresse, commentaireAdresse)
VALUES 
	(1,1,'CHEW','Bacca','10','rue','Guerre des Etoiles','Chez Mr Dark Vador','75000','Paris','France',1,''),
	(2,2,'MASSA','Robert','1010','avenue','Marcos','','75012','Paris','France',1,''),
	(2,2,'TEXAS','Georges','1bis','boulevard','des Etats-Unis','Chez Mme KELLY','33000','Bordeaux','France',1,''),
	(3,3,'CHA','Anne-Laure','30Ter','Allée','des Marguerites','','31300','Mars','France',2,''),
	(4,4,'CHEWING','Gum','213','impasse','Malabar','Chez Mr Propre','94160','Saint-Mandé','France',2,'')

insert into Commande
	(IDAdresseFacturationCommande, IDAdresseLivraisonCommande, IDCompteCommande, IDLivreurCommande, IDOrganismePaiementCommande,
	dateCommande, dateExpeditionCommande, adresseIPCommande, commentaireCommande, tarifLivraisonCommande, modeLivraisonCommande, montantCommande,
	modeReglementCommande, numTransactionReglementCommande, IDStatutCommande, IDLivraisonCommande,IDStatutLivraisonCommande, IDStatutReglementCommande)
values
	(1,1,1,1,1,'2012-12-10','2012-18-10', '544984984','',12.48, 'express',28,'CB','01561564155',1,1,1,2),
	(2,2,2,1,2,'2015-12-11','2015-18-11', '544544984','',4.40, 'classique',48,'CB','0654545165',2,2,1,1),
	(3,3,3,2,3,'2017-19-10','2012-25-10', '784784984','',20.33, 'express',33,'CB','78789165',3,2,2,1)

INSERT INTO LigneCommande(
	IDCommandeLigneCommande, IDLivreLigneCommande, quantiteLigneCommande, TVALigneCommande, prixHTLivreLigneCommande, valeurPromoLigneCommande,
	IDStatutLigneCommande
)VALUES
	(1, 1, 2, 5.5, 19.9, 0,1),
	(2, 1, 1, 5.5, 9.5, 2,1),
	(2, 2, 1, 5.5, 29.9, 0,1)	

INSERT INTO Avis(
	IDLivreAvis, IDLigneCommandeAvis, IDCompteAvis, noteAvis, contenuAvis, dateAvis, titreAvis, IPavis, IDStatutAvis
)VALUES
	(1, 1, 1, 90, 'J ai super méga beaucoup aimé ! :))', '2007-05-08 12:35:29.123', 'Trop Bien JEM', '192.168.1.99', 1),
	(2, 2, 2, 50, 'A moitié content car moitié passionnant', '2007-05-08 12:35:29.123', 'Moyen', '235.178.1.99', 2),
	(2, 3, 3, 50, 'Vraiment bif bof surtout la fin car il meurt ! Vivement la suite', '2007-05-08 12:35:29.123', 'Bof', '235.178.1.99', 2)
		
INSERT INTO Moderation (
	IDAvisModeration, IDCompteModeration, commentaireModeration, dateModeration, IDStatutModeration
)VALUES
	(1 ,3 ,'Commentaire effacé car innaproprié','2007-05-08 12:35:29.123',1),
	(2 ,3 ,'Commentaire modifié','2007-05-08 12:35:29.123',1),
	(3 ,4,'Commentaire supprimé après échanges en privé avec l utilisateur','2007-05-08 12:35:29.123',1)

	
--====================================VUES==================================
DROP VIEW VueEmilien
--====================================VUES==================================
GO
CREATE VIEW VueEmilien
	AS 
		SELECT *  FROM Livre 
		JOIN Ecriture
		ON IDLivre = IDlivreEcriture
		JOIN Auteur
		ON IDAuteur = IDAuteurEcriture
		JOIN Documentation
		ON IDAuteur = IDAuteurDocumentation
		JOIN GenreAuteur
		ON IDGenreAuteurDocumentation = IDGenreAuteur
		JOIN EDITEUR 
		ON IDEditeur = IDEditeurLivre
		JOIN Statut
		ON IDStatutLivre = IDStatut

--==================================================================================================	
/*
--Pour effacer les donnees et les id Auto_incremente
DELETE FROM avis
DBCC CHECKIDENT (avis, RESEED, 0)
SELECT * FROM avis
*/



