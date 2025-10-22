*** Settings ***
Resource    resources/sut.resource


*** Variables ***
${GEMEENTE}       <user>
${GEMEENTE PW}    <secrit password>


*** Test Cases ***
Opdracht aanmaken
    Login    user=${GEMEENTE}    password=$GEMEENTE PW
    # Klik Opdrachten
    Click    a#tile_Opdrachten
    # Klik Nieuwe Opdracht
    Click    button#B184155248290273487

    ##  Maak random string om opdrachtnummer te vullen

    # Vul in velden
    Wait For Load State    domcontentloaded
    Fill Text            input#P8110_NUMMER                     txt=1387456879123468731294
    Fill Text            input#P8110_OMSCHRIJVING               txt=TestCase met Random nummer 1387456879123468731294
    Select Options By    select#P8110_OPDRACHTGEVER_THEMA_ID    text    Gemeente Eindhoven - Projectuitvoering
    Select Options By    select#P8110_OPDRACHTNEMER_THEMA_ID    text    Aannemertest
    Select Options By    select#P8110_CONTRACTVORM_CODE         text    Overig
    Select Options By    select#P8110_VORM_DECLARATIEMOMENT     text    Declaraties (vrije vorm)
    Select Options By    select#P8110_AANBESTEDINGSVORM         text    Anders
    Click                input#P8110_CPV_CODE_DISP
    Click                a >> text=45236119-7
    # Select Options By    select#P8110_CPV_CODE                  text    45236119-7 - Herstelwerkzaamheden op sportvelden
    Select Options By    select#P8110_AARD                      text    Maaien Gras
    Select Options By    select#P8110_RESULTAAT_TYPE            text    Conform werkomschrijving
    Fill Text            input#P8110_OPDRACHTDATUM              txt=23-10-2025
    Fill Text            input#P8110_OPDRACHTBEDRAG             txt=12312
    Fill Text            input#P8110_UITVOERING_START_DATUM     txt=24-10-2025
    Select Options By    select#P8110_MAP_TEMPLATE_ID           text    VPR-opdracht
    Uncheck Checkbox     input#P8110_IND_KWALITEITSPLAN
    Click                selector=button > span >> text=Opslaan
    Click                css=button >> text=Ok

    # Valideren na aanmaken
    Wait For Condition   Text    input#P8110_NUMMER     ==    1387456879123468731294


    # Ga naar tab Werkomschrijving
    Click    li[aria-controls="SR_werkomschrijving"]
    Fill Text    textarea#P8110_WERK_OMSCHRIJVING    Gras maaien bij de buren
    Click                selector=button > span >> text=Opslaan
    Click                css=button >> text=Ok

    ## Opdracht Verstrekken
    Click    a > span >> text=Opdracht
    Select Options By    select#P8110_STATUS_ID           text    Opdracht verstrekt
    Click                selector=button > span >> text=Opslaan


    Take Screenshot

