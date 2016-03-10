Feature: Work with categories
  As an admin
  In order to handle the posts
  I want to be able to edit posts
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: show the category page
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the Categories page
    And I should see "Title"
    And I should see "Categories"
    And I should see "Keywords"
    And I should see "Permalink"
    And I should see "Description"
    When I fill in "Name" with "Beautiful World"
    And I fill in "Description" with "I like it"
    And I press "Save"
    And I should see "Beautiful World"
    
  Scenario: edit categories
    Given I am on the Categories page
    When I follow "Edit"
    And I fill in "Description" with "I don't like it"
    And I press "Save"
    Then I should see "I don't like it"
