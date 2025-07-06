# BookNest-BACKEND

# Dictionnaire de données – Projet **BookNest**

---

## Table `roles`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique du rôle | PRIMARY KEY |
| nom | VARCHAR(50) | Nom du rôle (admin, user, etc.) | UNIQUE, NOT NULL |

---

## Table `utilisateurs`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique de l'utilisateur | PRIMARY KEY |
| nom | VARCHAR(100) | Nom de l'utilisateur | NOT NULL |
| email | VARCHAR(100) | Adresse email unique | UNIQUE, NOT NULL |
| mot_de_passe | TEXT | Mot de passe (haché) | NOT NULL |
| role_id | INTEGER | Rôle de l'utilisateur | FOREIGN KEY → roles(id), DEFAULT 1 |
| last_login | TIMESTAMP | Dernière connexion | NULL autorisé |
| date_inscription | TIMESTAMP | Date d'inscription | DEFAULT CURRENT_TIMESTAMP |
| reset_token | TEXT | Jeton de réinitialisation du mot de passe | NULL autorisé |
| alert_suppression_envoyee | BOOLEAN | Alerte RGPD envoyée | DEFAULT FALSE |

---

## Table `logs_rgpd_suppressions`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique du log | PRIMARY KEY |
| utilisateur_id | INTEGER | ID de l'utilisateur supprimé | NULL autorisé |
| nom | VARCHAR(100) | Nom de l'utilisateur supprimé | NULL autorisé |
| email | VARCHAR(100) | Email de l'utilisateur supprimé | NULL autorisé |
| date_suppression | TIMESTAMP | Date de suppression | DEFAULT CURRENT_TIMESTAMP |
| raison | TEXT | Raison de la suppression | NULL autorisé |

---

## Table `livres`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique du livre | PRIMARY KEY |
| titre | VARCHAR(200) | Titre du livre | NOT NULL |
| auteur | VARCHAR(100) | Auteur du livre | NULL autorisé |
| description | TEXT | Résumé ou contenu de présentation | NOT NULL |
| categorie | VARCHAR(100) | Catégorie ou genre | NULL autorisé |
| disponible | BOOLEAN | Disponibilité pour emprunt | DEFAULT TRUE |
| image_url | TEXT | URL de l’image de couverture | NULL autorisé |
| stock | INTEGER | Nombre d'exemplaires disponibles | DEFAULT 1, CHECK (>= 0) |
| extrait | TEXT | Extrait du livre | NOT NULL |
| contenu | TEXT | Contenu complet du livre (ebook) | NOT NULL |
| date_ajout | TIMESTAMP | Date d’ajout | DEFAULT CURRENT_TIMESTAMP |
| date_modification | TIMESTAMP | Dernière mise à jour | DEFAULT CURRENT_TIMESTAMP |

---

## Table `emprunts`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique de l’emprunt | PRIMARY KEY |
| utilisateur_id | INTEGER | Référence vers l'utilisateur | FOREIGN KEY → utilisateurs(id), ON DELETE CASCADE |
| livre_id | INTEGER | Référence vers le livre | FOREIGN KEY → livres(id), ON DELETE CASCADE |
| date_emprunt | TIMESTAMP | Date de l'emprunt | DEFAULT CURRENT_TIMESTAMP |
| date_retour | TIMESTAMP | Date prévue/réelle de retour | NULL autorisé |
| rendu | BOOLEAN | Statut de retour | DEFAULT FALSE |

---

## Table `avis`

| Colonne | Type | Description | Contraintes |
|--------|------|-------------|-------------|
| id | SERIAL | Identifiant unique de l’avis | PRIMARY KEY |
| utilisateur_id | INTEGER | Référence vers l'auteur de l’avis | FOREIGN KEY → utilisateurs(id), ON DELETE CASCADE |
| livre_id | INTEGER | Référence vers le livre concerné | FOREIGN KEY → livres(id), ON DELETE CASCADE |
| commentaire | TEXT | Commentaire de l’utilisateur | NOT NULL |
| note | INTEGER | Note sur 5 | CHECK (BETWEEN 1 AND 5) |
| date_avis | TIMESTAMP | Date de publication de l’avis | DEFAULT NOW() |


