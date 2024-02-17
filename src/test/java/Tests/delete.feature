Feature: Delete API Tests

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Delete API Test one
    Given path '/users/2'
    When method DELETE
    Then status 204
    And print response
