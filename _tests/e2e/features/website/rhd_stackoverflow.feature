Feature: Stack Overflow - DEVELOPER-3035

  Scenario: Results should be displayed with Votes, answers and views section
    Given I am on the Stack Overflow page
    Then I should see a list of "10" results
    And each results should contain an activity summary:
      | Votes   |
      | Answers |
      | Views   |

  Scenario: Results should contain summary of question that links to the question page on Stack Overflow
    Given I am on the Stack Overflow page
    Then I should see a list of "10" results
    And each question should contain a question summary
    And each question should link to the relevant question on Stack Overflow

  Scenario: Results should contain a 'Latest answer' section that links to the specific answer on Stack Overflow.
    Given I am on the Stack Overflow page
    When a question contains an answer
    Then I should see a answer section
    And a "Read full question at Stack Overflow" link that links to that question on Stack Overflow in a new window

  Scenario: When a result does not contain a 'Latest answer' it should not contain a 'Latest Answer' section.
    Given I am on the Stack Overflow page
    When a question does not contain an answer
    Then I should not see a answer section

  Scenario: Results should contain a "Started link" and the author of question.
    Given I am on the Stack Overflow page
    Then I should see a list of "10" results
    And each question should display how long ago the question was asked

  Scenario: When a user selects a product from the products filter the results are updated containing questions relating to that product.
    Given I am on the Stack Overflow page
    Then I should see a list of "10" results
    When I select "Red Hat Enterprise Linux" from the products filter
    Then the results should be updated containing questions relating to "rhel"

  Scenario Outline: User can select number of results per page
    Given I am on the Stack Overflow page
    Then I should see a list of "10" results
    When I select to show "<filter>" results per page
    Then I should see a list of "<filter>" results

    Examples:
      | filter |
      | 25     |
      | 50     |
      | 100    |

