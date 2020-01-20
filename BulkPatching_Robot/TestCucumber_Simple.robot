*** Settings ***



Resource    Test_Definitions/Cucumber_Definitions/SSHDefinitions.robot
#Suite Setup     Open SSH Connection and Login
#Suite Teardown  Close All Connections




*** Variables ***


${command_Plugin_Copper}    vp_cmd_helper --plugin --rack 1 --panel 1 --port 1
${command_Plugout_Copper}   vp_cmd_helper --plugout --rack 1 --panel 1 --port 1

*** Test Cases ***
TC01
    Given Open SSH Connection and Login
    When Enter Virtual Command ${command_Plugin_Copper}
    When Enter Virtual Command ${command_Plugout_Copper}
    
    
       
