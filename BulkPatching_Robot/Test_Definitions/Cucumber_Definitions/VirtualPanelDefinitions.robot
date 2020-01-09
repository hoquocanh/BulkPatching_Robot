*** Settings ***
Library    Collections    
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    SSHDefinitions.robot

*** Variables ***
       
#Declare a dictionary variable to store the key as the name of item in @{menu} and the value of that key is the position of key in @{menu}
&{dic panels table}  index=0    panel type=1    rackID=2    panelID=3    row=4    module=5    moduleHD=6     


#------------------------ Custom Virtual Panel --------------------------------
@{menu}    index    panel type    rackID    panelID    row    module    moduleHD
@{row1}    1          1100ps          1        1         1     skip      skip
@{row2}    2          1100ps          1        2         1     skip      skip
@{row3}    3          1100ps          1        2         2     skip      skip
@{row4}    4          g2lc            1        3         skip  skip      skip
@{row5}    5          hdf             1        4         skip  beta      1
@{row6}    6          hdf             1        4         skip  beta      2
@{row7}    7          hdf             1        4         skip  alpha     3
@{row8}    8          32mpo           1        5         1     AB        skip
@{row9}    9          32mpo           1        5         1     CD        skip
@{row10}   10         96lc            1        6         1     AB        skip
@{row11}   11         96lc            1        6         1     CD        skip

#Create a 2D demension array
@{VPpanels}    ${menu}    ${row1}    ${row2}    ${row3}    ${row4}    ${row5}    ${row6}    ${row7}    ${row8}    ${row9}    ${row10}    ${row11}         
*** Keywords ***


Get Copper Panel Index
    [Arguments]    ${input rackID}    ${input panelID}    ${input row}
    
    #Step 1: Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    #Step 2: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[COPPER]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}' and '${VPpanels[${panel index+1}][&{dic panels table}[row]]}' == '${input row}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]}       
    
Get LC Panel Index
    [Arguments]    ${input rackID}    ${input panelID}
    
    #Step 1: Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    #Step 2: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[LC]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]}     
    
Get HDF Panel Index
    [Arguments]    ${input rackID}    ${input panelID}    ${input moduleHD}
    
    #Step 1: Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    #Step 2: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[HDF]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}' and '${VPpanels[${panel index+1}][&{dic panels table}[moduleHD]]}' == '${input moduleHD}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]}    
    
Get MPO Panel Index
    [Arguments]    ${input rackID}    ${input panelID}    ${input row}    ${input module}
    
    #Step 1: Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    #Step 2: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[MPO]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}' and '${VPpanels[${panel index+1}][&{dic panels table}[row]]}' == '${input row}' and '${VPpanels[${panel index+1}][&{dic panels table}[module]]}' == '${input module}'    
        ...    Exit For Loop        
                  
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]} 
    
Get 24F Panel Index
    [Arguments]    ${input rackID}    ${input panelID}    ${input row}    ${input module}
    
    #Step 1: Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    #Step 2: Change the value of ${input module} to format as "AB" or "CD"
    ${temp module}=    Run Keyword If    '${input module}' == 'A' or '${input module}' == 'a' or '${input module}' == 'B' or '${input module}' == 'b'    Set Variable    AB
                       ...  ELSE IF          '${input module}' == 'C' or '${input module}' == 'c' or '${input module}' == 'D' or '${input module}' == 'd'    Set Variable    CD
    
    #Step 3: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[24F]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}' and '${VPpanels[${panel index+1}][&{dic panels table}[row]]}' == '${input row}' and '${VPpanels[${panel index+1}][&{dic panels table}[module]]}' == '${temp module}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]}   
    

Plugin Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get Copper Panel Index    ${rackID}    ${panelID}    ${row}
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugin --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 
    
Press Copper port at Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${portID}" with keymode "${keyMode}"
    
    [Documentation]    This keyword is used to press on a specific Copper port regarding to type of keymode
    ...      
    ...                Argument: rackID, panelID, row, portID, keyMode[short/long]
    
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get Copper Panel Index    ${rackID}    ${panelID}    ${row}
    Log    ${panel index}    
    #Step 2: Compose a completed command to press a panel port     
    ${completed command}=        Catenate    vp_cmd_helper --press --rack     ${rackID}    --panel    ${panel index}     --port     ${portID}    --keymode    ${keyMode}     
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command}   
       
Plugout Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get Copper Panel Index    ${rackID}    ${panelID}    ${row}
    Log    ${panel index}    
    #Step 2: Compose a completed plugout tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugout --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Plugin Serial Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plug tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugin Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${i}"
    END            

Plugout Serial Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer        
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plugout tip from ${from port} to ${to port}
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugout Copper Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Port "${i}"
    END
