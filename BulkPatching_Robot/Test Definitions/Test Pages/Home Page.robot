*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    General Page.robot

*** Variables ***
#------------------Elements------------------
${lblimVisionX}    //div[@style='display: block;']/div[@id='imvision_tab']/div[contains(text(),'imVision X')]
${btnBulk Patching}    //input[@id='bulk-patch-btn']
${lblBulk Patching Home Page}    //div[@id='bulkpatch-lang']

*** Keywords ***
Home Screen Should Be Opened
    Page Should Contain Element    ${lblimVisionX}
    
Go To Bulk Patching Screen
    Click Element    ${btnBulk Patching} 
    Wait For Page Load 