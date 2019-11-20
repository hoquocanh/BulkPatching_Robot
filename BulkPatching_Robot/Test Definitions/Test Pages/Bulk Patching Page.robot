*** Settings ***
Library    SeleniumLibrary   

*** Variables ***
#------------------Elements------------------
${lblBulk Patching Title}    //div[@id='bulk-patch-title' and @style='display: block;']
${btnExit}    //div[@id='exit-footer' and @style='display: block;']/div[@id='exit-button']
${tabEndA}    //div[@id='btn-end-a']
${tabEndB}    //div[@id='btn-end-b']
${lblHelpText}    //ul[@id='text-line']/li/p

${number of lines}    //ul[@id='bulkPatchList']/li
${dynamic port position}    //ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
${dynamic port position with color}    //ul[@id='bulkPatchList']/li[Line Position]/div[End Position][@style='Color']/p[contains(text(),'Port Information')]

#------------------Elements attribute------------------
${attribute tab active}    background: black;
${attribute tab inactive}    background: gray;

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