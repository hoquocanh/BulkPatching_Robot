*** Settings ***
Library    Collections    
Suite Setup    Initial Panels Table Variable

*** Variables ***

${index}=    index
${panel type}=    panel type
${rack id}=    rack id
${panel id}=    panel id
${row}=    row
${module}=    module
${moduleHD}=    moduleHD         

&{dictionary panels table}  index = 0    panel type = 1    rack id = 2    row = 3    module = 4    moduleHD = 5     


@{menu}    index    panel type    rack id    panel id    row    module    moduleHD
@{row1}    1          1100ps          1           1         1     skip      skip
@{row2}    2          1100ps          1           2         1     skip      skip
@{row3}    3          1100ps          1           2         2     skip      skip

@{VPpanels}    ${menu}    ${row1}    ${row2}    ${row3}

${panel type column index}=    Get Column Index    panel type             
*** Keywords ***
Get Panel Table_Index
    ${x}=    Get Index From List    ${menu}    ${index}
    [Return]    ${x}    
    
Get Panel Table_Panel Type
    ${x}=    Get Index From List    ${menu}    ${panel type}
    [Return]    ${x}

Get Panel Table_Rack ID
    ${x}=    Get Index From List    ${menu}    ${rack id}
    [Return]    ${x}   
  
Get Panel Table_Panel ID
    ${x}=    Get Index From List    ${menu}    ${panel id}
    [Return]    ${x}   

Get Panel Table_Row
    ${x}=    Get Index From List    ${menu}    ${row}
    [Return]    ${x}   

Initial Panels Table Variable
    ${panel table index}=    Get Panel Table_Index
    ${panel type index}=    Get Panel Table_Panel Type
    ${rackID index}=    Get Panel Table_Rack ID
    ${panelID index}=    Get Panel Table_Panel ID
    ${row index}=    Get Panel Table_Row  

Get Copper Panel Index
    [Arguments]    ${input rackID}    ${input panelID}    ${input row}
    
    ${var panel type}=    Set Variable    1100ps    
*** Test Cases ***


2-Dimensional List
    ${input panel type}=    Set Variable    1100ps    
    ${input rackID}=    Set Variable    1
    ${input panelID}=    Set Variable    2
    ${input row}=    Set Variable    2   
    
    
    #Log    &{dictionary panels table}
    Log    ${dictionary panels table}[panel type]
    
    #Get the total number of panels in Panel List
    ${panels number}=    Get Length    ${VPpanels}
    
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][${panel type index}]}' == '${input panel type}' and '${VPpanels[${panel index+1}][${rackID index}]}' == '${input rackID}' and '${VPpanels[${panel index+1}][${panelID index}]}' == '${input panelID}' and '${VPpanels[${panel index+1}][${row index}]}' == '${input row}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    Log    ${VPpanels[${panel index+1}][${panel table index}]}   
    #vp_cmd_helper --create --rack 1 --type 1100ps --row 1