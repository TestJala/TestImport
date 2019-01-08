Feature:Start Work Item

  Scenario: Start Work Item - /api/vmUnit/startWorkItem
    Given A POST request to "/api/vmUnit/startWorkItem" endpoint with the following values
      | userId     | 1       |
      | eventNo    | 4377540 |
      | workItemId | 2       |
      | unitNo     | v501481 |
      | customerId | 1       |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true                   |
      | errorMessage |                        |
      | statusCode   | 0                      |
      | dateStarted  | 10/16/2017 11:02:59 AM |
