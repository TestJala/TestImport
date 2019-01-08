Feature:Start Repairs

  Scenario: Start Repairs - /api/vmUnit/startRepairs
    Given A POST request to "/api/vmUnit/startRepairs" endpoint with the following values
      | workItemId | 1 |
      | userId     | 1 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