Press LC port at Rack "${rackID}" Panel "${panelID}" Port "${portID}" with keymode "${keyMode}"
    [Documentation]    This keyword is used to press on a specific Copper port regarding to type of keymode
    ...      
    ...                Argument: rackID, panelID, portID, keyMode[short/long]
    
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get LC Panel Index    ${rackID}    ${panelID}
    Log    ${panel index}    
    #Step 2: Compose a completed command to press a panel port     
    ${completed command}=        Catenate    vp_cmd_helper --press --rack     ${rackID}    --panel    ${panel index}     --port     ${portID}    --keymode    ${keyMode}     
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command}   
Plugin LC Tip to Rack "${rackID}" Panel "${panelID}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get LC Panel Index    ${rackID}    ${panelID}
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugin --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Plugout LC Tip to Rack "${rackID}" Panel "${panelID}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get LC Panel Index    ${rackID}    ${panelID}
    Log    ${panel index}    
    #Step 2: Compose a completed plugout tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugout --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Plugin Serial LC Tip to Rack "${rackID}" Panel "${panelID}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plug tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugin LC Tip to Rack "${rackID}" Panel "${panelID}" Port "${i}"
    END       

Plugout Serial LC Tip to Rack "${rackID}" Panel "${panelID}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plugout tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugout LC Tip to Rack "${rackID}" Panel "${panelID}" Port "${i}"
    END       
    
Press HDF port at Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" Port "${portID}" with keymode "${keyMode}"
    [Documentation]    This keyword is used to press on a specific Copper port regarding to type of keymode
    ...      
    ...                Argument: rackID, panelID, moduleHD, portID, keyMode[short/long]
    
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get HDF Panel Index    ${rackID}    ${panelID}    ${moduleHD}
    Log    ${panel index}    
    #Step 2: Compose a completed command to press a panel port     
    ${completed command}=        Catenate    vp_cmd_helper --press --rack     ${rackID}    --panel    ${panel index}     --port     ${portID}    --keymode    ${keyMode}     
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command}   
    
Plugin HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get HDF Panel Index    ${rackID}    ${panelID}    ${moduleHD}
    
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugin --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 
 
Plugout HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get HDF Panel Index    ${rackID}    ${panelID}    ${moduleHD}
    
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugout --rack     ${rackID}    --panel    ${panel index}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 

Plugin Serial HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plug tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugin HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" Port "${i}"
    END

Plugout Serial HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plugout tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugout HDF Tip to Rack "${rackID}" Panel "${panelID}" ModuleHD "${moduleHD}" Port "${i}"
    END
           
Press 24F port at Rack "${rackID}" Panel "${panelID}" Row "${row}" ModuleHD "${moduleHD}" Port "${portID}" with keymode "${keyMode}"
    [Documentation]    This keyword is used to press on a specific Copper port regarding to type of keymode
    ...      
    ...                Argument: rackID, panelID, row, moduleHD, portID, keyMode[short/long]
    
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get 24F Panel Index    ${rackID}    ${panelID}    ${row}    ${moduleHD}
    Log    ${panel index}    
    #Step 2: Compose a completed command to press a panel port     
    ${completed command}=        Catenate    vp_cmd_helper --press --rack     ${rackID}    --panel    ${panel index}    --module    ${moduleHD}     --port     ${portID}    --keymode    ${keyMode}     
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command}   
      
Plugin 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get 24F Panel Index    ${rackID}    ${panelID}    ${row}    ${module}
    
    Log    ${panel index}    
    #Step 2: Compose a completed plug tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugin --rack     ${rackID}    --panel    ${panel index}    --module    ${module}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command} 
    
Plugout 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${portID}"
    #Step 1: Get virtual panel index from virtual panels table
    ${panel index}=    Get 24F Panel Index    ${rackID}    ${panelID}    ${row}    ${module}
    
    Log    ${panel index}    
    #Step 2: Compose a completed plugout tip to panel port     
    ${completed command}=        Catenate    vp_cmd_helper --plugout --rack     ${rackID}    --panel    ${panel index}    --module    ${module}     --port     ${portID} 
    Log    ${completed command}  
    
    #Step 3: Send virtual command via SSH connection
    Enter Virtual Command ${completed command}
    
Plugin Serial 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plug tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugin 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${i}"
    END   
    
Plugout Serial 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" from Port "${port1ID}" to Port "${port2ID}"
    #Step 1: Convert ${from port} and ${to port} to integer    
    ${from port}=    Convert To Integer    ${port1ID}
    ${to port}=    Convert To Integer    ${port2ID}
    
    #Step 2: Plugout tip from ${from port} to ${to port}     
    FOR    ${i}    IN RANGE    ${from port}    ${to port+1}
        Plugout 24F Tip to Rack "${rackID}" Panel "${panelID}" Row "${row}" Module "${module}" Port "${i}"
    END     