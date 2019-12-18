*** Settings ***
Library    SeleniumLibrary    
Library    String    

#Definition files
Resource    ../../Test Resources/Profiles/Constant.robot

#Interface
Resource    ../Test Pages/General Page.robot    
Resource    ../Test Pages/Confirm Page.robot
*** Variables ***

*** Keywords ***
#Key work for Behavior Data Driven used in Test Cases

Check if Rack "${rackID}" Panel "${panelID}" Row "${row} Port "${portID}" "${status}" in Confirm list
    
    [Documentation]    This keyword is used to check the information of Copper panel displaying in Confirm list screen
    ...      
    ...                Argument: rackID, panelID, row, portID, status[appeared/disappeared]  
    #//input[@value='Port Information ']
    
    #Step 1: Join the input port information to be a text in form of "Rack 1-Panel 1-Port  3", to use to add to xPatch node "input[@value='Port Information ']" for comparision purpose
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    #Due to code of developer, there will have 2 appearances of Port information on "Confirm list" page.
    #If portID less than 10, it will be "Rack 1-Panel 1-Port  3" with 2 spaces after -Port
    #Otherwise,it will be "Rack 1-Panel 1-Port 11" with 1 spaces after -Port      
    ${input port}=    Run Keyword If    ${portID} < 10    Catenate    SEPARATOR=${SPACE}${SPACE}     -Port    ${portID}
    ...    ELSE    Catenate    SEPARATOR=${SPACE}     -Port    ${portID}    
                 
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input port}
       
    #Step 2: On the xPath syntax of Port position on "Confirm list" screen, replace "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic confirm port position}    Port Information    ${input port information}                        
            
    #Step 3: Find the desired element in each of Page in "Confirm list" screen
    # The result will be: ${count}= 0 [not found] and =1 [found]
    ${number of confirm page}=    Number of Confirm Pages    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of confirm page}
        #Check to see if existing the confirm line in current Confirm page    
        ${count}=    Get Element Count    ${xPath syntax1}
        Exit For Loop If    ${count} == 1
        
        #Move to next Confirm page
        Click Web Button    ${btnRightArrow}    
    END
    
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'


Check to see if Rack "${rackID}" Panel "${panelID}" Port "${portID}" "${status}" in Confirm list
    
    [Documentation]    This keyword is used to check the information of LC panel displaying in Confirm list screen
    ...      
    ...                Argument: rackID, panelID, portID, status[appeared/disappeared]  
    #//input[@value='Port Information ']
    
    #Step 1: Join the input port information to be a text in form of "Rack 1-Panel 1-Port  3", to use to add to xPatch node "input[@value='Port Information ']" for comparision purpose
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    #Due to code of developer, there will have 2 appearances of Port information on "Confirm list" page.
    #If portID less than 10, it will be "Rack 1-Panel 1-Port  3" with 2 spaces after -Port
    #Otherwise,it will be "Rack 1-Panel 1-Port 11" with 1 spaces after -Port      
    ${input port}=    Run Keyword If    ${portID} < 10    Catenate    SEPARATOR=${SPACE}${SPACE}     -Port    ${portID}
    ...    ELSE    Catenate    SEPARATOR=${SPACE}     -Port    ${portID}    
                 
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input port}
       
    #Step 2: On the xPath syntax of Port position on "Confirm list" screen, replace "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic confirm port position}    Port Information    ${input port information}                        
            
    #Step 3: Find the desired element in each of Page in "Confirm list" screen
    # The result will be: ${count}= 0 [not found] and =1 [found]
    ${number of confirm page}=    Number of Confirm Pages    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of confirm page}
        #Check to see if existing the confirm line in current Confirm page    
        ${count}=    Get Element Count    ${xPath syntax1}
        Exit For Loop If    ${count} == 1
        
        #Move to next Confirm page
        Click Web Button    ${btnRightArrow}    
    END
    
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'  
    

