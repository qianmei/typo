Feature: merge articles
  As an admin
  In order to minimise the number of articles on the same topic
  I want to be able to merge articles together

  Background:
    Given the blog is set up
    Given the following users exist:
        | profile_id | login | name  | password  | email          | state  |
        | 1          | amy   | Amy   | amy123    | amy@gmail.com  | active |
        | 2          | kate  | Kate  | kate567   | kate@gmail.com | active |

    Given the following articles exist:
        | id | title  | author  | user_id | body   | allow_comments | published | state     | type    |
        | 3  | part1  | Amy     | 2       | hello  | true           | true      | published | Article |
        | 4  | part2  | Kate    | 3       | bye    | true           | true      | published | Article |

    Given the following comments exist:
        | id | type    | author | body     | article_id | user_id |
        | 5  | Comment | Amy    | good     | 3          | 1       |
        | 6  | Comment | Amy    | bad      | 4          | 1       |



    Scenario: non-admin person cannot merge articles
        When I login as a non-admin user
        Then I should not see "Merge Articles"


    Scenario: merge two articles
        Given I merge "3" with "4"
		And I am on the home page
		When I follow "part1"
		Then I should see "hello"
		And I should see "bye"
		And I should see "good"
    	And I should see "bad"

