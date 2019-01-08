Feature:Complete Work Item

  Scenario: Get Total Repairs Completed - /api/vmUnit/completeWorkItem
    Given A POST request to "/api/vmUnit/completeWorkItem" endpoint with the following values
      | unitNo               | 123456789                |
      | VIN                  | 1HGCM82633A004352        |
      | workItemId           | 1                        |
      | signatureBase64      | &signatureBase64         |
      | signatureImageType   | png                      |
      | userId               | 1                        |
      | unitReadyToRoll      | False                    |
      | reasonNotReadyToRoll | Still needs another tire |
      | inspectionStatus     | False                    |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | statusCode   | 0    |
      | errorMessage |      |
