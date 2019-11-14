*** Variables ***
${lblBulk Patching Title}    //div[@id='bulk-patch-title' and @style='display: block;']
${btnExit}    //div[@id='exit-footer' and @style='display: block;']/div[@id='exit-button']
${tabEndA}    //div[@id='btn-end-a']
${tabEndB}    //div[@id='btn-end-b']
${lblHelpText}    //ul[@id='text-line']/li/p

${number of lines}    //ul[@id='bulkPatchList']/li
${dynamic port position}    //ul[@id='bulkPatchList']/li[Line Position]/div[End Position]/p[contains(text(),'Port Information')]

${attribute tab active}    background: black;
${attribute tab inactive}    background: gray;