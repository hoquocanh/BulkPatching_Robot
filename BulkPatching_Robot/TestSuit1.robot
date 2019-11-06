*** Settings ***
Library    SeleniumLibrary    
Library    SSHLibrary    
Library    OperatingSystem    
Library    Process    
#Suite Setup     open_SSH_connection_and_login
#Suite Teardown  Close All Connections

*** Variables ***
${HOST}      http://192.168.171.201
${USERNAME}  root
${PASSWORD}  D0ggyDog
${command}    ssh root@192.168.171.201
${command2}    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.171.201
${command_Plug_Copper}    vp_cmd_helper --plugin --rack 1 --panel 1 --port 1

*** Test Cases ***
First test case
    open_SSH_connection_and_login
   #open_SSH_connection_and_login_process
    #SSH_connection
*** Keywords ***
open_SSH_connection_and_login
     #${frt}=     Run     ssh root@192.168.171.201
     #${frt}=     Run     cmd
     ${frt}=     Run     ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.171.201
     Log    ${frt}    
     #Run    ${PASSWORD}
     #Run    ${command_Plug_Copper}
     
     
     
     #Run Process    ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@192.168.171.201    
     #Run Process    ${PASSWORD}    shell=yes   
     #Run Process    ${command_Plug_Copper}    shell=yes     
     
     #${frt}=     Run     ping 192.168.171.201
     Run Process    ping 192.168.171.201    
open_SSH_connection_and_login_process
    
    Start Process    ${command}
    
SSH_connection
    Open Connection  ${HOST}
    Login  ${USERNAME}  ${PASSWORD}
     


