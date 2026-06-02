-- Anciennete des employes(en annee)

ALTER TABLE employes
ADD COLUMN anciennete INT;

UPDATE employes
SET anciennete = EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date_embauche);

-- Cohorte d'embauche
ALTER TABLE employes
ADD COLUMN cohorte_embauche VARCHAR(20);
UPDATE employes
SET cohorte_embauche = EXTRACT(YEAR FROM date_embauche);

-- Score moyen par employe
CREATE VIEW score_moyen_par_employe AS
SELECT id_employe, AVG(score) AS score_moyen
FROM performances
GROUP BY id_employe;

-- Categorie de performance
CREATE VIEW categorie_performance AS
SELECT id_employe, 
       score_moyen,
       CASE 
           WHEN score_moyen < 60 THEN 'Faible'
           WHEN score_moyen BETWEEN 60 AND 80 THEN 'Moyenne'
           ELSE 'Elevee'
       END AS categorie_performance
FROM score_moyen_par_employe;