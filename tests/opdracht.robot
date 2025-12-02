*** Settings ***
Library       String
Library       DatabaseLibrary
Library       Collections
Test Setup    Connect To My Oracle DB

*** Test Cases ***
Insert Row And Update Row 7
    ${function result}     Insert Row Using Function     text1=our text
    ${query result}        Select Row By Id              id=7
    ${procedure result}    Update Row Using Procedure    &{query result}    DATE1=01-DEC-25

*** keywords ***

Connect To My Oracle DB
    Connect To Database
    ...    db_module=oracledb
    ...    db_user=robotfw[icassxl_core]
    ...    db_password=Gr03nl1cht1234!
    ...    config_file=/workspaces/rf-browser-library-devcontainer/tests/wallet
    ...    dsn=atpborg3sut_high
    Set Omit Trailing Semicolon    omit_trailing_semicolon=${False}


Update Row Using Procedure
    [Arguments]    ${ID}    ${TEXT1}   ${DATE1}   ${NUMBER1}
    [Documentation]    Procedure: workshop_pck.pr_update_row
    ...
    ...    workshop_pck.pr_update_row(i_id => :i_id,
    ...                               i_text1 => :i_text1,
    ...                               i_date1 => :i_date1,
    ...                               i_number1 => :i_number1);
    @{params}    Create List    ${id}    ${text1}   ${date1}   ${number1}
    ${value}    Call Stored Procedure  procedure_name=workshop_pck.pr_update_row  procedure_params=${params}
    Log To Console    \nReturn Value: ${value}

Insert Row Using Function
    [Arguments]    ${text1}    ${date1}=01-JAN-25    ${number1}=1
    [Documentation]    Function: 'workshop_pck.fn_insert_row'
    ...
    ...    workshop_pck.fn_insert_row(i_text1 => ${description},
    ...                               i_date1 => ${date},  ## 01-JAN-2025
    ...                               i_number1 => :i_number1);
    @{params}    Create list    ${text1}    ${date1}    ${number1}
    ${value}    ${resultset}    Call Function    workshop_pck.fn_insert_row    return_type=${{ int }}    function_params=${params}
    Log To Console    \nReturn Value: ${value}
    RETURN    ${value}

Select Row By Id
    [Documentation]    Query using Select statement.
    [Arguments]    ${id}
    ${results}   Query      select * from workshop_test where id=${id}    return_dict=true
    Log Dictionary    ${results}[0]
    RETURN    ${results}[0]
