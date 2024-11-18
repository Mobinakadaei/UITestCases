*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${drop_down_menu_locator}           span[class='sort-dropper']
${top_rated_filter_locator}         [data-ol-link-track="SearchSort|Rating"]
${expected_top_rated_work_title}    Harry Potter and the Prisoner of Azkaban
${top_rated_book_locator}           [class="booktitle"] >> nth=0

*** Keywords ***
Sort Author's Works by Rating
    Click                            ${drop_down_menu_locator}
    Click                            ${top_rated_filter_locator}

Check If the Sorting Works Right
    ${book_title}                    Get Text               ${top_rated_book_locator}
    Should Be Equal As Strings       ${book_title}          ${expected_top_rated_work_title}