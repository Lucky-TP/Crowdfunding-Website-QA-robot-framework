*** Settings ***
Resource    ../resources/project.robot

*** Test Cases ***
Valid Login Test
    [Tags]    smoke
    Open Browser To Login Page
    Input Text    id=email    ${VALID_EMAIL}
    Input Text    id=password    ${VALID_PWD}
    Click Element    xpath=//span[contains(text(), 'Sign in')]
    Wait Until Page Contains    About me    timeout=10s
    Close Browser

Invalid Login Test
    [Tags]    regression
    Open Browser To Login Page
    Input Text    id=email    ${INVALID_EMAIL}
    Input Text    id=password    ${INVALID_PWD}
    Click Element    xpath=//span[contains(text(), 'Sign in')]
    Wait Until Page Contains    Invalid email or password. Please try again.
    Close Browser