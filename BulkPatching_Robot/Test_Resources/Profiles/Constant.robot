*** Variables ***
${BROWSER}    Chrome

${HOST A}    192.168.171.201
${HOST B}    192.168.171.205  
${USERNAME}  root
${PASSWORD}  D0ggyDog
${PAGE UPDATE TIMEOUT}    0.1 second
${PAGE LOAD TIMEOUT}    1 second
${PAGE LAUNCH TIMEOUT}    3 seconds
${BULK PATCHING TIMEOUT}    5 minutes

&{VIRTUAL PANELS TYPE}    COPPER=1100ps    LC=g2lc    HDF=hdf    MPO=32mpo    24F=96lc    

*** Keywords ***

