*** Settings ***
Resource    ../resources/project.robot

Suite Setup       Login And Navigate To Profile
Suite Teardown    Logout And Close Browser

*** Test Cases ***
Verify Profile Information
    [Tags]    smoke
    Page Should Contain    ${VALID_FIRSTNAME} ${VALID_LASTNAME}

Update Profile Information
    [Tags]    regression
    Click Element    css=.ant-dropdown-trigger
    Wait Until Element Is Visible    css=.ant-dropdown-menu    10s
    Click Element    xpath=//div[contains(text(), 'Setting')]
    Wait Until Element Is Visible    id=username    5s
    Input Text    id=username    Tester Man
    Click Element    xpath=//span[contains(text(), 'Save Changes')]
    Wait Until Page Contains    Profile updated successfully

*** Keywords ***
Login And Navigate To Profile
    Open Browser To Login Page
    Input Text    id=email    ${VALID_EMAIL}
    Input Text    id=password    ${VALID_PWD}
    Click Element    xpath=//span[contains(text(), 'Sign in')]
    Wait Until Page Contains    About me    timeout=10s

Logout And Close Browser
    Wait Until Element Is Visible    css=.ant-dropdown-trigger
    Click Element    css=.ant-dropdown-trigger
    Wait Until Element Is Visible    css=.ant-dropdown-menu    10s
    Click Element    xpath=//div[contains(text(), 'Sign Out')]
    Wait Until Location Is    ${BASE_URL}${SIGN_IN_PATH}
    Close Browser