Feature:Create Repair

  Scenario: Create Repair - /api/vmUnit/createRepair
    Given A POST request to "/api/vmUnit/createRepair" endpoint with the following JSON
    """
    {
  "apiKey": "ABC1234",
  "repairDescription": "Tire",
  "repairType": "1",
  "estimatedCompletionDate": "05/02/2017",
  "hoursToComplete": "2.0",
  "appLocalDate": "08/21/2017 13:25:17",
  "unitNo": "123456789",
  "VIN": "1HGCM82633A004352",
  "userId": "1",
  "workItemId": "1",
  "reasonUnableToRepair": "",
  "notes": "",
  "canRepair": "True",
  "repairData": [
    {
      "fieldName": "Position",
      "fieldValue": "Back"
    },
    {
      "fieldName": "Mileage/Hub Read",
      "fieldValue": "20.5"
    },
    {
      "fieldName": "DR",
      "fieldValue": "889"
    },
    {
      "fieldName": "Notes",
      "fieldValue": "Tread is wore out"
    }
  ]
}
    """
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | statusCode   | 0    |
      | errorMessage |      |
