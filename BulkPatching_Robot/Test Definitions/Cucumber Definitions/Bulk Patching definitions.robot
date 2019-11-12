*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    ../Test Pages/Bulk Patching Page.robot
*** Variables ***



*** Keywords ***
Bulk Patching Screen Should Be Opened
    Page Should Contain Element    ${lblBulk Patching Title}    

    
Get Status of Tab End A
    #Step 1: Get value of attribute "style" from element "tabEndA"
    ${output status}=    Get Element Attribute    ${tabEndA}    style
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: gray;", return "inactive"
    
    ${status}=    Run Keyword If    '${output status}' == '${attribute tab active}'    Set Variable    "active"
    ...    ELSE IF    '${output status}' == '${attribute tab inactive}'    Set Variable    "inactive"           
     
    #Step 3: Return the correct status
    [Return]    ${status}     

The Header of End A Is "${status}"
    ${get status}=    Get Status of Tab End A 
    Should Be Equal    ${status}    ${get status}    msg="Status of End A is not matched the checked value!!!"
    
Get Status of Tab End B
    #Step 1: Get value of attribute "style" from element "tabEndB"
    ${output status}=    Get Element Attribute    ${tabEndB}    style
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: gray;", return "inactive"
    
    ${status}=    Run Keyword If    '${output status}' == '${attribute tab active}'    Set Variable    "active"
    ...    ELSE IF    '${output status}' == '${attribute tab inactive}'    Set Variable    "inactive"           
     
    #Step 3: Return the correct status
    [Return]    ${status}     

The Header of End B Is "${status}"
    ${get status}=    Get Status of Tab End B 
    Should Be Equal    ${status}    ${get status}    msg="Status of End B is not matched the checked value!!!"      

The Help Text Is "${helptext}"
    Log    ${helptext}    
    
    ${get helptext}=    Get Text    ${lblHelpText} 
    Should Be Equal    ${helptext}    ${get helptext}    msg="The helptext is not matched the checked value!!!"
      