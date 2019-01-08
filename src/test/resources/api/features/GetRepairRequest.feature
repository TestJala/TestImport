Feature:Get Repair Request

  Scenario: Get Repair Request - /api/vmUnit/getRepairRequests
    Given A POST request to "/api/vmUnit/getRepairRequests" endpoint with the following values
      | parentEventId | 1 |
      | userId        | 1 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |

