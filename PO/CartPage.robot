*** Settings ***
Documentation
Library    SeleniumLibrary

*** Keywords ***
Set Filter Dropdown and take screenshot
    Select From List By Label    css:.product_sort_container    Price (low to high)
    Capture Page Screenshot
