Feature:Get Event Next Status

  Scenario Outline: Get Event Next Status - /api/vmEvent/getNextStatus
    Given A POST request to "/api/vmEvent/getNextStatus" endpoint with the following values
      | eventNo | <id> |
      | userId  | 1    |
    Then The response status code should be 200
    And response includes the following in any order
      | result        | true  |
      | errorMessage  |       |
      | currentStatus |       |
      | nextStatus    |       |
      | canPause      | false |

    Examples:
      | id      |
      | 4339267 |
