Feature: Get request test

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Verify Get Request
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies

  Scenario: Verify second Get Request
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  Scenario: Verify Third Get Request
    Given path '/users?'
    And param page = 2
    When method get
    Then status 200
    And print response

  Scenario: Verify Fourth Get Request
    Given path '/users?'
    And param page = 2
    When method get
    Then status 200
    And print response
    And assert response.data.length == 6
    And match response.data[3].name == 'mimosa'
    And match $.data[2].color == '#5A5B9F'
    And assert response.total == 12
    And match $.total_pages == 2
