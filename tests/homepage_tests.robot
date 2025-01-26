*** Settings ***
Resource    ../resources/project.robot

*** Test Cases ***
Homepage Test
    [Tags]    smoke
    Open Browser To Homepage
    Wait Until Page Contains    Welcome to Shark Funding
    Close Browser
Hero Section Test
    [Tags]    smoke
    Open Browser To Homepage
    Click Link    xpath=//a[contains(., "Explore Now")]
    Wait Until Location Is    ${BASE_URL}${EXPLORE_PATH}
    Close Browser

Verify Project Card Details
    [Tags]    smoke
    Open Browser To Homepage
    Maximize Browser Window
    ${project_cards}=    Get WebElements    xpath=//div[contains(@class, 'project-card')]
    FOR    ${card}    IN    @{project_cards}
        Element Should Contain    ${card}    Title
        Element Should Contain    ${card}    $    # Funding amount
    END
    Close Browser

Verify View Project Navigation
    [Tags]    smoke
    Open Browser To Homepage
    Maximize Browser Window
    ${num_buttons}=    Get Length    xpath=//button[contains(@class, 'bg-orange-600') and contains(text(), 'View Project')]
    Log    Found ${num_buttons} "View Project" buttons to verify.
    FOR    ${index}    IN RANGE    4
        ${button}=    Get WebElement    xpath=(//button[contains(@class, 'bg-orange-600') and contains(text(), 'View Project')])[${index}+1]
        Click Element    ${button}
        Wait Until Page Contains Element    xpath=//h1[contains(@class, 'text-2xl font-bold')]    timeout=10s
        ${title}=    Get Text    xpath=//h1[contains(@class, 'text-2xl font-bold')]
        Log    Navigated to project with title: ${title}
        # Capture Page Screenshot
        Go Back
        Sleep    1s
    END
    Close Browser

Verify Navigation Bar
    [Tags]    regression
    Open Browser To Homepage
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//nav
    Element Should Contain    xpath=//nav    EXPLORE
    Element Should Contain    xpath=//nav    CREATE PROJECT
    Element Should Contain    xpath=//nav    SIGN IN / SIGN UP
    Close Browser
Verify Footer Content
    [Tags]    regression
    Open Browser To Homepage
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//footer
    Element Should Contain    xpath=//footer    © 2024 Shark Funding. All rights reserved.
    Close Browser