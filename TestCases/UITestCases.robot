*** Settings ***
Resource            ../pageObjectModel/HomePage.robot
Resource            ../pageObjectModel/BookCategoryDetailPage.robot
Resource            ../pageObjectModel/SearchResultPage.robot
Resource            ../pageObjectModel/AuthorDetailPage.robot
Resource            ../pageObjectModel/AdvancedSearchPage.robot
Resource            ../pageObjectModel/BookDetailPage.robot
Test Teardown       Close Browser

*** Test Cases ***
Advance Search for ${advance_search_page_book_title} Book and ${advance_search_page_author_name} Author
    HomePage.Open Browser
    HomePage.Tap on Submit Search button
    AdvancedSearchPage.Tap on Advanced Search Button
    AdvancedSearchPage.Enter Book title and Author's name in advanced search page
    AdvancedSearchPage.Tap on Search Button in Advanced Search Page
    AdvancedSearchPage.Tap on Author's name in search result page
    AuthorDetailPage.Sort Author's Works by Rating
    AuthorDetailPage.Check If the Sorting Works Right

Select ${desired_category} Category and Filter the Results
    HomePage.Open Browser
    HomePage.Scroll to Reach to Romance Category
    HomePage.Tap on the Romance Category
    BookCategoryDetailPage.Tap on Page Filter Options
    BookCategoryDetailPage.Filter results by year 2014
    BookCategoryDetailPage.Check if the number of results is as expected
    BookCategoryDetailPage.Sort the Result Page by Title Option
    BookCategoryDetailPage.Check if the book title is as expected

Search ${search_item} Book by ${search_option} and select ${desired_check_box_value}
    HomePage.Open Browser
    HomePage.Tap on Search Options and select title
    HomePage.Fill in the Search Box with book title
    HomePage.Tap on Submit Search button
    SearchResultPage.Select ebooks Checkbox
    SearchResultPage.Click on the third Book Title
    BookDetailPage.Check if the book title is as expected





