Feature: POST request

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedResponse = read("response.json")
    * def body = read("request.json")
    * def schema = read("schema.json")

  Scenario: sample post request one
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201

  Scenario: sample post request twp
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201

  Scenario: sample post request three
    Given path '/users'
    And request body
    When method POST
    Then status 201
    And print response
    And print responseHeaders
    And print responseCookies
    And print responseTime

  Scenario: sample post request four
    Given path '/users'
    And request {"name": "Deepak","job": "SDET"}
    When method POST
    Then status 201
    And print response
    And match response.name == 'Deepak'
    And match $.job == 'SDET'
    And match response == {"name": "Deepak","job": "SDET","id": "#string","createdAt": "#ignore"}

  Scenario: sample post request five
    Given path '/users'
    And request body
    When method POST
    Then status 201
    And print body
    And print response
    And print schema
    And match response == expectedResponse
    #And match response == schema
