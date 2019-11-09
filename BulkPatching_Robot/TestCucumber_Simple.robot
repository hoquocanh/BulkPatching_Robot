*** Settings ***


Library    SSHLibrary    
#Suite Setup     Open SSH Connection and Login
#Suite Teardown  Close All Connections


Resource    Test Definitions/Cucumber Definitions/SSH definitions.robot

*** Variables ***
${HOST}      192.168.171.201
${USERNAME}  root
${PASSWORD}  D0ggyDog
${command}    ssh root@192.168.171.201
${command2}    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.171.201
${command_Plugin_Copper}    vp_cmd_helper --plugin --rack 1 --panel 1 --port 1
${command_Plugout_Copper}   vp_cmd_helper --plugout --rack 1 --panel 1 --port 1

*** Test Cases ***
TC01
    Given Open SSH Connection and Login
    When Enter Virtual Command ${command_Plugin_Copper}
    When Enter Virtual Command ${command_Plugout_Copper}
    
    
       
