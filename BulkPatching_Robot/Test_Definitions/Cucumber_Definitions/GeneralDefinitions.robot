*** Settings ***
Library    SeleniumLibrary   
Library    String    
 
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    ../Test_Pages/GeneralPage.robot
Resource    ../Test_Pages/HomePage.robot

*** Keywords ***

Delete Button is "${status}"
    ${temp status}=    Convert To Lowercase    ${status}    

    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Element Should Be Visible    ${btnDelete}
    ...    ELSE IF    '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${btnDelete}

Check The Number of Confirm is "${confirm number}"
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    ${btnConfirm}    value    ${confirm number}                     

Confirm Button is "${status}"
    ${temp status}=    Convert To Lowercase    ${status}    

    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Element Should Be Visible    ${btnConfirm}
    ...    ELSE IF    '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${btnConfirm}
         