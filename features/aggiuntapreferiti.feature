Feature: Add a service to favorites
    As a registered user
    I want to add a service to favorites
    So that i can find it in my favorite list
Scenario: Adding a service to favorite
    Given i am on a service with id 7 with the purpose of adding it to favorites
    When i click into aggiunti ai preferiti
    Then i should see the service with id 7 into the service list
