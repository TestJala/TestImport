Feature:Request Approval For Repair

  Scenario: Request Approval For Repair - /api/vmUnit/requestApproval
    Given A POST request to "/api/vmUnit/requestApproval" endpoint with the following values
      | customerId     | 1                                      |
      | workItemId     | 1                                      |
      | userId         | 1                                      |
      | estimatedPrice | 850.00                                 |
      | timeRequired   | 3                                      |
      | notes          | Repairs needed for doors and mud flaps |
      | parentEventId  | 4378704                                |
      | unitNo         | 123456789                              |
      | VIN            | 1HGCM82633A004352                      |
      | geoCode        | 32.910565,-97.259996                   |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |

