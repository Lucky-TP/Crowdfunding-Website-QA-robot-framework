*** Settings ***
Resource    ../resources/project.robot

*** Variables ***
${SEARCH_TERM}    Dragon

*** Test Cases ***
Search Test
    [Tags]    smoke
    Open Browser To Explore Page
    Input Text    xpath=//input[@placeholder="Explore projects"]    ${SEARCH_TERM}
    Press Keys    xpath=//input[@placeholder="Explore projects"]    ENTER
    Sleep    4s
    Wait Until Page Contains    ${SEARCH_TERM}
    Close Browser