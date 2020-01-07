*** Settings ***
Library    SeleniumLibrary    
Library    String    

#Definition files
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    SSHDefinitions.robot
Resource    VirtualPanelDefinitions.robot

#Interface
Resource    ../Test_Pages/BulkPatchingPage.robot
*** Variables ***



*** Keywords ***
#Key work for Behavior Data Driven used in Test Cases
Bulk Patching Screen Should Be "${status}"
    
    ${temp status}=    Convert To Lowercase    ${status}    

    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Page Should Contain Element    ${lblBulk Patching Title}
    ...    ELSE IF    '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Page Should Not Contain Element    ${lblBulk Patching Title}    

The Header of End A Is "${status}"
    ${get status}=    Get Status of Tab End A 
    Run Keyword And Continue On Failure    Should Be Equal    "${status}"    ${get status}    msg="Status of End A is not matched the checked value!!!"
    
Get Status of Tab End A
    #Step 1: Get value of attribute "style" from element "tabEndA"
    ${output status}=    Get Element Attribute    ${tabEndA}    style
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: gray;", return "inactive"
    
    ${status}=    Run Keyword If    '${output status}' == '${attribute tab active}'    Set Variable    "active"
    ...    ELSE IF    '${output status}' == '${attribute tab inactive}'    Set Variable    "inactive"           
     
    #Step 3: Return the correct status
    [Return]    ${status}
        
Get Status of Tab End B
    #Step 1: Get value of attribute "style" from element "tabEndB"
    ${output status}=    Get Element Attribute    ${tabEndB}    style
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: gray;", return "inactive"
    
    ${status}=    Run Keyword If    '${output status}' == '${attribute tab active}'    Set Variable    "active"
    ...    ELSE IF    '${output status}' == '${attribute tab inactive}'    Set Variable    "inactive"           
     
    #Step 3: Return the correct status
    [Return]    ${status}     

The Header of End B Is "${status}"
    ${get status}=    Get Status of Tab End B 
    Run Keyword And Continue On Failure    Should Be Equal    "${status}"    ${get status}    msg="Status of End B is not matched the checked value!!!"      

The Help Text Is "${helptext}"
    
    ${get helptext}=    Get Text    ${lblHelpText} 
    Run Keyword And Continue On Failure    Should Be Equal    ${helptext}    ${get helptext}    msg="The helptext is not matched the checked value!!!"

Check to see if Rack "${rackID}" Panel "${panelID}" Port "${portID}" "${status}" in End "${end position}"
    
    [Documentation]    This keyword is used to check the information of LC panel displaying in either End A or End B on Bulk Patching screen
    ...      
    ...                Argument: rackID, panelID, portID, status[appeared/disappeared], end position[A/B]  
    #//ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
    
    #Step 1: Convert the input "end position" to the position on xPath syntax. 
    #Currently, the div[2] will be End A, and the div[4] will be End B   
    ${input end position}=    Run Keyword If    '${end position}'=='a' or '${end position}'=='A'    Set Variable    2   
    ...    ELSE IF         '${end position}'=='b' or '${end position}'=='B'    Set Variable    4
      
    #Step 2: Join the input port information to be a text in form of "Rack 1-Panel 1-Port 3", to use to add to xPatch node "p[contains(text(),'Port Information')]" for comparision purpose
    
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input port}=    Catenate    -Port    ${portID}
            
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input port}
    
    
    #Step 3: On the xPath syntax of Port position on "Bulk Patching" screen, replace the "End Position" by value of ${input end position} and "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic port position}    End Position    ${input end position}                
    ${xPath syntax2}=    Replace String    ${xPath syntax1}    Port Information    ${input port information}
    
    #Step 4: Find the desired element in the list of lines in Bulk Patching screen
    # ${count}= 0 [not found], 1 [found]
    ${number of lines}=    Number of Lines in Bulk Patching Screen    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of lines+1}
            
        ${index temp}=    Evaluate        ${index} + 1
             

        #${index string}=    Convert To String    ${index temp}
        ${index string}=    Convert To String    ${index+1}
        ${xPath syntax3}=    Replace String    ${xPath syntax2}    Line Position    ${index string}
        Log    ${xPath syntax3}    
        ${count}=    Get Element Count    ${xPath syntax3}
        Exit For Loop If    ${count} == 1
    END
    
    #Step 5: Check if the element appeared/ disappeared
    #Step 5.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 5.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'
       
