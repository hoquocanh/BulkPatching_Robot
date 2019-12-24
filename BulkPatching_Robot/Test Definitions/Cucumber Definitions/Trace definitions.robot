*** Settings ***
Library    SeleniumLibrary    
Library    String    

#Definition files
Resource    ../../Test Resources/Profiles/Constant.robot

#Interface
Resource    ../Test Pages/General Page.robot    
Resource    ../Test Pages/Trace Page.robot
Variables    ../../Test Resources/Test Data/AttributeValue.py
*** Variables ***

*** Keywords ***
#Key work for Behavior Data Driven used in Test Cases

Check if Rack "${rackID}" Panel "${panelID}" Row "${row} Port "${portID}" "${status}" in Trace screen
    
    [Documentation]    This keyword is used to check the information of Copper panel displaying in the same information rectangle area
    ...      
    ...                Argument: rackID, panelID, row, portID, status[appeared/disappeared]  
    #//div[@id='row-left-center' and contains(@style,'visible')]/div[contains(text(),'port information')]
    
    #Step 1: Join the input port information to be a text in form of "Rack 1-Panel 1-Port  3", to use to add to xPatch node "input[@value='Port Information ']" for comparision purpose
    ${input rack}=    Catenate    Rack    ${rackID}
    ${input panel}=    Catenate    Panel    ${panelID}
    ${input port}=    Catenate    Port    ${portID} 
    
    #ste 2: Find each of infor in Left or Right Rectangle Area
    ${temp rack 1}=    Is Information Belong to Left Rectangle Area    ${input rack} 
    ${temp panel 1}=    Is Information Belong to Left Rectangle Area    ${input panel}
    ${temp port 1}=    Is Information Belong to Left Rectangle Area    ${input port}  
    
    ${temp rack 2}=    Is Information Belong to Right Rectangle Area    ${input rack} 
    ${temp panel 2}=    Is Information Belong to Right Rectangle Area    ${input panel}
    ${temp port 2}=    Is Information Belong to Right Rectangle Area    ${input port}
                   
    #Step 3: Find the whole infor in either Left Rectangle Area or Right Rectangle Area
    ${infor belong to left rectangle}=    Run Keyword If    ${temp rack 1} == 1 and ${temp panel 1} == 1 and ${temp port 1} == 1    Run Keyword And Continue On Failure    Set Variable    1    
                                          ...    ELSE    Run Keyword And Continue On Failure    Set Variable    0
    ${infor belong to right rectangle}=   Run Keyword If    ${temp rack 2} == 1 and ${temp panel 2} == 1 and ${temp port 2} == 1    Run Keyword And Continue On Failure    Set Variable    1
                                           ...    ELSE    Run Keyword And Continue On Failure    Set Variable    0
    
    ${result}=    Run Keyword If    ${infor belong to left rectangle} == 1 or ${infor belong to right rectangle} == 1    Run Keyword And Continue On Failure    Set Variable    1        
                  ...    ELSE    Run Keyword And Continue On Failure    Set Variable    0
                  
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${result}'    '${expected value}'    Port information is not ${status}

Check if the "${portion}" of "${panel type}" Patching Bar "${status}" in Trace screen
    
    [Documentation]    This keyword is used to check the portion of patching bar of Copper/ LC panel appeared/ disappeared in Trace screen
    ...      
    ...                Argument: portion [full/haft], panel type [copper/LC...], status[appeared/disappeared]  
    #//div[@id='connectivity-icon' and @class='panel type']
    
    #Step 1: Select the correct attribute value based on the inputed value of ${portion} and ${panel type}     
    ${temp portion}=    Convert To Lowercase    ${portion}
    ${temp panel type}=    Convert To Lowercase    ${panel type}
    
    ${replace panel type}=    Run Keyword If    '${temp portion}' == 'full' and '${temp panel type}' == 'copper'     Run Keyword And Continue On Failure    Set Variable    ${barFullCopper}
    ...    ELSE IF        '${temp portion}' == 'haft' and '${temp panel type}' == 'copper'    Run Keyword And Continue On Failure    Set Variable    ${barHaftCopper}
    
    #Step 2: On the xPath syntax of patching bar, replace "Panel Type" by value of ${replace panel type} 
    ${xPath syntax}=    Replace String    ${dynamic patching bar}    Panel Type    ${replace panel type}
    
    #Step 3: Get the number of element be seen in current page 
    ${result}=    Get Element Count    ${xPath syntax}
    
    #Step 4: Check if the element appeared/ disappeared
    #Step 4.1: Change the input status to 1 [if appeared] or 0 [if disappeared]
    ${temp status}=    Convert To Lowercase    ${status}
    ${expected value}=    Run Keyword If    '${temp status}' == 'appeared'    Run Keyword And Continue On Failure    Set Variable    1
    ...    ELSE IF        '${temp status}' == 'disappeared'    Run Keyword And Continue On Failure    Set Variable    0
    
    #Step 4.2: compare the status to the value checking from list of lines in Bulk Patching screen         
    Run Keyword And Continue On Failure    Should Be Equal    '${result}'    '${expected value}'    The patching bar is not ${status}
##########################################################################################################################
#####------------ Xpath keyworks ------------#####    
    
Is Information Belong to Left Rectangle Area
    [Arguments]    ${infor}
    #//div[@id='row-left-center' and contains(@style,'visible')]/div[contains(text(),'port information')]
    
    #Step 1: On the xPath syntax of Left Rectangle Area, replace "Port Information" by value of ${infor} 
    ${xPath syntax}=    Replace String    ${dynamic trace port position on left rectangle}    Port Information    ${infor}
    
    #Step 2: Get the number of element be seen in current page 
    ${result}=    Get Element Count    ${xPath syntax}
    
    [return]    ${result}        
        
Is Information Belong to Right Rectangle Area
    [Arguments]    ${infor}
    #//div[@id='row-right-center' and contains(@style,'visible')]/div[contains(text(),'port information')]
    
    #Step 1: On the xPath syntax of Right Rectangle Area, replace "Port Information" by value of ${infor} 
    ${xPath syntax}=    Replace String    ${dynamic trace port position on right rectangle}    Port Information    ${infor}
    
    #Step 2: Get the number of element be seen in current page 
    ${result}=    Get Element Count    ${xPath syntax}
    
    [return]    ${result}    