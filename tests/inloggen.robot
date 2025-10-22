*** Settings ***
Library    Browser

*** Variables ***
${GEMEENTE}    testeindhoven
${GEMEENTE PW}    2gZ98-uV_Qdc%HSE

*** Test Cases ***
Login
    New Browser    chromium     headless=False
    New Page    https://ge8ef0247e05788-atpborg3sut.adb.eu-amsterdam-1.oraclecloudapps.com/ords/r/icassxl_dev/borg-login/
    Fill Text                  css=input[name="P9999_USERNAME"]       txt=${GEMEENTE}
    Fill Secret                css=input[type="password"]             secret=$GEMEENTE PW
    Click                      css=button[data-otel-label="LOGIN"]
    ${name}    Get Text    css=span.fa-user ~ span.t-Button-label     equal    Est Eindhoven
    Sleep    1s
    Take Screenshot
