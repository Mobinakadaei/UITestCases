![alt text](UITestCasesResult.png)

## UI Test Automation with Robot Framework & Playwright

Before running the tests, ensure that you have the following installed:

- Python (version 3.x)
- pip (Python package manager)
- Robot Framework
- Playwright libraries for browser automation (Which is Browser Library in Robot Framework)

You can install the required libraries by running the following commands:


**Installation Guide**

Follow these steps to set up the project on your machine:

## 1. Clone the Repository:

    git clone https://github.com/Mobinakadaei/UITestCases.git
    cd UITestCases

## 2. Install Dependencies:
    pip install robotframework
    pip install robotframework-browser

## 3. Running the Tests (For UI Testing):

   ```sh
   robot UITestCases.robot
   ```

## Test Approach

The UI test cases for this project are located in the TestCases/UITestCases.robot folder and will be executed following the installation steps provided earlier. I used the Page Object Model (POM) design pattern alongside Playwright for interacting with web elements in Robot Framework. This approach structures and organizes UI tests by separating the logic for interacting with web elements from the test cases themselves, making the code more maintainable, reusable, and scalable.

Keywords for interacting with each web page's elements are organized within separate files in the pageObjectModel directory. This modular structure ensures that main keywords and variables are defined and detailed within dedicated files, while the test case files focus solely on test case definitions, without embedding logic or variables. Additionally, if any variables need to be changed, they can be modified in a single, dedicated file for each page object, simplifying updates and maintenance. This separation leads to cleaner, easier-to-read, and more manageable test scripts. (I would like to mention that at the time of testing, the top-rated book by J.K. Rowling on the website was "Harry Potter and the Prisoner of Azkaban," so I asserted that book instead of "Harry Potter and the Half-Blood Prince.")

Here's an overview of how I implemented this approach:

## 1. Page Object Model (POM) Structure
   
   Each web page in the application under test is represented by a set of keywords in a dedicated Robot Framework test file, encapsulating all relevant actions, variables, and web elements for that page. This approach enhances modularity and maintainability by centralizing code for each page in a single file, reducing duplication and simplifying updates. By separating test logic (test cases) from page interaction logic (UI elements and actions), this method ensures that UI changes only require updates to the relevant page object, leaving the test cases unaffected. It also improves test script readability, as the focus remains on the behavior being tested, and supports easier adaptation to UI changes. Additionally, keeping page-specific variables within the same file boosts reusability, making it simple to use the file with different variables for other test cases. Here is a brief description of the page structures:

   * **Home Page:**
   This Robot file contains keywords and variables for interacting with the homepage, including actions such as submitting the search form, filling in the search box, scrolling the page, and selecting a specific category.

   * **AdvancedSearch Page:**
   This Robot file contains keywords and variables for interacting with the Advanced Search page. It is triggered after clicking the search button on the homepage and selecting "Advanced Search" from the menu bar. The keywords include actions such as entering a book title or author name, clicking the submit button, and other related interactions.

   * **AuthorDetail Page:**
   This Robot file contains keywords and variables for interacting with the Author Detail Page, including actions such as sorting the author's works and verifying if the results meet the expected criteria.

   * **BookCategoryDetail Page:**
   This Robot file contains keywords and variables for interacting with the Book Category Detail Page, including actions such as filtering results by year, sorting books by title, and verifying that the results match the expected outcome.

   * **BookDetail Page:**
   This Robot file contains keywords and variables for interacting with the Book Detail Page, including an action to verify if the book title matches the expected value.

   * **SearchResult Page:**
   This Robot file contains keywords and variables for interacting with the search results page, including actions such as selecting a checkbox or clicking on a book title.


