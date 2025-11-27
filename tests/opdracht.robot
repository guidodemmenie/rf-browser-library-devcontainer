*** Settings ***
Library    String
Library    Browser
Library    DatabaseLibrary
Test Setup    Connect To My Oracle DB

*** Variables ***
${gemeente}    testeindhoven
${gemeente pw}    2gZ98-uV_Qdc%HSE

${aannemer}    testaanemer
${aannemer pw}    .e#-ZNmZq5$.H3-g

*** Keywords ***
Connect To My Oracle DB
    Connect To Database
    ...    db_module=oracledb
#...    db_name=BORG_SUT
    ...    db_user=Arobotfw[icassxl_core]
    ...    db_password=Gr03nl1cht1234!
#...    db_host=adb.eu-amsterdam-1.oraclecloud.com
#...    db_port=1522
    #...    oracle_driver_mode=thin
    ...     config_file=/workspaces/rf-browser-library-devcontainer/tests/wallet
    ...    dsn=description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1521)(host=adb.eu-amsterdam-1.oraclecloud.com))(connect_data=(service_name=ge8ef0247e05788_atpborg3sut_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)(MY_WALLET_DIRECTORY=/workspaces/rf-browser-library-devcontainer/tests/wallet)))

*** Test Cases ***
select dual
    ${Rows}=    Query    select * from dual
    Should Be Equal    ${Rows}[0][0]    x


#screen login  
#    New Page    https://ge8ef0247e05788-atpborg3sut.adb.eu-amsterdam-1.oraclecloudapps.com/ords/r/icassxl_dev/borg-login/
#    New Browser  chromium    headless=False
#    Fill Text   id=P9999_USERNAME    ${gemeente}
#    Fill Secret  id=P9999_PASSWORD    $gemeente pw
#    Click         id=p9999-login-button
#    Sleep         2
#    Get Text  t-Button-label   ==    Est Eindhoven 
