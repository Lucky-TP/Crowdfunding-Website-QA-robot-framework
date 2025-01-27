*** Settings ***
Resource    ../resources/project.robot
Library     Collections

*** Variables ***
${VALID_SEARCH_QUERY}    Dragon

*** Test Cases ***
Search Test
    [Tags]    smoke
    Open Browser To Explore Page
    Input Text    xpath=//input[@placeholder="Explore projects"]    ${VALID_SEARCH_QUERY}
    Press Keys    xpath=//input[@placeholder="Explore projects"]    ENTER
    Sleep    4s
    Wait Until Page Contains    ${VALID_SEARCH_QUERY}
    Close Browser

*** Test Cases ***
Search Test API With Valid Query
    [Tags]    API
    Create Session    search_session    ${API_URL}
    ${query_params}=    Create Dictionary    search=${VALID_SEARCH_QUERY}
    ${response}=    GET On Session    search_session    ${API_SEARCH_PATH}    params=${query_params}
    Should Be Equal As Numbers    ${response.status_code}    200

    ${response_json}=    Set Variable    ${response.json()}
    Log    Response JSON: ${response_json}


    ${message}=    Get From Dictionary    ${response_json}    message
    Should Be Equal As Strings    ${message}    Retrieved all project by categories successful


    ${data}=    Get From Dictionary    ${response_json}    data
    ${project}=    Get From List    ${data}    0
    ${project_name}=    Get From Dictionary    ${project}    name
    Should Be Equal As Strings    ${project_name}    Dragons of the Dwindling