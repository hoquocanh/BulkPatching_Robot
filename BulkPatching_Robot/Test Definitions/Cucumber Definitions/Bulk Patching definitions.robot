*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    ../Test Pages/Bulk Patching Page.robot
*** Variables ***



*** Keywords ***
Bulk Patching Screen Should Be Opened
    Page Should Contain Element    ${lblBulk Patching Title}    



    
  