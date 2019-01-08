Feature:Get Service Provider Events (For Portal Only)

  Scenario Outline: Get Service Provider Events - /api/vmEvent/getServiceProviderEvents
    Given A POST request to "/api/vmEvent/getServiceProviderEvents" endpoint with the following values
      | vendorCode       | <code>        |
      | fromDate         | 08/01/2017 |
      | toDate           | 08/31/2017 |
      | EventNumber      | 0          |
      | EventType        | 0          |
      | IncludeCompleted | False      |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |
#|events|null|

  Examples:
    |code|
    |CAW6349|
