@homepage_slides
Feature: Homepage Slides
  In order to have homepage_slides on my website
  As an administrator
  I want to manage homepage_slides

  Background:
    Given I am a logged in refinery user
    And I have no homepage_slides

  @homepage_slides-list @list
  Scenario: Homepage Slides List
   Given I have homepage_slides titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of homepage_slides
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @homepage_slides-valid @valid
  Scenario: Create Valid Homepage Slide
    When I go to the list of homepage_slides
    And I follow "Add New Homepage Slide"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 homepage_slide

  @homepage_slides-invalid @invalid
  Scenario: Create Invalid Homepage Slide (without title)
    When I go to the list of homepage_slides
    And I follow "Add New Homepage Slide"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 homepage_slides

  @homepage_slides-edit @edit
  Scenario: Edit Existing Homepage Slide
    Given I have homepage_slides titled "A title"
    When I go to the list of homepage_slides
    And I follow "Edit this homepage_slide" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of homepage_slides
    And I should not see "A title"

  @homepage_slides-duplicate @duplicate
  Scenario: Create Duplicate Homepage Slide
    Given I only have homepage_slides titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of homepage_slides
    And I follow "Add New Homepage Slide"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 homepage_slides

  @homepage_slides-delete @delete
  Scenario: Delete Homepage Slide
    Given I only have homepage_slides titled UniqueTitleOne
    When I go to the list of homepage_slides
    And I follow "Remove this homepage slide forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 homepage_slides
 