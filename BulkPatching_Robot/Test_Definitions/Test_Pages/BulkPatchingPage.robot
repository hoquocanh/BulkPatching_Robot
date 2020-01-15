*** Settings ***
Library    SeleniumLibrary
Library    String    

Resource    GeneralPage.robot
Resource    HomePage.robot   

*** Variables ***
#------------------Elements------------------
${lblBulk Patching Title}    //div[@id='bulk-patch-title' and @style='display: block;']
${btnExit}    //div[@id='exit-footer' and @style='display: block;']/div[@id='exit-button']
${tabEndA}    //div[@id='btn-end-a']
${tabEndB}    //div[@id='btn-end-b']
${lblHelpText}    //ul[@id='text-line']/li/p
${btnEquipment}    //div[@id='btn-header' and contains(@style,'visibility: visible')]
${txtList1_Equipment}    //li[@id='list1']/div/div/div[@style='float:left']

${number of lines}    //ul[@id='bulkPatchList']/li
${dynamic port position}    //ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]
${dynamic port position with color}    //ul[@id='bulkPatchList']/li[Line Position]/div[End Position][@style='Color']/p[contains(text(),'Port Information')]

#------------------Elements attribute------------------
${attribute tab active}    background: black;
${attribute tab inactive}    background: gray;

*** Keywords ***

   
    
Select Tab End "${end position}"
    ${temp end position}=    Convert To Lowercase    ${end position}    
    
    Run Keyword If    '${temp end position}' == 'a'    Click Web Button    ${tabEndA}
    ...    ELSE IF    '${temp end position}' == 'b'    Click Web Button    ${tabEndB}
    
    #Since switching tab take more than to update tab status, then it need wait for 2 seconds
    Wait For Page Load                
  
Touch Equipment Button
    Click Web Button    ${btnEquipment} 
    Wait For Page Load