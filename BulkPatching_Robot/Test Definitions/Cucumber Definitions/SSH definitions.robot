*** Settings ***

Library    SSHLibrary    
Resource    ../../Test Resources/Profiles/Constant.robot    

*** Variables ***

${command}    ssh root@192.168.171.201

${command_Plugin_Copper}    vp_cmd_helper --plugin --rack 1 --panel 1 --port 1
${command_Plugout_Copper}   vp_cmd_helper --plugout --rack 1 --panel 1 --port 1


*** Keywords ***
Open SSH Connection and Login
    Open Connection  ${HOST}
    Login  ${USERNAME}  ${PASSWORD}

  
    
Enter Virtual Command ${command}
    Write    ${command}    
             
    ${stdout}=  Read    loglevel=Trace    delay=1s    
    Log    ${stdout}   