*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${url}                              https://openlibrary.org/
${headless_status}                  ${False}
${search_button_locator}            [class="search-bar-submit"]
${desired_category}                 Romance
${homepage_book_category}           text=${desired_category} >> nth=0
${search_options_locator}           [class=search-facet]
${search_options_list_locator}      [aria-label="Search by"]
${search_option}                    title
${search_item}                      game of thrones
${search_box_locator}               [placeholder="Search"]

*** Keywords ***
Open Browser
    New Browser                 headless=${headless_status}
    New Page                    ${url}
    Set Viewport Size           1512        823

Tap on Submit Search button
    Click                       ${search_button_locator}

Scroll to Reach to Romance Category
    Scroll To Element           ${homepage_book_category}

Tap on the Romance Category
    Click                       ${homepage_book_category}

Tap on Search Options and select title
    Click                       ${search_options_locator}
    Select Options By           ${search_options_list_locator}    value  ${search_option}

Fill in the Search Box with book title
    Fill Text                   ${search_box_locator}             ${search_item}