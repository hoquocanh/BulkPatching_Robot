*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    General Page.robot

*** Variables ***
#------------------Elements------------------
${number of confirm lines}    //div[@class='li-multi']/div
${dynamic confirm port position}    //input[@value='Port Information ']

${btnRightArrow}    //div[@id='right-arrow-synch']
${btnLeftArrow}    //div[@id='left-arrow-synch']

*** Keywords ***
