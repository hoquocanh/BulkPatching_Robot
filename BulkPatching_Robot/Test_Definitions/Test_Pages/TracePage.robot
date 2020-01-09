*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    GeneralPage.robot

*** Variables ***
#------------------Elements------------------


${dynamic trace port position on left rectangle}    //div[@id='row-left-center' and contains(@style,'visible')]/div[contains(text(),'port information')]
${dynamic trace port position on right rectangle}    //div[@id='row-right-center' and contains(@style,'visible')]/div[contains(text(),'port information')]

${dynamic patching bar}    //div[@id='connectivity-icon' and contains(@class,'patch-cord')]


*** Keywords ***
