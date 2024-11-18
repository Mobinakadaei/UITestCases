*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${page_filter_locator}             span[class="collapser-icon"]
${desired_filter_year}             2014
${filter_by_year_locator}          id=year:${desired_filter_year}-show-only
${result_number_locator}           id=big-results-count
${expected_result_number}          398
${desired_sort_option}             Title
${sort_by_relevance_locator}       [data-title=${desired_sort_option}]
${resulted_book_title_locator}     id=title >> nth=0
${expected_book_title}             100 prompts for romance writers

*** Keywords ***
Tap on Page Filter Options
    Click    ${page_filter_locator}

Filter results by year 2014
    Check Checkbox                          ${filter_by_year_locator}

Check if the number of results is as expected
    ${book_number}                          Get Text                ${result_number_locator}
    Then Should Be Equal As Strings         ${book_number}          ${expected_result_number}

Sort the Result Page by Title Option
    Click                                   ${sort_by_relevance_locator}

Check if the book title is as expected
    ${book_title}                           Get Text                ${resulted_book_title_locator}
    Should Be Equal As Strings              ${expected_book_title}  ${book_title}
