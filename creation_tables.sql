-- Creation de la table 'Departements'
CREATE TABLE departements (
    id_departement INT PRIMARY KEY,
    nom_departement VARCHAR(255) NOT NULL,
    manager VARCHAR(255) NOT NULL,
    budget NUMERIC 
);

-- Creation de la table 'Employes'
CREATE TABLE employes (
    id_employe INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    poste VARCHAR(50),
    departement_id INT,
    date_embauche DATE,
    date_depart DATE,
    salaire NUMERIC,
    FOREIGN KEY (departement_id) REFERENCES departements(id_departement)
);

CREATE TABLE performances (
    id_performance INT PRIMARY KEY,
    id_employe INT,
    date_evaluation DATE,
    score INT,
    objectifs_atteints BOOLEAN,
    FOREIGN KEY (id_employe) REFERENCES employes(id_employe)
);

-- Creation de la table 'turnover'
CREATE TABLE turnover (
    id_depart INT PRIMARY KEY,
    id_employe INT,
    date_depart DATE,
    type_depart VARCHAR(20),
    anciennete INT
);

SELECT * FROM departements;
SELECT * FROM employes;
SELECT * FROM performances;
SELECT * FROM turnover;