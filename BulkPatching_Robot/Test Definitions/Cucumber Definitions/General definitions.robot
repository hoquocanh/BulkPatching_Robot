*** Settings ***
Library    SeleniumLibrary   
Library    String    
 
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    ../Test Pages/General Page.robot
Resource    ../Test Pages/Home Page.robot

*** Keywords ***

Delete Button is "${status}"
    ${temp status}=    Convert To Lowercase    ${status}    

    Run Keyword If    '${temp status}' == 'appeared'    Element Should Be Visible    ${btnDelete}
    ...    ELSE IF    '${temp status}' == 'disappeared'    Element Should Not Be Visible    ${btnDelete}            
        