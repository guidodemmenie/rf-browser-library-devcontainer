
*** Settings ***
Library    OracleDBLibrary    # Zorg ervoor dat deze library correct geïnstalleerd is

*** Variables ***
${DB_USER}    ROBOTFW[icassxl_core]
${DB_PASSWORD}    Gr03nl1cht1234!
# The TNS ALIAS from your tnsnames.ora file (e.g., adb_high)
${TNS_ALIAS}    atpborg3sut_high
# The full path to the directory containing your wallet files (tnsnames.ora, ewallet.pem, etc.)
${WALLET_DIR}    /workspaces/rf-browser-library-devcontainer/tests/wallet
${WALLET_PASSWORD}    k0d3w00rd!

# --- Input Data (Belangrijke Parameters) ---
${OPDRACHTBEDRAG}    20.000,00
${TOETS_DECLARATIE_TERMIJN}    12
${PERC_ZEKERHEIDSTELLING}    ${None}
${BEDRAG_ZEKERHEIDSTELLING}    ${None}
${ACTIVITEIT_ID}    ${None}
${PRJTTREE_RENDERED}    ${None}
${OPDTZIJDE_ORGE_THEMA_ID}     ${None}
${PROJECT_ID}    ${None}
${OPDRACHTZIJDE_ORGE_ID}    ${None}
${OPDRACHTZIJDE_GEBRUIKER}    $LEEG$
${IND_PRIMAIR_BETROKKEN}    N
${TABELNAAM}    OPDT_OPDRACHTEN
${UITGANGSPUNT_ZEKERHEIDSTELLING_DB}    ${None}
${PERC_ZEKERHEIDSTELLING_DB}    ${None}
${BEDRAG_ZEKERHEIDSTELLING_DB}    ${None}
${BESTEK_ID}    ${None}
${STATUS_ID_SELECTED}    ${None}
${INIT_BESTEK}    ${None}
${RO_BESTEK_ID}    ${None}
${FILE_TYPE}    ${None}
${SEL_RESULTAAT_ID}    ${None}
${PAR_TOETS_DECLARATIE_TERMIJN}    12
${PAR_NV_POST_TOT_MINDER}    N
${TOEZICHTHOUDER_LBL}    Kwaliteitsinspecteur
${DIRECTIEVOERDER_LBL}    Uitvoeringscoördinator
${OPDRACHTGEVER_ID}    10
${INKOOPORDER_SYSTEEM_NAAM}    ${None}
${SHOW_AKRD_DECL_TOEZICHTH}    J
${SHOW_AKRD_DECL_DIRECTIEV}    J
${SHOW_BPOST_NIEUW}    N
${SHOW_TOETS_DECL_TOEZICHTH}    J
${SHOW_TOETS_DECLARATIE_TERMIJN}    J
${SHOW_ZEKERHEIDSTELLING}    N
${SHOW_NV_POST_TOT_MINDER}    N
${SHOW_KWALITEITSPLAN}    J
${AKRD_DECL_DIRECTIEV_DB}    N
${AKRD_DECL_TOEZICHTH_DB}    N
${TOETS_DECL_TOEZICHTH_DB}    N
${RO_RESULTAAT_TYPE}    ${None}
${RO_VORM_DECLARATIEMOMENT}    ${None}
${IND_STATUS_IN_OPSTELLING}    J
${IND_KWALITEITSPLAN_BIJWERKEN}    J
${KWALITEITSPLAN_ID}    ${None}
${KWALITEITSPLAN_STATUS}    ${None}
${NUMMER}    ta-testllu
${OMSCHRIJVING}    ta-testllu
${VERPLICHTINGENNUMMER}    ${None}
${PERCENTAGE_MANDAAT_AANNEEMSOM}    5
${BEVINDING_MAX_DUUR_HERSTEL}    5
${BEVINDING_ERNSTIG_MAX_DUUR_HERSTEL}    1
${BEVINDING_KEURINGS_TERMIJN}    20
${TERMIJN_OPNAME_GEREED}    8
${TERMIJN_OVERSCHRIJDING_ONDERHOUD_DOORZETTEN}    14
${TERMIJN_OVERSCHRIJDING_OPLEVERING_DOORZETTEN}    14
${TERMIJN_HERSTEL_ONDERHOUD}    14
${TERMIJN_HERSTEL_OPLEVERING}    14
${WEKEN_ONDERHOUDSTERMIJN}    26
${HERINNERING_EINDE_ODH_TERMIJN}    21
${HERINNERING_EINDE_ODH_TERMIJN_EENM}    10
${HERINNERING_EINDE_DECL_TERMIJN}    7
${IND_GESLOTEN}    ${None}
${STATUS_CODE}    ${None}
${IND_READ_ONLY_IN_OPSTELLING}    N
${IND_READ_ONLY_NIET_GESLOTEN}    N
${IND_READ_ONLY_PERIODESTATEN}    N
${IND_READ_ONLY_STATUS}    J
${IND_MAG_OPDRACHT_AANMAKEN}    J
${OPDRACHTBEDRAG_BTW_L}    ${None}
${OPDRACHTBEDRAG_BTW_H}    ${None}
${IND_OPD_BEDRAG_BTW_H_GESLOTEN}    N
${IND_OPD_BEDRAG_BTW_L_GESLOTEN}    N
${OPDRACHTBEDRAG_BTW_LABEL}    ${None}
${STATUS_ID}    13557
${OPLEVERDATUM}    ${None}
${TYPE_ZEKERHEIDSTELLING_DB}    Borgsom
${OPDRACHTGEVER_THEMA_ID}    5838
${OPDRACHTNEMER_THEMA_ID}    8499687
${CONTRACTVORM_CODE}    OVERIG
${INGANGSDATUM}    ${None}
${EINDDATUM}    ${None}
${OPDRACHT_ID}    ${None}
${VORM_DECLARATIEMOMENT}    Declaraties
${AANBESTEDINGSVORM}    Anders
${AARD}    Herinrichting / herstraten
${RESULTAAT_TYPE}    werkomschrijving
${BESTEKNUMMER}    ${None}
${OPDRACHTDATUM}    02-11-2025
${UITVOERING_START_DATUM}    29-11-2025
${MAP_TEMPLATE_ID}    8255649
${AFREKENWIJZE_MEERWERK}    Termijn
${IND_ZEKERHEIDSTELLING}    N
${NV_POST_TOT_MINDER}    N
${TOETS_DECL_TOEZICHTH}    J
${AKRD_DECL_TOEZICHTH}    N
${AKRD_DECL_DIRECTIEV}    N
${IND_KWALITEITSPLAN}    N
${TYPE_ZEKERHEIDSTELLING}    Borgsom
${UITGANGSPUNT_ZEKERHEIDSTELLING}    Percentage
${AFWIJKIING_ID}    ${None}
${UITVOERING_GEREED_DATUM}     ${None}
${OPLEVEREENHEID}    ${None}
${IND_HISTORISCH}    N
${BEDRAG_MEER_MINDER}    ${None}
${OPDRACHTBRIEF_UW_KENMERK}    ${None}
${OPDRACHTBRIEF_ONS_KENMERK}    ${None}
${TOELICHTING}    ${None}
${WERK OMSCRIJVING}   Een werkomschrijving
${CPV_CODE}    Overig
#}    --- Type Definitie ---
${RETURN_TYPE}                number    # De functie retourneert een NUMBER