## 2. Modularized Variables

  I have centralized all variables in the keyword files instead of including them in the test case files, promoting cleaner code and better separation of concerns. This structure makes it easier to test different scenarios with varying inputs and simplifies updates when web elements change, as modifications are confined to the relevant page object. Additionally, by using variables to dynamically name my test cases, I can easily update test case names by simply changing the value of a variable, ensuring consistency and simplifying maintenance.

  * Reusability: Variables can be accessed across different classes and test files without duplication.

  * Modularization: Changing a value (like a URL or timeout) in one place updates it across the entire test suite.

  * Readability: Test scripts are more readable and maintainable since the logic and data are separated.


## 3. Testing with Robot Framework, Playwright and Python:
  For this project, I chose Python and Robot Framework due to their strengths in test automation and suitability for the project's needs. Here are the reasons behind this decision:
   
   **Why Did I Used Robot Framework:**

   * Keyword-Driven Testing: 
   Robot Framework supports a keyword-driven approach, which is highly readable and allows even non-technical stakeholders to understand test cases. This makes collaboration and test maintenance easier

   * Built-in Reporting: 
   Robot Framework generates detailed, built-in reports and logs, which helps in quick debugging and test result analysis.(I have included my test report at the beginning of this file to showcase its detailed and comprehensive nature. The report is designed to be easily understood by all team members, whether they have technical or non-technical backgrounds.)

   * Modularity: 
   Robot Framework supports the creation of reusable test libraries and keywords, which improves test organization and minimizes code duplication. Its flexibility allows seamless integration with other tools and frameworks, such as Playwright for browser automation, enhancing the overall versatility of the testing process.


   For the UI testing I used Browser Library in Robot Framework. The Browser library in Robot Framework integrates Playwright, a browser automation tool, to provide a high-level, keyword-driven interface for automating web browsers.
   
   **Why Did I Used Playwright for UI testing:**

   * Fast and Reliable Automation: 
   Playwright is designed for high-speed and stable browser automation. It handles asynchronous events, network conditions, and dynamic content well, providing reliability even with complex web applications.

   * Integration with Robot Framework: 
   Playwright integrates well with Robot Framework, which allows for a keyword-driven testing approach. By combining Playwright's powerful browser automation capabilities with Robot Framework's modular, readable syntax, I can create easy-to-maintain, reusable test cases for UI testing.
  
   * Auto-Waiting for Elements: 
   Playwright includes automatic waiting for elements to be ready before performing interactions, reducing the need for explicit waits or time delays, which improves test stability and execution speed.

   * Flexible Locator Strategies: 
   Playwright supports multiple ways to locate elements on a page (e.g., CSS selectors, XPath, text, etc.).

   **Why Did I Used Python:**

   * Extensibility: 
   Python provides a wide range of testing libraries, including powerful tools for data handling, reporting, and integration with CI/CD pipelines, making it scalable for both small and large projects.
   
   * Scalability:
   Python's flexible design allows test frameworks and scripts to scale with the needs of a project. Whether it’s a small, one-off script or a comprehensive end-to-end testing framework with hundreds of test cases, Python can easily handle the complexity.

   * Ease of Use and Readability
   Python’s simple, clean, and highly readable syntax makes it easier for teams to write, understand, and maintain test scripts. 

## My Project Test Cases:

I have added two additional test cases to this project, and I have outlined the steps below for a clearer understanding.

**TestCase1: Select Romance Category and Filter the Results**
| Steps        | Expected Result |
|-------------|-----------------|
|Open Browser and Scroll Home page to reach to Romance category and tap on that.| Romance category detail page will open.|
|Tap on filter button and choose 2014 year form that.| Only the books related to 2014 year must be appeared with a specified number (I commented out this part of my code because the number of results has changed alternatively.)| 
|Sort the page result by title.| Books must be sorted by their title in order.|


**TestCase2: Search a Book by title and select ebooks**
| Steps        | Expected Result |
|-------------|-----------------|
|Open Browser and set the search method to title.| The title method must be selected.|
|Fill in the search box with a book title and tap on search.| Search results must be displayed correctly.| 
|Tap on ebooks checkbox.| Only ebooks must be shown.|
|Click on the third book title.| Book detail page must be opened correctly.|



