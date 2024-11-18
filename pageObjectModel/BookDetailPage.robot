*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${book_detail_page_title_locator}           [class=work-title] >> nth=0
${book_detail_page_expected_title}          Game of Thrones A-Z

*** Keywords ***
Check if the book title is as expected
    ${book_title}                   Get Text                                ${book_detail_page_title_locator}
    Should Be Equal As Strings      ${book_detail_page_expected_title}      ${book_title}