*** Test Cases ***
Test Opdracht Invoeren met Named Parameters

    Connect With Oracle Wallet

    #${Nieuwe_Opdracht_ID}=    Roep Fn Insert Opdracht Aan
    ${Nieuwe_Opdracht_ID}=    Create opdracht

    Should Not Be Empty    ${Nieuwe_Opdracht_ID}
    Log To Console         Succes! De nieuwe Opdracht ID is: ${Nieuwe_Opdracht_ID}

    Oracle Connection Commit  # Optioneel, afhankelijk van auto-commit instellingen
    Oracle Connection Close

*** Keywords ***
Roep Fn Insert Opdracht Aan
    # 1. Alle Named Parameters definiëren in een Dictionary
    #    De sleutels MOETEN exact overeenkomen met de parameter IN namen uit de PL/SQL code!
    &{Parameters}=    Create Dictionary
    ...    i_project_id=${PROJECT_ID}
    ...    i_omschrijving=${OMSCHRIJVING}
    ...    i_vorm_declaratiemoment=${VORM_DECLARATIEMOMENT}
    ...    i_aard=${AARD}
    ...    i_opdrachtgever_thema_id=${OPDRACHTGEVER_THEMA_ID}
    ...    i_opdrachtdatum=${OPDRACHTDATUM}
    ...    i_opdrachtbedrag=${OPDRACHTBEDRAG}
    ...    i_besteknummer=${BESTEKNUMMER}
    ...    i_aanbestedingsvorm=${AANBESTEDINGSVORM}
    ...    i_ingangsdatum=${OPDRACHTDATUM}
    ...    i_einddatum=${EINDDATUM}
    ...    i_opdracht_id=${OPDRACHT_ID}
    ...    i_verplichtingennummer=${VERPLICHTINGENNUMMER}
    ...    i_status_id=${STATUS_ID}
    ...    i_toelichting=${TOELICHTING}
    ...    i_ind_historisch=${IND_HISTORISCH}
    ...    i_contractvorm_code=${CONTRACTVORM_CODE}
    ...    i_ind_gesloten=${IND_GESLOTEN}
    ...    i_resultaat_type=${RESULTAAT_TYPE}
    ...    i_werk_omschrijving=${WERK OMSCRIJVING}
    ...    i_uitvoering_start_datum=${OPDRACHTDATUM}
    ...    i_opdrachtnemer_thema_id=${OPDRACHTNEMER_THEMA_ID}
    ...    i_ind_zekerheidstelling=${IND_ZEKERHEIDSTELLING}
    ...    i_type_zekerheidstelling=${TYPE_ZEKERHEIDSTELLING}
    ...    i_bedrag_zekerheidstelling=${BEDRAG_ZEKERHEIDSTELLING}
    ...    i_percentage_zekerheidstelling=${PERC_ZEKERHEIDSTELLING}
    ...    i_uitgangspunt_zekerheidstelling=${UITGANGSPUNT_ZEKERHEIDSTELLING}
    ...    i_afwijking_id=${AFWIJKIING_ID}
    ...    i_uitvoering_gereed_datum=${UITVOERING_GEREED_DATUM}
    ...    i_uitvoering_oplever_datum=${None}
    ...    i_uitvoering_ohtermijn_datum=${None}
    ...    i_beheer_thema_id=${None}
    ...    i_nummer=${NUMMER}
    ...    i_oplevertermijn=${TERMIJN_HERSTEL_OPLEVERING}
    ...    i_oplevereenheid=${OPLEVEREENHEID}
    ...    i_opleverdatum=${OPLEVERDATUM}
    ...    i_opdrachtgever_id=${OPDRACHTGEVER_ID}
    ...    i_budget_opdracht=${OPDRACHTBEDRAG}
    ...    i_bedrag_meer_minder=${BEDRAG_MEER_MINDER}
    ...    i_opdrachtbrief_uw_kenmerk=${OPDRACHTBRIEF_UW_KENMERK}
    ...    i_opdrachtbrief_ons_kenmerk=${OPDRACHTBRIEF_ONS_KENMERK}
    ...    i_cpv_code=${CPV_CODE}
    ...    i_onderhouds_termijn=${TERMIJN_HERSTEL_ONDERHOUD}
    ...    i_toets_decl_toezichthouder=${TOETS_DECL_TOEZICHTH}
    ...    i_akkoord_decl_toezichthouder=${AKRD_DECL_TOEZICHTH}
    ...    i_akkoord_decl_directievoerder=${AKRD_DECL_DIRECTIEV}
    ...    i_verplichting_leveranciersnummer=${VERPLICHTINGENNUMMER}
    ...    i_opdrachtbedrag_btw_l=${OPDRACHTBEDRAG_BTW_L}
    ...    i_opdrachtbedrag_btw_h=${OPDRACHTBEDRAG_BTW_H}
    ...    i_ind_opd_bedrag_btw_l_gesloten=${IND_OPD_BEDRAG_BTW_L_GESLOTEN}
    ...    i_ind_opd_bedrag_btw_h_gesloten=${IND_OPD_BEDRAG_BTW_H_GESLOTEN}

    # 2. Roep de functie aan
    #    Argument 1: Functienaam
    #    Argument 2: Return type ('number')
    #    Argument 3: De dictionary met Named Parameters (&{...})
    @{c1}=    Oracle Connection Cursor
    ${Opdracht_ID}=    Oracle Cursor Callfunc
    ...    apx_p8110_pck.fn_insert_opdracht
    ...    number
    ...    &{Parameters}

   RETURN   ${Opdracht_ID}

