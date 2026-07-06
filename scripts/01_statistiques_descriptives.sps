*=============================================================================.
* PROJET   : Évaluation d'un projet d'agroécologie et de sécurité alimentaire
*            Régions Nord et Est - Burkina Faso
* FICHIER  : 01_statistiques_descriptives.sps
* OBJET    : Statistiques descriptives (fréquences, tableaux croisés, graphiques)
* AUTEUR   : Hama DIALLO (Sékou)
* DONNEES  : data/menages_agroecologie_burkina.sav (n = 420 ménages)
*=============================================================================.

* --- 1. Importation de la base ---------------------------------------------.
GET FILE='data/menages_agroecologie_burkina.sav'.
DATASET NAME MenagesAgro WINDOW=FRONT.

* --- 2. Étiquettes de valeurs (facilite la lecture des sorties) ------------.
VALUE LABELS quintile_richesse
  1 "Q1 - Plus pauvre"
  2 "Q2"
  3 "Q3"
  4 "Q4"
  5 "Q5 - Plus riche".

VALUE LABELS insecurite_alimentaire_severe
  0 "Non"
  1 "Oui - Insécurité sévère".

* --- 3. Vérification de la qualité des données ------------------------------.
* Valeurs manquantes par variable.
DISPLAY DICTIONARY.
FREQUENCIES VARIABLES=ALL
  /FORMAT=NOTABLE
  /STATISTICS=NONE
  /MISSING=INCLUDE.

* --- 4. Fréquences des variables qualitatives -------------------------------.
FREQUENCIES VARIABLES=region province groupe sexe_cdm situation_matrimoniale
    niveau_instruction_cdm quintile_richesse acces_credit acces_eau_potable
    compost_utilise agroforesterie_pratiquee insecurite_alimentaire_severe
  /FORMAT=AVALUE TABLE
  /BARCHART FREQ
  /ORDER=ANALYSIS.

* --- 5. Statistiques descriptives des variables quantitatives --------------.
DESCRIPTIVES VARIABLES=age_cdm taille_menage possession_terre_ha
    distance_marche_km distance_eau_min nombre_techniques_agroecologiques
    superficie_amenagee_ha score_SCA rendement_cereales_kg_ha
    revenu_agricole_fcfa nombre_mois_couverture_alim
  /STATISTICS=MEAN STDDEV MIN MAX RANGE SKEWNESS KURTOSIS
  /SORT=MEAN (A).

EXAMINE VARIABLES=score_SCA rendement_cereales_kg_ha revenu_agricole_fcfa
    nombre_mois_couverture_alim BY groupe
  /PLOT BOXPLOT HISTOGRAM
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

* --- 6. Tableaux croisés clés (bivarié descriptif) --------------------------.
* Profil du groupe bénéficiaire vs témoin selon la région.
CROSSTABS
  /TABLES=groupe BY region
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW COLUMN TOTAL
  /COUNT ROUND CELL.

* Accès à l'eau potable selon la région.
CROSSTABS
  /TABLES=acces_eau_potable BY region
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW TOTAL
  /COUNT ROUND CELL.

* Niveau d'instruction du chef de ménage selon le sexe.
CROSSTABS
  /TABLES=niveau_instruction_cdm BY sexe_cdm
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN TOTAL
  /COUNT ROUND CELL.

* Insécurité alimentaire sévère selon le groupe (aperçu descriptif ;
* le test statistique associé est réalisé dans le script 02).
CROSSTABS
  /TABLES=insecurite_alimentaire_severe BY groupe
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT ROW COLUMN
  /COUNT ROUND CELL.

* --- 7. Graphiques de synthèse ----------------------------------------------.
* Répartition des ménages par groupe et région (barres groupées).
GGRAPH
  /GRAPHDATASET NAME="gd_groupe_region" VARIABLES=groupe region COUNT()[name="COUNT"]
    MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("gd_groupe_region"))
  DATA: groupe=col(source(s), name("groupe"), unit.category())
  DATA: region=col(source(s), name("region"), unit.category())
  DATA: COUNT=col(source(s), name("COUNT"))
  GUIDE: axis(dim(1), label("Groupe"))
  GUIDE: axis(dim(2), label("Nombre de ménages"))
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Région"))
  GUIDE: text.title(label("Répartition des ménages enquêtés par groupe et région"))
  ELEMENT: interval(position(summary.count(groupe*COUNT)), color.interior(region),
    shape.interior(shape.square))
END GPL.

* Score de consommation alimentaire (SCA) par groupe (boîtes à moustaches).
GGRAPH
  /GRAPHDATASET NAME="gd_sca" VARIABLES=groupe score_SCA MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("gd_sca"))
  DATA: groupe=col(source(s), name("groupe"), unit.category())
  DATA: score_SCA=col(source(s), name("score_SCA"))
  GUIDE: axis(dim(1), label("Groupe"))
  GUIDE: axis(dim(2), label("Score de Consommation Alimentaire (SCA)"))
  GUIDE: text.title(label("Distribution du score SCA selon le groupe"))
  ELEMENT: schema(position(bin.quantile.letter(groupe*score_SCA)))
END GPL.

* Camembert : ménages en insécurité alimentaire sévère.
FREQUENCIES VARIABLES=insecurite_alimentaire_severe
  /PIECHART FREQ
  /ORDER=ANALYSIS.

* --- Fin du script 01 -------------------------------------------------------.
