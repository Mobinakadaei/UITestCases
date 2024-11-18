*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${desired_check_box_value}          ebooks
${desired_check_box_locator}        id=mode-search-${desired_check_box_value}
${search_page_book_title_locator}   a[itemprop="url"] >> nth=2

*** Keywords ***
Select ebooks Checkbox
    Check Checkbox      ${desired_check_box_locator}

Click on the third Book Title
    Click               ${search_page_book_title_locator}