Check and see if Rack "${rackID}" Panel "${panelID}" ModuleHD "${module}" Port "${portID}" "${status}" in Confirm list
    
    [Documentation]    This keyword is used to check the information of HDF panel displaying in Confirm list screen
    ...      
    ...                Argument: rackID, panelID, module, portID, status[appeared/disappeared]  
    #//input[@value='Port Information ']
    
    #Step 1: Join the input port information to be a text in form of "Rack 1-Panel 1-Port  3", to use to add to xPatch node "input[@value='Port Information ']" for comparision purpose
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input module}=    Catenate    -Module    ${module}
    #Due to code of developer, there will have 2 appearances of Port information on "Confirm list" page.
    #If portID less than 10, it will be "Rack 1-Panel 1-Port  3" with 2 spaces after -Port
    #Otherwise,it will be "Rack 1-Panel 1-Port 11" with 1 spaces after -Port      
    ${input port}=    Run Keyword If    ${portID} < 10    Catenate    SEPARATOR=${SPACE}${SPACE}     -Port    ${portID}
    ...    ELSE    Catenate    SEPARATOR=${SPACE}     -Port    ${portID}    
                 
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input module}    ${input port}
       
    #Step 2: On the xPath syntax of Port position on "Confirm list" screen, replace "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic confirm port position}    Port Information    ${input port information}                        
            
    #Step 3: Find the desired element in each of Page in "Confirm list" screen
    # The result will be: ${count}= 0 [not found] and =1 [found]
    ${number of confirm page}=    Number of Confirm Pages    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of confirm page}
        #Check to see if existing the confirm line in current Confirm page    
        ${count}=    Get Element Count    ${xPath syntax1}
        Exit For Loop If    ${count} == 1
        
        #Move to next Confirm page
        Click Web Button    ${btnRightArrow}    
    END
    
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'
    
Check then see if Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${portID}" "${status}" in Confirm list
    
    [Documentation]    This keyword is used to check the information of 24F panel displaying in Confirm list screen
    ...      
    ...                Argument: rackID, panelID, row, module, portID, status[appeared/disappeared]  
    #//input[@value='Port Information ']
    
    #Step 1: Join the input port information to be a text in form of "Rack 1-Panel 1-Port  3", to use to add to xPatch node "input[@value='Port Information ']" for comparision purpose
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input row}=    Catenate    -Row    ${row}
    ${input module}=    Catenate    -Module    ${module}
    #Due to code of developer, there will have 2 appearances of Port information on "Confirm list" page.
    #If portID less than 10, it will be "Rack 1-Panel 1-Port  3" with 2 spaces after -Port
    #Otherwise,it will be "Rack 1-Panel 1-Port 11" with 1 spaces after -Port      
    ${input port}=    Run Keyword If    ${portID} < 10    Catenate    SEPARATOR=${SPACE}${SPACE}     -Port    ${portID}
    ...    ELSE    Catenate    SEPARATOR=${SPACE}     -Port    ${portID}    
                 
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input row}    ${input module}    ${input port}
       
    #Step 2: On the xPath syntax of Port position on "Confirm list" screen, replace "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic confirm port position}    Port Information    ${input port information}                        
            
    #Step 3: Find the desired element in each of Page in "Confirm list" screen
    # The result will be: ${count}= 0 [not found] and =1 [found]
    ${number of confirm page}=    Number of Confirm Pages    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of confirm page}
        #Check to see if existing the confirm line in current Confirm page    
        ${count}=    Get Element Count    ${xPath syntax1}
        Exit For Loop If    ${count} == 1
        
        #Move to next Confirm page
        Click Web Button    ${btnRightArrow}    
    END
    
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'
##########################################################################################################################
#####------------ Xpath keyworks ------------#####    

Number of Lines in Confirm List Screen
     ${count}=    Get Element Count    ${number of confirm lines}
     [return]    ${count}    
     
Number of Confirm Pages
    ${confirm number}=    Get Element Attribute    ${btnConfirm}    value
    ${int confirm number}=    Convert To Integer    ${confirm number}
    #There are 7 confirms item in a "Confirm list" page. Therefore, make a division of "int confirm number" with 7 then add 1.
    ${int page number}=    Evaluate    int((${int confirm number}/7)+1)    
    
    [return]    ${int page number}        
 