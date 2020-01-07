*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    GeneralPage.robot

*** Variables ***
#------------------Elements------------------
${number of confirm lines}    //div[@class='li-multi']/div
${dynamic confirm port position}    //input[@value='Port Information ']

${btnRightArrow}    //div[@id='right-arrow-synch' and contains(@style,'visible')]
${btnLeftArrow}    //div[@id='left-arrow-synch' and contains(@style,'visible')]

*** Keywords ***
