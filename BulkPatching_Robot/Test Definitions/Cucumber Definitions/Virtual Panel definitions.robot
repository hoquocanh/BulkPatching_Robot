*** Settings ***
Library    Collections    
Resource    ../../Test Resources/Profiles/Constant.robot

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
    
    #Step 2: Check in every row of @{VPpanels} to get the panel index depends on the input values
    FOR    ${panel index}    IN RANGE    ${panels number-1}
        #Now, we will check each of row in panels table
        #This will begin from index = panel index+1 since we need to skip the row of "menu"
       Run Keyword If    '${VPpanels[${panel index+1}][&{dic panels table}[panel type]]}' == '${VIRTUAL PANELS TYPE}[24F]' and '${VPpanels[${panel index+1}][&{dic panels table}[rackID]]}' == '${input rackID}' and '${VPpanels[${panel index+1}][&{dic panels table}[panelID]]}' == '${input panelID}' and '${VPpanels[${panel index+1}][&{dic panels table}[row]]}' == '${input row}' and '${VPpanels[${panel index+1}][&{dic panels table}[module]]}' == '${input module}'    
        ...    Exit For Loop        
                    
    END
    
    #Return the value at column "index" and at the row which all of input value matched
    [Return]    ${VPpanels[${panel index+1}][&{dic panels table}[index]]}       