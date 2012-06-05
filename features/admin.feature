Feature: Managing posts

  Scenario: Viewing list of published posts
    Given there are published posts
    When I visit the posts page
    Then I should see a list with published posts

  @markdown
  Scenario: Publishing a post
    Given there is an unpublished post
    When I visit the posts page
    And I publish the unpublished post
    Then I should see that the post has been published