Check if Rack "${rackID}" Panel "${panelID}" Row "${row} Port "${portID}" "${status}" in End "${end position}"
    
    [Documentation]    This keyword is used to check the information of Coper panel displaying in either End A or End B on Bulk Patching screen
    ...      
    ...                Argument: rackID, panelID, row, portID, status[appeared/disappeared], end position[A/B]  
    #//ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
    
    #Step 1: Convert the input "end position" to the position on xPath syntax. 
    #Currently, the div[2] will be End A, and the div[4] will be End B   
    ${input end position}=    Run Keyword If    '${end position}'=='a' or '${end position}'=='A'    Set Variable    2   
    ...    ELSE IF         '${end position}'=='b' or '${end position}'=='B'    Set Variable    4
      
    #Step 2: Join the input port information to be a text in form of "Rack 1-Panel 1-Port 3", to use to add to xPatch node "p[contains(text(),'Port Information')]" for comparision purpose
    
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input port}=    Catenate    -Port    ${portID}
            
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input port}
    
    
    #Step 3: On the xPath syntax of Port position on "Bulk Patching" screen, replace the "End Position" by value of ${input end position} and "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic port position}    End Position    ${input end position}                
    ${xPath syntax2}=    Replace String    ${xPath syntax1}    Port Information    ${input port information}
    
    #Step 4: Find the desired element in the list of lines in Bulk Patching screen
    # ${count}= 0 [not found], 1 [found]
    ${number of lines}=    Number of Lines in Bulk Patching Screen    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of lines+1}
            
        ${index temp}=    Evaluate        ${index} + 1
             

        #${index string}=    Convert To String    ${index temp}
        ${index string}=    Convert To String    ${index+1}
        ${xPath syntax3}=    Replace String    ${xPath syntax2}    Line Position    ${index string}
        Log    ${xPath syntax3}    
        ${count}=    Get Element Count    ${xPath syntax3}
        Exit For Loop If    ${count} == 1
    END
    
    #Step 5: Check if the element appeared/ disappeared
    #Step 5.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 5.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'    
        
Check and see if Rack "${rackID}" Panel "${panelID}" ModuleHD "${module}" Port "${portID}" "${status}" in End "${end position}"
        
    [Documentation]    This keyword is used to check the information of HDF panel displaying in either End A or End B on Bulk Patching screen
    ...      
    ...                Argument: rackID, panelID, module, portID, status[appeared/disappeared], end position[A/B]     
    #//ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
    
    #Step 1: Convert the input "end position" to the position on xPath syntax. 
    #Currently, the div[2] will be End A, and the div[4] will be End B   
    ${input end position}=    Run Keyword If    '${end position}'=='a' or '${end position}'=='A'    Set Variable    2   
    ...    ELSE IF         '${end position}'=='b' or '${end position}'=='B'    Set Variable    4
      
    #Step 2: Join the input port information to be a text in form of "Rack 1-Panel 1-Port 3", to use to add to xPatch node "p[contains(text(),'Port Information')]" for comparision purpose
    
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input module}=    Catenate    -Module    ${module}
    ${input port}=    Catenate    -Port    ${portID}
            
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input module}    ${input port}
    
    
    #Step 3: On the xPath syntax of Port position on "Bulk Patching" screen, replace the "End Position" by value of ${input end position} and "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic port position}    End Position    ${input end position}                
    ${xPath syntax2}=    Replace String    ${xPath syntax1}    Port Information    ${input port information}
    
    #Step 4: Find the desired element in the list of lines in Bulk Patching screen
    # ${count}= 0 [not found], 1 [found]
    ${number of lines}=    Number of Lines in Bulk Patching Screen    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of lines+1}
            
        ${index temp}=    Evaluate        ${index} + 1
             

        #${index string}=    Convert To String    ${index temp}
        ${index string}=    Convert To String    ${index+1}
        ${xPath syntax3}=    Replace String    ${xPath syntax2}    Line Position    ${index string}
        Log    ${xPath syntax3}    
        ${count}=    Get Element Count    ${xPath syntax3}
        Exit For Loop If    ${count} == 1
    END
    
    #Step 5: Check if the element appeared/ disappeared
    #Step 5.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 5.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}' 

