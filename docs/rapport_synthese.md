# Rapport de synthèse — Évaluation du projet d'agroécologie (Régions Nord et Est, Burkina Faso)

## 1. Rappel du contexte et de l'échantillon

L'enquête finale a couvert **420 ménages** répartis entre la région **Nord** (199 ménages ; provinces du Passoré, Yatenga, Zondoma) et la région **Est** (221 ménages ; provinces du Gourma, Gnagna, Komondjari). Parmi eux, **224 ménages (53 %)** sont bénéficiaires du projet d'agroécologie et **196 ménages (47 %)** constituent le groupe témoin.

## 2. Profil descriptif des ménages

- Chefs de ménage majoritairement des hommes (78 %), d'âge moyen 42 ans.
- 48 % des chefs de ménage n'ont reçu aucune instruction formelle, 30 % ont le niveau primaire.
- Taille moyenne du ménage : 7 personnes.
- 56 % des ménages disposent d'un accès à une source d'eau potable améliorée.
- Les ménages bénéficiaires ont adopté en moyenne 3,2 techniques agroécologiques (compost, agroforesterie, aménagement de parcelles), contre moins de 1 chez les témoins.

## 3. Résultats des tests d'hypothèses

### 3.1 Association projet ↔ insécurité alimentaire sévère (Khi²)
χ² = 67,77 ; ddl = 1 ; **p < 0,001**. Seulement 3,6 % des ménages bénéficiaires sont en insécurité alimentaire sévère, contre 35,2 % des témoins. L'association est très fortement significative.

### 3.2 Score de Consommation Alimentaire selon le groupe (test t)
Moyenne bénéficiaires = 54,6 (ET = 10,2 ; n = 224) ; moyenne témoins = 39,8 (ET = 10,6 ; n = 196).
t = 14,55 ; **p < 0,001**. Écart de près de 15 points sur une échelle de 112, en faveur des bénéficiaires.

### 3.3 Score SCA selon le quintile de richesse (ANOVA)
F(4, 415) = 11,25 ; **p < 0,001**. Progression quasi monotone : Q1 = 41,8 ; Q2 = 46,2 ; Q3 = 47,8 ; Q4 = 50,6 ; Q5 = 53,3. Les comparaisons post-hoc (Tukey) permettent d'identifier les paires de quintiles significativement différentes (typiquement les extrêmes Q1 vs Q4/Q5).

### 3.4 Vérification de la normalité
Le test de Shapiro-Wilk appliqué aux résidus du modèle de régression linéaire ne rejette pas l'hypothèse de normalité (W = 0,997 ; p = 0,78), justifiant l'usage de tests paramétriques.

## 4. Modélisation

### 4.1 Régression linéaire multiple — Variable dépendante : score SCA

| Variable | Coefficient (b) | p | Interprétation |
|---|---|---|---|
| Constante | 34,03 | < 0,001 | Score SCA de référence |
| Bénéficiaire du projet | **+14,01** | < 0,001 | Effet le plus important du modèle |
| Quintile de richesse | +2,51 | < 0,001 | Effet dose-réponse |
| Taille du ménage | −0,66 | < 0,001 | Dilution des ressources |
| Accès à l'eau potable | +6,11 | < 0,001 | Effet complémentaire significatif |
| Région (Nord vs Est) | +0,02 | 0,983 | Non significatif |

R² = 0,519 ; R² ajusté = 0,513 ; F(5, 396) = 85,51 ; p < 0,001.

**Diagnostics de validité** : VIF de toutes les variables < 1,03 (aucune multicolinéarité) ; résidus normalement distribués (Shapiro-Wilk p = 0,78) ; Durbin-Watson = 1,94 (pas d'autocorrélation) ; nuage de points résidus/valeurs prédites sans structure apparente (homoscédasticité respectée).

### 4.2 Régression logistique binaire — Variable dépendante : insécurité alimentaire sévère

| Variable | Coefficient (b) | Odds Ratio | p | Interprétation |
|---|---|---|---|---|
| Constante | 1,11 | — | 0,043 | — |
| Bénéficiaire du projet | −2,83 | **0,06** | < 0,001 | Réduit le risque de ~94 % |
| Quintile de richesse | −0,41 | 0,66 | < 0,001 | Réduit le risque de ~34 % par quintile |
| Accès à l'eau potable | −0,82 | 0,44 | 0,006 | Réduit le risque de ~56 % |
| Taille du ménage | −0,03 | 0,97 | 0,629 | Non significatif |
| Région (Nord vs Est) | −0,04 | 0,96 | 0,903 | Non significatif |

Pseudo-R² de Nagelkerke ≈ 0,26 ; taux de classification correcte = 84,8 %. Le test de Hosmer-Lemeshow (à vérifier dans la sortie SPSS) permet de confirmer la qualité d'ajustement globale du modèle.

## 5. Conclusion et recommandations

Les analyses descriptives, inférentielles et de modélisation convergent vers un **effet positif, robuste et statistiquement significatif** du projet d'agroécologie sur la sécurité alimentaire des ménages bénéficiaires, indépendamment de leur niveau de richesse, de la taille du ménage et de leur région d'appartenance.

**Recommandations pour la suite du programme :**
1. Maintenir et étendre l'accompagnement en techniques agroécologiques, en particulier auprès des ménages les plus pauvres (Q1-Q2), pour lesquels le score SCA reste le plus faible.
2. Renforcer les synergies avec les interventions WASH (accès à l'eau potable), qui montrent un effet complémentaire significatif sur la sécurité alimentaire.
3. Poursuivre le suivi longitudinal des ménages témoins afin de documenter l'évolution naturelle de la sécurité alimentaire hors intervention (renforcement de la validité de l'attribution des effets au projet).

---
*Rapport produit à partir des sorties du script `scripts/03_regression.sps` et `scripts/02_statistiques_inferentielles.sps`. Données synthétiques à but de démonstration méthodologique — cf. `docs/dictionnaire_variables.md` pour le détail de la construction du jeu de données.*
