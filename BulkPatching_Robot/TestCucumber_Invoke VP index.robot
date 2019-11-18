*** Settings ***
Library    Collections    
Resource    Test Definitions/Cucumber Definitions/Virtual Panel definitions.robot


*** Test Cases ***


Print Copper Index
   
    
    
    Get Copper Panel Index    1    2    1


    #vp_cmd_helper --create --rack 1 --type 1100ps --row 1