*** Settings ***
Library    Browser    auto_closing_level=SUITE

*** Variables ***
${USR}
${PASSWORD}

*** Test Cases ***
Is There Coffee
    New Browser    chromium    headless=false
    New Page       https://www.conflux.nl
    Get Element    text=Coffee?
    Sleep    5s