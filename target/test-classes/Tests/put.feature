Feature: put api test

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def body = 'putRequest.json'
    * def expectedResponse = read("response1.json")

  Scenario: PUT API test one
    Given path '/users/2'
    And request body
    When method PUT
    Then status 200
    And print response
    And match response == expectedResponse
    And match $ == expectedResponse
