Feature:Get Work Items

  Scenario: Get Work Items - /api/vmUnit/getWorkItems
#    Given A created work item with the following values
#      | unitNo        | 123456789         |
#      | VIN           | 1HGCM82633A004352 |
#      | workItemType  | 1                 |
#      | userId        | 1                 |
#      | parentEventId |                   |
    Given A POST request to "/api/vmUnit/getWorkItems" endpoint with the following values
      | eventNo        | 4341461 |
      | unitIdentifier | V200462 |
      | customerId     | 1       |
      | userId         | 1       |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |
      #| workItems    |      |
