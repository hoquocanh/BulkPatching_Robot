*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    GeneralPage.robot

*** Variables ***
#------------------Elements------------------


${dynamic trace port position on left rectangle}    //div[@id='row-left-center' and contains(@style,'visible')]/div[contains(text(),'Port Information')]
${dynamic trace port position on right rectangle}    //div[@id='row-right-center' and contains(@style,'visible')]/div[contains(text(),'Port Information')]

${dynamic patching bar}    //div[@id='connectivity-icon' and @class='Panel Type']


*** Keywords ***
