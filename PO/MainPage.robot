*** Settings ***
Documentation
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Verify card titles in the page
    @{expectedList} =    Create List    Sauce Labs Backpack    Sauce Labs Bike Light    Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${elements} =    Get WebElements    css:.inventory_item_name
    @{actualList}=    Create List
    FOR    ${element}    IN    @{elements}
        Append To List    ${actualList}    ${element.text}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}

Select the card
    Click Button    id:add-to-cart-sauce-labs-fleece-jacket

Check the Cart
    Click Element    css:.shopping_cart_link
    Element Text Should Be    css:.inventory_item_name    Sauce Labs Fleece Jacket

Checkout the Item
    Click Button    id:checkout
    Sleep    5
    Input Text    id:first-name    Aliff
    Input Text    id:last-name    Danial
    Input Text    id:postal-code    12345
    Click Button    id:continue
    Element Text Should Be    css:.inventory_item_name    Sauce Labs Fleece Jacket
    Click Button    id:finish
    Element Text Should Be    //h2    Thank you for your order!