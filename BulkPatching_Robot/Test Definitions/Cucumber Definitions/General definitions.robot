*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    ../Test Pages/General Page.robot
Resource    ../Test Pages/Home Page.robot

  
*** Variables ***



*** Keywords ***
Open WebUI And Go To Home Screen
    
    #Step 1: Open Web UI
    ${WebUI url}=        Catenate    SEPARATOR=    http://   ${HOST}    :8888             
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
    Wait For Page Load
                            
Close Current Screen
    Close Browser
    
Click Web Button
    [Arguments]    ${btnName}
    Click Element    ${btnName}
        
Wait For Page Load
    Sleep    ${PAGE LOAD TIMEOUT}

Exit Screen
    Click Web Button    ${btnExit}
        Wait For Page Load         

Set Web UI to Stand By State
    #Step 1: If the Web UI is being a specific screen with "Exit" button, press that button
    ${count Exit button}=      Get Element Count     ${btnExit}   
    Run Keyword If    ${count Exit button} > 0    Exit Screen           
         
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