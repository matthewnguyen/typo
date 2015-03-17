Feature: Merge Articles
  As a blog administrator
  So that I can consolidate articles of the same topic
  I want to be able to merge two articles together

  Background: Articles have been added to the blog
	Given the blog is set up
	And the publisher user exists
	And the following articles exist:
	  | title                   | author        | body              |
	  | admin article 1         | admin         | merge me with 2!  |
	  | admin article 2 		| admin 	    | merge me with 1!  |
	  | publisher article 1	    | publisher   	| pubs cant merge!  |
	  | publisher article 2     | publisher     | pubs cant merge!  |

  Scenario: Merge Option Shown for Admin
    When I am logged into the admin panel
    And I go to the admin content page
    Then I should see "Manage Articles"
    And I am editing the article titled "admin article 1"
    Then I should see "Merge Articles"
    When I fill in "Article ID" with ""

  Scenario: Merge Option Not Shown for New Article Page
  	Given I am logged into the admin panel
  	And I am on the new article page
  	Then I should not see "Merge Articles"

  Scenario: Merge Option Not Shown for Non Admin User
  	And I am logged into the publisher panel
  	And I am editing the article titled "publisher article 1"
  	Then I should not see "Merge Articles"


