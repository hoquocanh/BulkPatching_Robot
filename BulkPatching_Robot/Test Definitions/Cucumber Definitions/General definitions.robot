*** Settings ***
Library    SeleniumLibrary   
Library    String    
 
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    ../Test Pages/General Page.robot
Resource    ../Test Pages/Home Page.robot

*** Keywords ***

Delete Button is "${status}"
    ${temp status}=    Convert To Lowercase    ${status}    

    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Element Should Be Visible    ${btnDelete}
    ...    ELSE IF    '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Element Should Not Be Visible    ${btnDelete}

Check The Number of Confirm is "${confirm number}"
    Run Keyword And Continue On Failure    Element Attribute Value Should Be    ${btnConfirm}    value    ${confirm number}                     
         