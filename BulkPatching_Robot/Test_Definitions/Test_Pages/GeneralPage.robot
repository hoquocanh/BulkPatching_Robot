*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    ../Test_Pages/HomePage.robot



*** Variables ***
#------------------Elements------------------
${btnHome}    //div[@id='home-lang']  
${lnkRack Name}    //div[@id='middle_rack_id']
${btnExit}    //div[@id='exit-footer' and @style='display: block;']/div[@id='exit-button']
${btnCancel}    //div[@style='display: block;']/div[@id='cancel-button']
${btnDelete}    //div[@id='exit-footer' and @style='display: block;']/div[@id='delete-button']
${btnReplace}    //div[@id='exit-footer' and @style='display: block;']/div[@id='replace-button']
${btnConfirm}    //div[@id='confirms' and @style='visibility: visible;']//input[@type='submit']

*** Keywords ***
Open WebUI And Go To Home Screen
    [Tags]    host_A    host_B
    #Step 1: Open Web UI
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${HOST A}    :8888             
    Open Browser    ${WebUI url}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${PAGE LOAD TIMEOUT}
    #Step 2: Operate some actions to make imVisionX back to "Idle" screen
    Set Web UI to Stand By State

    #Step 3: On "Idle" screen, click "Home" button to move to "Home" screen
    Go To Home Screen
    
Open WebUI Screen
    [Arguments]    ${Host Name}
    
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${Host Name}    :8888             
    Open Browser    ${WebUI url}    ${BROWSER}
    Maximize Browser Window
    Sleep    ${PAGE LOAD TIMEOUT}

Go To Home Screen
    Click Web Button    ${btnHome}
    
    
Go To Confirm Screen
    Click Web Button    ${btnConfirm}
                      
                           
Close Current Screen
    Close Browser
    
Click Web Button
    [Arguments]    ${btnName}
     ${button exist}    Get Element Count    ${btnName}
        
    Run Keyword If    ${button exist} == 1    
    ...    Run Keyword And Continue On Failure    Run Keywords    Click Element    ${btnName}
    ...    AND    Wait For Page Load  
    
Click Delete Button
    Click Web Button    ${btnDelete}            
    #This waiting is necessary to make sure the elements are up to date
    Wait For Page Update

Wait For Page Load
    Sleep    ${PAGE LOAD TIMEOUT}
    
Wait For Page Update
    Sleep    ${PAGE UPDATE TIMEOUT}
    
Wait For Bulk Patching Timeout
    Sleep    ${BULK PATCHING TIMEOUT}

Exit Screen
    Click Web Button    ${btnExit}
    Wait For Page Load

Set Web UI to Stand By State
    #Step 1.1: If the Web UI is being a specific screen with "Exit" button, press that button
    ${count Exit button}=      Get Element Count     ${btnExit}   
    Run Keyword If    ${count Exit button} > 0    Exit Screen           
    
    #Step 1.2: If the Web UI is being a specific screen with "Cance" button, press that button
    ${count Cancel button}=      Get Element Count     ${btnCancel}   
    Run Keyword If    ${count Cancel button} > 0    Exit Screen
         
    #Step 2: If the Web UI is being "Home" screen, press "Home" button to back to "Idle" screen
    ${count Home screen}=    Get Element Count    ${lblimVisionX}
    Run Keyword If    ${count Home screen} > 0    
    ...    Run Keywords    
    ...    Click Web Button    ${btnHome}
    ...    AND    Wait For Page Load    

Set Web UI to Stand By State and Close Current Browser
    #Step 1: If the Web UI is being a specific screen with "Exit" button, press that button
    ${count Exit button}=      Get Element Count     ${btnExit}   
    Run Keyword If    ${count Exit button} > 0    Exit Screen           
         
    #Step 2: If the Web UI is being "Home" screen, press "Home" button to back to "Idle" screen
    ${count Home screen}=    Get Element Count    ${lblimVisionX}
    Run Keyword If    ${count Home screen} > 0    
    ...    Run Keywords    
    ...    Click Web Button    ${btnHome}
    ...    AND    Wait For Page Load    

    #Step 3: Close current browser
    Close Browser
   