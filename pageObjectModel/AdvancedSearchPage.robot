*** Settings ***
Library             Browser         timeout=20000

*** Variables ***
${advanced_search_button_locator}                   a[data-ol-link-track="SearchNav|SearchAdvanced"]
${advanced_search_page_title_locator}               input[name="title"]
${advanced_search_page_search_button_locator}       button[type="submit"]
${advanced_search_page_author_locator}              input[name="author"]
${author_link_locator}                              a[href="/authors/OL23919A/J._K._Rowling"] >> nth=0
${advance_search_page_book_title}                   Harry Potter
${advance_search_page_author_name}                  Rowling

*** Keywords ***
Tap on Advanced Search Button
    Click               ${advanced_search_button_locator}

Enter Book title and Author's name in advanced search page
    Fill Text           ${advanced_search_page_title_locator}            ${advance_search_page_book_title}
    Fill Text           ${advanced_search_page_author_locator}           ${advance_search_page_author_name}

Tap on Search Button in Advanced Search Page
    Click               ${advanced_search_page_search_button_locator}

Tap on Author's name in search result page
    Click               ${author_link_locator}
