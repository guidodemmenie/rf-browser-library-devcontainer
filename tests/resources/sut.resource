*** Settings ***
Library    Browser


*** Keywords ***
Login
    [Arguments]    ${user}    ${password}
    New Browser    chromium    headless=False    slowMo=0.2s
    New Page    <url>
    Fill Text                  css=input[name="P9999_USERNAME"]       txt=${user}
    Fill Secret                css=input[type="password"]             secret=${password}
    Click                      css=button[data-otel-label="LOGIN"]
    ${name}    Get Text    css=span.fa-user ~ span.t-Button-label     equal    Est Eindhoven
    Sleep    1s
    Take Screenshot