Create opdracht
    # 2. Roep de functie aan
    #    Argument 1: Functienaam
    #    Argument 2: Return type ('number')
    #    Argument 3: De dictionary met Named Parameters (&{...})
    @{c1}=    Oracle Connection Cursor
    ${Opdracht_ID}=    Oracle Cursor Callfunc
    ...    apx_p8110_pck.fn_insert_opdracht
    ...    number
    ...    ${PROJECT_ID}
    ...    ${OMSCHRIJVING}
    ...    ${VORM_DECLARATIEMOMENT}
    ...    ${AARD}
    ...    ${OPDRACHTGEVER_THEMA_ID}
    ...    ${OPDRACHTDATUM}
    ...    ${OPDRACHTBEDRAG}
    ...    ${BESTEKNUMMER}
    ...    ${AANBESTEDINGSVORM}
    ...    ${OPDRACHTDATUM}
    ...    ${EINDDATUM}
    ...    ${OPDRACHT_ID}
    ...    ${VERPLICHTINGENNUMMER}
    ...    ${STATUS_ID}
    ...    ${TOELICHTING}
    ...    ${IND_HISTORISCH}
    ...    ${CONTRACTVORM_CODE}
    ...    ${IND_GESLOTEN}
    ...    ${RESULTAAT_TYPE}
    ...    ${WERK OMSCRIJVING}
    ...    ${OPDRACHTDATUM}
    ...    ${OPDRACHTNEMER_THEMA_ID}
    ...    ${IND_ZEKERHEIDSTELLING}
    ...    ${TYPE_ZEKERHEIDSTELLING}
    ...    ${BEDRAG_ZEKERHEIDSTELLING}
    ...    ${PERC_ZEKERHEIDSTELLING}
    ...    ${UITGANGSPUNT_ZEKERHEIDSTELLING}
    ...    ${AFWIJKIING_ID}
    ...    ${UITVOERING_GEREED_DATUM}
    ...    ${None}
    ...    ${None}
    ...    ${None}
    ...    ${NUMMER}
    ...    ${TERMIJN_HERSTEL_OPLEVERING}
    ...    ${OPLEVEREENHEID}
    ...    ${OPLEVERDATUM}
    ...    ${OPDRACHTGEVER_ID}
    ...    ${OPDRACHTBEDRAG}
    ...    ${BEDRAG_MEER_MINDER}
    ...    ${OPDRACHTBRIEF_UW_KENMERK}
    ...    ${OPDRACHTBRIEF_ONS_KENMERK}
    ...    ${CPV_CODE}
    ...    ${TERMIJN_HERSTEL_ONDERHOUD}
    ...    ${TOETS_DECL_TOEZICHTH}
    ...    ${AKRD_DECL_TOEZICHTH}
    ...    ${AKRD_DECL_DIRECTIEV}
    ...    ${VERPLICHTINGENNUMMER}
    ...    ${OPDRACHTBEDRAG_BTW_L}
    ...    ${OPDRACHTBEDRAG_BTW_H}
    ...    ${IND_OPD_BEDRAG_BTW_L_GESLOTEN}
    ...    ${IND_OPD_BEDRAG_BTW_H_GESLOTEN}

   RETURN   ${Opdracht_ID}

Connect With Oracle Wallet
# 1. Connect using the wallet parameters
    Oracle Connect
    ...    user=${DB_USER}
    ...    password=${DB_PASSWORD}
    ...    dsn=${TNS_ALIAS}
    ...    config_dir=${WALLET_DIR}
    ...    wallet_location=${WALLET_DIR}
    ...    wallet_password=${WALLET_PASSWORD}