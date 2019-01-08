@Incomplete
Feature:Get API token from FleetNet (For BGSync Only)

  Scenario: Get API token from FleetNet - /api/vmTest/getToken
    Given A POST request to "/api/vmUnit/getWorkItems" endpoint with the following values
      | workItemId | 1357 |
      | userId     | 5840 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |