*** Settings ***
Documentation
Library        SeleniumLibrary
Library    Collections

*** Variables ***
${CHROMEDRIVER_PATH}    /home/aliff/Documents/chromedriver/chromedriver
${username}             standard_user
${invalid-password}     secret_sauc
${valid-password}       secret_sauce
${url}                  https://www.saucedemo.com/
${browser_name}         Chrome


*** Keywords ***
Open the Browser with the Swag Labs Text
    Open Browser    ${url}   ${browser_name}    executable_path=${CHROMEDRIVER_PATH}
    Maximize Browser Window

Close Browser Session
    Close Browser