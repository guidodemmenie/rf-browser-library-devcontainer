*** Settings ***
Library    OracleDBLibrary
Library    Browser


#install pip install oracledb
#install pip install robotframework-oracledb-library

*** Variables ***
${DB_USER}    ROBOTFW[icassxl_core]
${DB_PASSWORD}    Gr03nl1cht1234!
# The TNS ALIAS from your tnsnames.ora file (e.g., adb_high)
${TNS_ALIAS}    atpborg3sut_high
# The full path to the directory containing your wallet files (tnsnames.ora, ewallet.pem, etc.)
${WALLET_DIR}    /workspaces/rf-browser-library-devcontainer/tests/wallet
${WALLET_PASSWORD}    k0d3w00rd!

*** Test Cases ***
test connection

    @{c1}=    Oracle Connection Cursor
    Oracle Cursor Execute    SELECT COUNT(*) FROM dual
    @{Rows}=    Oracle Cursor Fetch all

    Log To Console    Row Count: ${Rows}[0][0]

    Oracle Cursor Close

    Oracle Connection Close

Create opdracht
     Connect With Oracle Wallet
    @{params}=     Create Dictionary
        ...    i_project_id= ${None}

    @{c1}=    Oracle Connection Cursor
    Oracle Cursor Callfunc


*** Keywords ***
Connect With Oracle Wallet
# 1. Connect using the wallet parameters
    Oracle Connect
    ...    user=${DB_USER}
    ...    password=${DB_PASSWORD}
    ...    dsn=${TNS_ALIAS}
    ...    config_dir=${WALLET_DIR}
    ...    wallet_location=${WALLET_DIR}
    ...    wallet_password=${WALLET_PASSWORD}
 
close connection
    Oracle Connection Close