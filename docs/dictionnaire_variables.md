# Dictionnaire des variables

Base : `data/menages_agroecologie_burkina.sav` / `.csv` — 420 ménages enquêtés, régions Nord et Est du Burkina Faso.

| Variable | Libellé | Type | Modalités / unité |
|---|---|---|---|
| `id_menage` | Identifiant unique du ménage | Numérique | 1–420 |
| `region` | Région d'enquête | Qualitative nominale | Nord / Est |
| `province` | Province d'enquête | Qualitative nominale | Passoré, Yatenga, Zondoma (Nord) ; Gourma, Gnagna, Komondjari (Est) |
| `groupe` | Groupe d'appartenance | Qualitative nominale | Bénéficiaire / Témoin |
| `sexe_cdm` | Sexe du chef de ménage | Qualitative nominale | Homme / Femme |
| `age_cdm` | Âge du chef de ménage | Numérique (années) | 20–80 |
| `situation_matrimoniale` | Situation matrimoniale du chef de ménage | Qualitative nominale | Marié(e) monogame, Marié(e) polygame, Célibataire, Veuf/Veuve, Divorcé(e) |
| `niveau_instruction_cdm` | Niveau d'instruction du chef de ménage | Qualitative ordinale | Aucun, Primaire, Secondaire, Supérieur |
| `taille_menage` | Taille du ménage | Numérique (nb. de membres) | 2–20 |
| `quintile_richesse` | Quintile de richesse du ménage | Qualitative ordinale | 1 (plus pauvre) à 5 (plus riche) |
| `possession_terre_ha` | Superficie de terre possédée | Numérique (hectares) | 0,25–12 |
| `acces_credit` | Accès à un crédit agricole | Qualitative nominale | Oui / Non |
| `distance_marche_km` | Distance au marché le plus proche | Numérique (km) | 0,5–30 |
| `acces_eau_potable` | Accès à une source d'eau potable améliorée | Qualitative nominale | Oui / Non |
| `distance_eau_min` | Distance au point d'eau (aller simple) | Numérique (minutes) | 1–60 |
| `nombre_techniques_agroecologiques` | Nombre de techniques agroécologiques adoptées | Numérique (score) | 0–6 |
| `compost_utilise` | Utilisation de compost / fumure organique | Qualitative nominale | Oui / Non |
| `agroforesterie_pratiquee` | Pratique de l'agroforesterie | Qualitative nominale | Oui / Non |
| `superficie_amenagee_ha` | Superficie aménagée en pratiques agroécologiques | Numérique (hectares) | 0–6 |
| `score_SCA` | Score de Consommation Alimentaire (SCA) | Numérique (échelle 0–112) | Variable de résultat principale |
| `rendement_cereales_kg_ha` | Rendement céréalier | Numérique (kg/ha) | Variable de résultat |
| `revenu_agricole_fcfa` | Revenu agricole de la saison | Numérique (FCFA) | Variable de résultat |
| `nombre_mois_couverture_alim` | Nombre de mois de couverture alimentaire | Numérique (0–12) | Variable de résultat |
| `insecurite_alimentaire_severe` | Ménage en insécurité alimentaire sévère | Binaire (0/1) | 0 = Non, 1 = Oui — variable dépendante de la régression logistique |

## Notes méthodologiques

- **Nature des données** : jeu de données **synthétique**, généré pour reproduire de façon réaliste la structure et les relations statistiques observées dans les enquêtes ménages de sécurité alimentaire en contexte agroécologique (échelle du Score de Consommation Alimentaire — SCA/FCS — méthode PAM/WFP standard). Aucune donnée personnelle ou confidentielle n'est utilisée.
- **Conception** : les effets du groupe bénéficiaire, du quintile de richesse, de l'accès à l'eau et de la taille du ménage ont été injectés de façon contrôlée afin de permettre une démonstration complète et cohérente des tests statistiques (Khi², t de Student, ANOVA, régression linéaire et logistique).
- **Valeurs manquantes** : quelques valeurs manquantes de type MCAR (Missing Completely At Random) ont été introduites sur `acces_credit`, `distance_marche_km` et `niveau_instruction_cdm` pour illustrer la gestion des données manquantes.
