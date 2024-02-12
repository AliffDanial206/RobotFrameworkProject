*** Settings ***
Documentation
Library    SeleniumLibrary

*** Variables ***
${Error_Message_Login}    css:h3[data-test='error']

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text        id:user-name        ${username}
    Input Password    id:password         ${password}
    Click Button      id:login-button

Wait Until Element Is located in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Epic sadface: Username and password do not match any user in this service