Feature:Get Total Repairs Completed

  Scenario: Get Total Repairs Completed - /api/vmUnit/getTotalRepairsCompleted
    Given A POST request to "/api/vmUnit/getTotalRepairsCompleted" endpoint with the following values
      | workItemId | 1357 |
      | userId     | 5840 |
    Then The response status code should be 200
    And response includes the following in any order
      | result           | true |
      | repairsCompleted | 1    |
      | errorMessage     |      |