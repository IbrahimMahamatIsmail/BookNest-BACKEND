BEGIN;

DROP TABLE IF EXISTS "roles", "utilisateurs", "logs_rgpd_suppressions", "livres", "emprunts", "avis" CASCADE;

-------------------------- Table des rôles --------------------------------------
CREATE TABLE IF NOT EXISTS "roles" (
    "id" SERIAL PRIMARY KEY,
    "nom" VARCHAR(50) UNIQUE NOT NULL
);

---------------------- Table des utilisateurs ------------------------------
CREATE TABLE IF NOT EXISTS "utilisateurs" (
    "id" SERIAL PRIMARY KEY,
    "nom" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) UNIQUE NOT NULL,
    "mot_de_passe" TEXT NOT NULL,
    "role_id" INTEGER NOT NULL DEFAULT 1,
    "last_login" TIMESTAMP,
    "date_inscription" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE SET DEFAULT,
    "reset_token" TEXT,
    "alert_suppression_envoyee" BOOLEAN DEFAULT FALSE
);

----------------------- Tables de log RGPD de suppression des comptes ---------
CREATE TABLE IF NOT EXISTS "logs_rgpd_suppressions" (
    "id" SERIAL PRIMARY KEY,
    "utilisateur_id" INTEGER,
    "nom" VARCHAR(100),
    "email"VARCHAR(100),
    "date_suppression" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "raison" TEXT
);

----------------------- Table des livres -----------------------------------
CREATE TABLE IF NOT EXISTS "livres" (
    "id" SERIAL PRIMARY KEY,
    "titre" VARCHAR(200) NOT NULL,
    "auteur" VARCHAR(100),
    "description" TEXT NOT NULL,
    "categorie" VARCHAR(100),
    "disponible" BOOLEAN DEFAULT TRUE,
    "image_url" TEXT,
    "stock" INTEGER DEFAULT 1 CHECK ("stock" >= 0),
    "extrait" TEXT NOT NULL,
    "contenu" TEXT NOT NULL,
    "date_ajout" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "date_modification" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-------------------------- Table des emprunts ---------------------------------
CREATE TABLE IF NOT EXISTS "emprunts" (
    "id" SERIAL PRIMARY KEY,
    "utilisateur_id" INTEGER REFERENCES "utilisateurs"("id") ON DELETE CASCADE,
    "livre_id" INTEGER REFERENCES "livres"("id") ON DELETE CASCADE,
    "date_emprunt" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "date_retour" TIMESTAMP,
    "rendu" BOOLEAN DEFAULT FALSE
);

------------------------- Table des avis -------------------------------------
CREATE TABLE IF NOT EXISTS "avis" (
    "id" SERIAL PRIMARY KEY,
    "utilisateur_id" INTEGER REFERENCES "utilisateurs"("id") ON DELETE CASCADE,
    "livre_id" INTEGER REFERENCES "livres"("id") ON DELETE CASCADE,
    "commentaire" TEXT NOT NULL,
    "note" INTEGER CHECK ("note" BETWEEN 1 AND 5),
    "date_avis" TIMESTAMP DEFAULT NOW()
);

COMMIT;