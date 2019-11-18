*** Settings ***
Library    SeleniumLibrary    
Library    String    

#Definition files
Resource    ../../Test Resources/Profiles/Constant.robot
Resource    SSH definitions.robot
Resource    Virtual Panel definitions.robot

#Interface
Resource    ../Test Pages/Bulk Patching Page.robot
*** Variables ***



*** Keywords ***
Bulk Patching Screen Should Be Opened
    Page Should Contain Element    ${lblBulk Patching Title}    

    
Get Status of Tab End A
    #Step 1: Get value of attribute "style" from element "tabEndA"
    ${output status}=    Get Element Attribute    ${tabEndA}    style
    
    #Step 2: Return value "active" if the output attribute's value is "background: black;" else if that value is "background: gray;", return "inactive"
    
    ${status}=    Run Keyword If    '${output status}' == '${attribute tab active}'    Set Variable    "active"
    ...    ELSE IF    '${output status}' == '${attribute tab inactive}'    Set Variable    "inactive"           
     
    #Step 3: Return the correct status
    [Return]    ${status}     

The Header of End A Is "${status}"
    ${get status}=    Get Status of Tab End A 
    Should Be Equal    ${status}    ${get status}    msg="Status of End A is not matched the checked value!!!"
    
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
    Should Be Equal    ${status}    ${get status}    msg="Status of End B is not matched the checked value!!!"      

The Help Text Is "${helptext}"
    
    ${get helptext}=    Get Text    ${lblHelpText} 
    Should Be Equal    ${helptext}    ${get helptext}    msg="The helptext is not matched the checked value!!!"
    
##########################################################################################################################
#####------------ Virtual panels keywork ------------#####

Plugin Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get Copper Panel Index    ${rackID}    ${panelID}    ${row}
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to Copper port     
    ${completed command}=        Catenate    vp_cmd_helper --plugin --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Plugout Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get Copper Panel Index    ${rackID}    ${panelID}    ${row}
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to Copper port     
    ${completed command}=        Catenate    vp_cmd_helper --plugout --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Check to see if Rack "${rackID}" Panel "${panelID}" Port "${portID}" existed in End "${end position}"
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
    
    #Step 5: Check if found the desired element
        
    Should Be Equal As Strings    ${count}    1    
        
              
    


##########################################################################################################################
#####------------ Xpath keyworks ------------#####    

Number of Lines in Bulk Patching Screen
     ${count}=    Get Element Count    ${number of lines}
     [return]    ${count}    
 