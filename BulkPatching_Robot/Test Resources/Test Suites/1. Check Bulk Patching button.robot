*** Settings ***
Resource    ../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot
Resource    ../Profiles/Constant.robot
Suite Setup    Open WebUI Screen    ${HOST}

*** Test Cases ***
ADD_BULK_BUTTON_0101_Verify that imVision X shall be back to the homepage after selecting the Exit button.
    