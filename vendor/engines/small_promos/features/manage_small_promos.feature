@small_promos
Feature: Small Promos
  In order to have small_promos on my website
  As an administrator
  I want to manage small_promos

  Background:
    Given I am a logged in refinery user
    And I have no small_promos

  @small_promos-list @list
  Scenario: Small Promos List
   Given I have small_promos titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of small_promos
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @small_promos-valid @valid
  Scenario: Create Valid Small Promo
    When I go to the list of small_promos
    And I follow "Add New Small Promo"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 small_promo

  @small_promos-invalid @invalid
  Scenario: Create Invalid Small Promo (without title)
    When I go to the list of small_promos
    And I follow "Add New Small Promo"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 small_promos

  @small_promos-edit @edit
  Scenario: Edit Existing Small Promo
    Given I have small_promos titled "A title"
    When I go to the list of small_promos
    And I follow "Edit this small_promo" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of small_promos
    And I should not see "A title"

  @small_promos-duplicate @duplicate
  Scenario: Create Duplicate Small Promo
    Given I only have small_promos titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of small_promos
    And I follow "Add New Small Promo"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 small_promos

  @small_promos-delete @delete
  Scenario: Delete Small Promo
    Given I only have small_promos titled UniqueTitleOne
    When I go to the list of small_promos
    And I follow "Remove this small promo forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 small_promos
 