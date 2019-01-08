Feature:Hold Repairs

  Scenario: Hold Repairs - /api/vmUnit/holdRepairs
    Given A POST request to "/api/vmUnit/holdRepairs" endpoint with the following values
      | workItemId | 1 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |