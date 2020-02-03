*** Settings ***
Library    String
Library    SeleniumLibrary   
Resource    ../../Test_Resources/Profiles/Constant.robot
Resource    ../Test_Pages/HomePage.robot
Resource    ../Test_Pages/GeneralPage.robot
Resource    ../Test_Pages/SettingsPage.robot


*** Variables ***
#------------------Elements------------------

${btnSave}    //div[@id='save-button']

${btnDanish}    //div[@id='language-list']/div[@id='1005']
${btnGerman}    //div[@id='language-list']/div[@id='1003']
${btnEnglish}    //div[@id='language-list']/div[@id='1000']
${btnSpainish}    //div[@id='language-list']/div[@id='1001']
${btnFrench}    //div[@id='language-list']/div[@id='1002']
${btnItalian}    //div[@id='language-list']/div[@id='1004']
${btnPolish}    //div[@id='language-list']/div[@id='1007']
${btnPortuguese}    //div[@id='language-list']/div[@id='1008']
${btnRussian}    //div[@id='language-list']/div[@id='1006']
${btnChinese}    //div[@id='language-list']/div[@id='1009']
${btnKorean}    //div[@id='language-list']/div[@id='10010']

*** Keywords ***
    
Touch Save Language
    Click Element    ${btnSave} 
    Wait For Page Load 
Move down and click element "${element}" 
       Mouse Down    ${element}
       Click Element  ${element}
         
Select Language "${language}"
    Go To Settings Screen
    Go To Select Language Screen
     ${temp language}=    Convert To Lowercase    ${language} 
    Run Keyword If    '${temp language}' == 'danish'    Run Keyword And Continue On Failure    Click Element    ${btnDanish} 
    ...    ELSE IF    '${temp language}' == 'german'    Run Keyword And Continue On Failure    Click Element    ${btnGerman}  
    ...    ELSE IF    '${temp language}' == 'english'    Run Keyword And Continue On Failure    Click Element     ${btnEnglish}
    ...    ELSE IF    '${temp language}' == 'spainish'    Run Keyword And Continue On Failure    Click Element    ${btnSpainish}  
    ...    ELSE IF    '${temp language}' == 'french'    Run Keyword And Continue On Failure    Click Element     ${btnFrench}
    ...    ELSE IF    '${temp language}' == 'italian'    Run Keyword And Continue On Failure    Click Element    ${btnItalian}  
    ...    ELSE IF    '${temp language}' == 'polish'    Run Keyword And Continue On Failure     Move down and click element "${btnPolish}"         
                      # Click Element     ${btnPolish}
    ...    ELSE IF    '${temp language}' == 'portuguese'    Run Keyword And Continue On Failure    Move down and click element "${btnPortuguese}" 
    ...    ELSE IF    '${temp language}' == 'russian'    Run Keyword And Continue On Failure    Move down and click element "${btnRussian}"
    ...    ELSE IF    '${temp language}' == 'chinese'    Run Keyword And Continue On Failure    Move down and click element "${btnChinese}" 
    ...    ELSE IF    '${temp language}' == 'korean'    Run Keyword And Continue On Failure    Move down and click element "${btnKorean}"
    ...    ELSE     Run Keyword And Continue On Failure     Log    ${temp language}
    Touch Save Language