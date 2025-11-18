*** Settings ***
Library    Browser

*** Variables ***
${UESR}
${PASSWORD}

*** Test Cases ***
Open Google
    New Browser    chromium    headless=True
    New Page    https://www.conflux.nl
    Get Element    text=Coffee?
