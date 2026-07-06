# Évaluation d'un projet d'agroécologie et de sécurité alimentaire — Régions Nord et Est, Burkina Faso

Analyse statistique complète avec **IBM SPSS**, réalisée dans le cadre d'une étude d'évaluation de projet de développement (approche MEAL / Suivi-Évaluation). Ce dépôt sert de démonstration de compétences en traitement, analyse et interprétation de données d'enquête ménages dans le secteur humanitaire et du développement.

## Contexte du projet

Une ONG met en œuvre un projet de promotion de pratiques agroécologiques (compost, agroforesterie, aménagement des parcelles) auprès de ménages agricoles des régions **Nord** et **Est** du Burkina Faso, dans l'objectif d'améliorer leur sécurité alimentaire. Une enquête ménages est conduite en fin de projet auprès de **420 ménages** (bénéficiaires et témoins) afin d'évaluer les effets de l'intervention sur la consommation alimentaire, le rendement céréalier, le revenu agricole et le niveau d'insécurité alimentaire.

> Les données utilisées ici sont **synthétiques** (générées pour ce portfolio), mais construites pour reproduire fidèlement la structure, les échelles et les relations statistiques d'une véritable enquête de sécurité alimentaire (méthodologie proche du Score de Consommation Alimentaire — SCA/FCS — utilisé par le PAM).

## Objectifs de l'analyse

1. Décrire les caractéristiques démographiques, socio-économiques et agricoles des ménages enquêtés.
2. Tester si le projet est associé à une amélioration statistiquement significative de la sécurité alimentaire (Khi², test t, ANOVA).
3. Modéliser les déterminants du score de consommation alimentaire (régression linéaire) et du risque d'insécurité alimentaire sévère (régression logistique), en contrôlant les facteurs de confusion (richesse, taille du ménage, accès à l'eau, région).
4. Vérifier la validité des modèles (normalité des résidus, multicolinéarité, qualité d'ajustement).

## Méthodologie et outils

- **Logiciel** : IBM SPSS Statistics (syntaxe `.sps`, reproductible et versionnée)
- **Plan d'analyse** : descriptif → inférentiel → explicatif (régression), démarche standard d'un rapport d'évaluation de projet
- **Échantillon** : 420 ménages, échantillonnage stratifié bénéficiaires/témoins sur deux régions
- **Tests réalisés** : Khi² d'indépendance, test t de Student (échantillons indépendants), ANOVA à un facteur avec post-hoc (Tukey, Bonferroni), corrélation de Spearman, régression linéaire multiple, régression logistique binaire
- **Vérification des hypothèses** : normalité des résidus (Shapiro-Wilk, Q-Q plot), homoscédasticité, multicolinéarité (VIF/tolérance), indépendance des résidus (Durbin-Watson), test de Hosmer-Lemeshow

## Structure du dépôt

```
├── data/
│   ├── menages_agroecologie_burkina.sav      # Base de données SPSS (avec étiquettes)
│   └── menages_agroecologie_burkina.csv      # Base de données au format CSV
├── scripts/
│   ├── 01_statistiques_descriptives.sps      # Fréquences, tableaux croisés, graphiques
│   ├── 02_statistiques_inferentielles.sps    # Khi², t de Student, ANOVA + interprétations
│   └── 03_regression.sps                     # Régression linéaire et logistique + diagnostics
├── output/
│   └── (tableaux et graphiques exportés depuis SPSS — .png / .pdf)
└── docs/
    ├── dictionnaire_variables.md             # Dictionnaire complet des 24 variables
    └── rapport_synthese.md                   # Rapport de synthèse des résultats
```

## Comment exécuter l'analyse

1. Ouvrir IBM SPSS Statistics (version 25 ou plus récente recommandée).
2. Définir le dossier du dépôt comme répertoire de travail, ou adapter les chemins `GET FILE='data/...'` en tête de chaque script.
3. Exécuter les scripts dans l'ordre : `01_statistiques_descriptives.sps` → `02_statistiques_inferentielles.sps` → `03_regression.sps`.
4. Les résultats s'affichent dans le Viewer SPSS ; les exporter en PDF/Word via *Fichier > Exporter* pour archivage dans `output/`.

## Principaux résultats

| Indicateur | Bénéficiaires | Témoins | Test | Résultat |
|---|---|---|---|---|
| Score de Consommation Alimentaire (SCA), moyenne | 54,6 | 39,8 | Test t | t = 14,55 ; **p < 0,001** |
| Insécurité alimentaire sévère | 3,6 % | 35,2 % | Khi² | χ² = 67,77 ; **p < 0,001** |
| Score SCA selon quintile de richesse (Q1 → Q5) | 41,8 → 53,3 | — | ANOVA | F = 11,25 ; **p < 0,001** |

**Régression linéaire (score SCA)** — R² = 0,52 : être bénéficiaire du projet (+14,0 points), le quintile de richesse (+2,5 pt/quintile) et l'accès à l'eau potable (+6,1 pts) sont associés positivement et significativement au score SCA ; la taille du ménage y est associée négativement (-0,66 pt/membre). Diagnostics : résidus normaux (Shapiro-Wilk p = 0,78), absence de multicolinéarité (VIF < 1,03), pas d'autocorrélation (Durbin-Watson ≈ 1,94).

**Régression logistique (insécurité alimentaire sévère)** — être bénéficiaire réduit le risque d'insécurité alimentaire sévère d'environ 94 % (OR ≈ 0,06 ; p < 0,001), à richesse, taille du ménage, accès à l'eau et région comparables. Taux de classification correcte du modèle : 84,8 %.

**Conclusion** : les résultats convergent vers un effet positif, robuste et statistiquement significatif du projet d'agroécologie sur la sécurité alimentaire des ménages bénéficiaires, indépendamment de leur niveau de richesse initial.

Le détail complet des interprétations est disponible dans [`docs/rapport_synthese.md`](docs/rapport_synthese.md).

## Compétences démontrées

- Construction et documentation d'une base de données d'enquête (dictionnaire des variables, gestion des valeurs manquantes)
- Écriture de syntaxe SPSS structurée, commentée et reproductible (plutôt que l'usage exclusif des menus)
- Statistiques descriptives et visualisation de données (fréquences, tableaux croisés, boîtes à moustaches, histogrammes)
- Tests d'hypothèses paramétriques et non paramétriques, avec interprétation correcte au regard du contexte projet
- Modélisation par régression linéaire et logistique, incluant la vérification rigoureuse des hypothèses sous-jacentes (validité du modèle)
- Capacité à traduire des résultats statistiques en conclusions opérationnelles pour un rapport d'évaluation de projet (MEAL)

## À propos

**Hama DIALLO (Sékou)** — Data Analyst / Chargé MEAL, spécialisé en suivi-évaluation de projets de développement et statistiques appliquées au Sahel.
Contact : hamadiallo789@gmail.com · Portfolio : [hamadiallo789-beep.github.io/portfolio](https://hamadiallo789-beep.github.io/portfolio)
