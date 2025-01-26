*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
Open Browser To Login Page
    Open Browser    ${BASE_URL}${SIGN_IN_PATH}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Shark

Open Browser To Explore Page
    Open Browser    ${BASE_URL}${EXPLORE_PATH}    ${BROWSER}
    Maximize Browser Window