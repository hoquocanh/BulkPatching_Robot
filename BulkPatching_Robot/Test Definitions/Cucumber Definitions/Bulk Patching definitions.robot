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
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: black;", return "inactive"
    
    
    Run Keyword If    '${output status}' == '${attribute tab active}'    ${status}= Set Variable  "active"        
         

       
    
    Return From Keyword If        "active"  
    ...    And          
    ...    And    '${output status}' == '${attribute tab inactive}'    "inactive"            

The header of End A is "${status}"
    ${get status}=    Get Status of Tab End A 
    Should Be Equal    ${status}    ${get status}    msg="Status of End A is not matched the checked value!!!"      