Feature: Admin manages published posts

  Scenario: Viewing list of published posts
    Given there are published posts
    When I visit the admin posts page
    Then I should see a list with published posts
