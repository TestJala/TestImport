@Incomplete
Feature:Validate Unit

  Scenario: Validate Unit - /api/vmUnit/validate
    Given A POST request to "/api/vmUnit/validate" endpoint with the following values
      | eventNo        | 4377857 |
      | unitIdentifier | V210050 |
      | userId         | 1       |
      | customerId     | 1       |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |
      | unitNo       |      |
      | VIN          |      |
      | workItems    |      |