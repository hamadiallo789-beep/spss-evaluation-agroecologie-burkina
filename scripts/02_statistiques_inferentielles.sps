*=============================================================================.
* PROJET   : Évaluation d'un projet d'agroécologie et de sécurité alimentaire
*            Régions Nord et Est - Burkina Faso
* FICHIER  : 02_statistiques_inferentielles.sps
* OBJET    : Tests d'hypothèses - Khi², t de Student, ANOVA, normalité
* AUTEUR   : Hama DIALLO (Sékou)
* DONNEES  : data/menages_agroecologie_burkina.sav (n = 420 ménages)
*
* NOTE : commentaires d'interprétation (INTERP) insérés après chaque test,
*        basés sur les résultats obtenus sur ce jeu de données.
*=============================================================================.

GET FILE='data/menages_agroecologie_burkina.sav'.
DATASET NAME MenagesAgro WINDOW=FRONT.

*-----------------------------------------------------------------------------.
* H1. Test du Khi² d'indépendance :
*     L'insécurité alimentaire sévère est-elle associée au fait d'être
*     bénéficiaire du projet agroécologie ?
*-----------------------------------------------------------------------------.
CROSSTABS
  /TABLES=groupe BY insecurite_alimentaire_severe
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI
  /CELLS=COUNT ROW EXPECTED
  /COUNT ROUND CELL.

* INTERP : Khi² = 67,77 ; ddl = 1 ; p < 0,001 (sur données observées).
* On rejette H0 : il existe une association statistiquement très significative
* entre le groupe (bénéficiaire/témoin) et l'insécurité alimentaire sévère.
* Les ménages bénéficiaires sont nettement moins touchés (≈ 4 % vs ≈ 35 %
* chez les témoins), ce qui est cohérent avec un effet positif du projet.

*-----------------------------------------------------------------------------.
* H2. Test du Khi² : accès à l'eau potable selon la région.
*-----------------------------------------------------------------------------.
CROSSTABS
  /TABLES=acces_eau_potable BY region
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ
  /CELLS=COUNT ROW
  /COUNT ROUND CELL.

* INTERP : à commenter selon la sortie ; si p > 0,05, l'accès à l'eau potable
* ne diffère pas significativement entre les deux régions enquêtées.

*-----------------------------------------------------------------------------.
* H3. Test t de Student (échantillons indépendants) :
*     Le score de consommation alimentaire (SCA) diffère-t-il entre les
*     ménages bénéficiaires et les ménages témoins ?
*-----------------------------------------------------------------------------.
T-TEST GROUPS=groupe('Bénéficiaire' 'Témoin')
  /MISSING=ANALYSIS
  /VARIABLES=score_SCA
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

* INTERP : Moyenne bénéficiaires ≈ 54,6 (ET ≈ 10,2) vs témoins ≈ 39,8
* (ET ≈ 10,6) ; t(≈418) = 14,55 ; p < 0,001. Le test de Levene doit être
* vérifié dans la sortie pour choisir la ligne "variances égales/non égales" ;
* dans les deux cas la différence reste hautement significative.
* Conclusion : le score SCA est significativement plus élevé chez les
* ménages bénéficiaires du projet, avec une taille d'effet importante.

*-----------------------------------------------------------------------------.
* H4. Test t : revenu agricole selon le sexe du chef de ménage.
*-----------------------------------------------------------------------------.
T-TEST GROUPS=sexe_cdm('Homme' 'Femme')
  /MISSING=ANALYSIS
  /VARIABLES=revenu_agricole_fcfa
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

* INTERP : à commenter selon la sortie obtenue (comparer les moyennes et la
* significativité du test ; vérifier l'hypothèse d'égalité des variances
* avec le test de Levene affiché automatiquement par SPSS).

*-----------------------------------------------------------------------------.
* H5. ANOVA à un facteur :
*     Le score SCA varie-t-il selon le quintile de richesse du ménage ?
*-----------------------------------------------------------------------------.
* Vérification de la normalité des résidus / distribution par groupe.
EXAMINE VARIABLES=score_SCA BY quintile_richesse
  /PLOT NPPLOT
  /STATISTICS DESCRIPTIVES
  /MISSING LISTWISE.

ONEWAY score_SCA BY quintile_richesse
  /STATISTICS DESCRIPTIVES HOMOGENEITY
  /MISSING ANALYSIS
  /POSTHOC=TUKEY BONFERRONI ALPHA(0.05).

* INTERP : F(4, 415) = 11,25 ; p < 0,001. Le score SCA moyen croît de
* façon monotone avec le quintile de richesse (Q1 ≈ 41,8 ; Q5 ≈ 53,3).
* Le test de Levene doit être vérifié : si l'homogénéité des variances est
* respectée, les comparaisons post-hoc de Tukey identifient les paires de
* quintiles qui diffèrent significativement (typiquement Q1/Q2 vs Q4/Q5).

*-----------------------------------------------------------------------------.
* H6. Corrélation non paramétrique :
*     Nombre de techniques agroécologiques adoptées et rendement céréalier.
*-----------------------------------------------------------------------------.
NONPAR CORR
  /VARIABLES=nombre_techniques_agroecologiques rendement_cereales_kg_ha
  /PRINT=SPEARMAN TWOTAIL NOSIG
  /MISSING=PAIRWISE.

* INTERP : une corrélation de Spearman positive et significative est
* attendue, cohérente avec l'hypothèse que l'adoption de techniques
* agroécologiques améliore le rendement céréalier.

*-----------------------------------------------------------------------------.
* H7. Test de normalité (préalable indispensable avant tout choix de test
*     paramétrique vs non paramétrique).
*-----------------------------------------------------------------------------.
EXAMINE VARIABLES=score_SCA rendement_cereales_kg_ha revenu_agricole_fcfa
  /PLOT HISTOGRAM NPPLOT
  /STATISTICS DESCRIPTIVES
  /MISSING LISTWISE.

* INTERP : Le test de Shapiro-Wilk (calculé hors SPSS pour ce jeu de
* données : W = 0,997 ; p = 0,78 pour le score SCA) ne rejette pas la
* normalité des résidus, ce qui justifie l'usage de tests paramétriques
* (t de Student, ANOVA, régression linéaire) dans ce script et le suivant.

* --- Fin du script 02 -------------------------------------------------------.
