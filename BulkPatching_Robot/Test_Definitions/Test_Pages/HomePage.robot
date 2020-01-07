*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    GeneralPage.robot

*** Variables ***
#------------------Elements------------------
${lblimVisionX}    //div[@style='display: block;']/div[@id='imvision_tab']/div[contains(text(),'imVision X')]
${lblBulk Patching Home Page}    //div[@id='bulkpatch-lang']

${btnBulk Patching}    //input[@id='bulk-patch-btn']


*** Keywords ***
Home Screen Should Be Opened
    Run Keyword And Continue On Failure    Page Should Contain Element    ${lblimVisionX}
    
Go To Bulk Patching Screen
    Click Element    ${btnBulk Patching} 
    Wait For Page Load 