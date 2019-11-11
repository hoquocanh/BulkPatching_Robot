*** Settings ***
Resource    ../../Test Definitions/Cucumber Definitions/General definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Home definitions.robot
Resource    ../../Test Definitions/Cucumber Definitions/Bulk Patching definitions.robot
Resource    ../Profiles/Constant.robot
Resource    ../../Test Definitions/Test Pages/General Page.robot
Suite Setup    Open WebUI And Go To Home Screen




*** Test Cases ***
ADD_BULK_BUTTON_0101_Verify that imVision X shall be back to the homepage after selecting the Exit button
    Given Go To Bulk Patching Screen
    Then Bulk Patching Screen Should Be Opened