Check then see if Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${portID}" "${status}" in End "${end position}"
    
    [Documentation]    This keyword is used to check the information of 24F panel displaying in either End A or End B on Bulk Patching screen
    ...      
    ...                Argument: rackID, panelID, row, module, portID, status[appeared/disappeared], end position[A/B]  
    #//ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
    
    #Step 1: Convert the input "end position" to the position on xPath syntax. 
    #Currently, the div[2] will be End A, and the div[4] will be End B   
    ${input end position}=    Run Keyword If    '${end position}'=='a' or '${end position}'=='A'    Set Variable    2   
    ...    ELSE IF         '${end position}'=='b' or '${end position}'=='B'    Set Variable    4
      
    #Step 2: Join the input port information to be a text in form of "Rack 1-Panel 1-Port 3", to use to add to xPatch node "p[contains(text(),'Port Information')]" for comparision purpose
    
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input row}=    Catenate    -Row    ${row}
    ${input module}=    Catenate    -Module    ${module}
    ${input port}=    Catenate    -Port    ${portID}
            
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input row}    ${input module}    ${input port}
    
    
    #Step 3: On the xPath syntax of Port position on "Bulk Patching" screen, replace the "End Position" by value of ${input end position} and "Port Information" by value of ${input port information} 
    ${xPath syntax1}=    Replace String    ${dynamic port position}    End Position    ${input end position}                
    ${xPath syntax2}=    Replace String    ${xPath syntax1}    Port Information    ${input port information}
    
    #Step 4: Find the desired element in the list of lines in Bulk Patching screen
    # ${count}= 0 [not found], 1 [found]
    ${number of lines}=    Number of Lines in Bulk Patching Screen    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of lines+1}
            
        ${index temp}=    Evaluate        ${index} + 1
             

        #${index string}=    Convert To String    ${index temp}
        ${index string}=    Convert To String    ${index+1}
        ${xPath syntax3}=    Replace String    ${xPath syntax2}    Line Position    ${index string}
        Log    ${xPath syntax3}    
        ${count}=    Get Element Count    ${xPath syntax3}
        Exit For Loop If    ${count} == 1
    END
    
    #Step 5: Check if the element appeared/ disappeared
    #Step 5.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Set Variable    0
    
    #Step 5.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '${expected value}'    

Get Color Code of Port Information 
    [Arguments]    ${color}
    
    ${color}=    Convert To Lowercase    ${color}
    ${color code}=    Run Keyword If    '${color}' == 'red'    Set Variable    color:#F00;
    ...    ELSE IF            '${color}' == 'black'    Set Variable    color:#000;
    
    [Return]    ${color code}
                  
Check if Rack "${rackID}" Panel "${panelID}" Row "${row} Port "${portID}" in End "${end position}" color "${color}"
    
    [Documentation]    This keyword is used to check the color of port information of Coper or LC panel displaying in either End A or End B on Bulk Patching screen
    ...      
    ...                Argument: rackID, panelID, portID, end position [A/B], color [red/black]  
    #Element format: //ul[@id='bulkPatchList']/li[Line Position]/div[End Position][@style='Color']/p[contains(text(),'Port Information')]
    
    #Step 1: Convert the input "end position" to the position on xPath syntax. 
    #Currently, the div[2] will be End A, and the div[4] will be End B   
    ${input end position}=    Run Keyword If    '${end position}'=='a' or '${end position}'=='A'    Set Variable    2   
    ...    ELSE IF         '${end position}'=='b' or '${end position}'=='B'    Set Variable    4
      
    #Step 2: Join the input port information to be a text in form of "Rack 1-Panel 1-Port 3", to use to add to xPatch node "p[contains(text(),'Port Information')]" for comparision purpose
    
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    -Panel    ${panelID}
    ${input port}=    Catenate    -Port    ${portID}
            
    ${input port information}=    Catenate    SEPARATOR=    ${input rack}    ${input panel}    ${input port}
    ${input color}=    Get Color Code of Port Information    ${color}        
    
    #Step 3: On the xPath syntax of Port position on "Bulk Patching" screen, replace the "End Position" by value of ${input end position} and "Port Information" by value of ${input port information}, "Color" by value of ${input color} 
    ${xPath syntax1}=    Replace String    ${dynamic port position with color}    End Position    ${input end position}                
    ${xPath syntax2}=    Replace String    ${xPath syntax1}    Port Information    ${input port information}
    ${xPath syntax2.1}=    Replace String    ${xPath syntax2}    Color    ${input color}
    
    #Step 4: Find the desired element in the list of lines in Bulk Patching screen
    ${number of lines}=    Number of Lines in Bulk Patching Screen    
    
    ${count}=    Set Variable    0
    FOR    ${index}    IN RANGE    ${number of lines+1}
            
        ${index temp}=    Evaluate        ${index} + 1
             

        #${index string}=    Convert To String    ${index temp}
        ${index string}=    Convert To String    ${index+1}
        ${xPath syntax3}=    Replace String    ${xPath syntax2.1}    Line Position    ${index string}
        Log    ${xPath syntax3}    
        ${count}=    Get Element Count    ${xPath syntax3}
        Exit For Loop If    ${count} == 1
    END
    
    #Step 5: Check if found the desired element
    Run Keyword And Continue On Failure    Should Be Equal    '${count}'    '1'
            


##########################################################################################################################
#####------------ Xpath keyworks ------------#####    

Number of Lines in Bulk Patching Screen
     ${count}=    Get Element Count    ${number of lines}
     [return]    ${count}    
 