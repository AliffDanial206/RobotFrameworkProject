*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PO/Generic.robot
Resource    ../PO/LoginPage.robot
Resource    ../PO/MainPage.robot
Resource    ../PO/CartPage.robot
Test Setup    Open the Browser with the Swag Labs Text
Test Teardown    Close Browser Session

*** Variables ***
${Error_Message_Login}    css:h3[data-test='error']
${Web_Page_Load}          css:.shopping_cart_link

*** Test Cases ***
Validate Unsuccesfull Login  
    LoginPage.Fill the login form    ${username}    ${invalid-password}
    Wait Until Element Is located in the page    ${Error_Message_Login}
    Verify error message is correct

Validate Succesfull Login
    LoginPage.Fill the login form    ${username}    ${valid-password}
    Wait Until Element Is located in the page    ${Web_Page_Load}
    
Add Item to Cart
    LoginPage.Fill the login form    ${username}    ${valid-password}
    Verify card titles in the page
    Select the card
    Check the Cart
    Checkout the Item

Set Filter
    LoginPage.Fill the login form    ${username}    ${valid-password}
    Set Filter Dropdown and take screenshot

