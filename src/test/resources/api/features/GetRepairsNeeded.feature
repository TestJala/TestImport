Feature:Get Repairs Needed

  Scenario: Get Repairs Needed - /api/vmUnit/getRepairsNeeded
    Given A POST request to "/api/vmUnit/getRepairsNeeded" endpoint with the following values
      | workItemId | 2 |
      | userId     | 1 |
    Then The response status code should be 200
    And validate response JSON is the following
    """
    {
  "result": true,
  "errorMessage": "",
  "repairsNeeded": [
    {
      "repairId": "1463",
      "repairDescription": "Tire",
      "repairType": "1",
      "estimatedCompletionDate": "08/21/2017",
      "createdDate": "08/21/2017",
      "unitNo": "123456789",
      "VIN": "1HGCM82633A004352",
      "userId": "1",
      "workItemId": "2",
      "approved": false,
      "nationalAccountNo": null,
      "repairData": [
        {
          "fieldName": "DR",
          "fieldValue": "889"
        },
        {
          "fieldName": "Mileage/Hub Read",
          "fieldValue": "20.5"
        },
        {
          "fieldName": "Notes",
          "fieldValue": "Tread is wore out"
        },
        {
          "fieldName": "Position",
          "fieldValue": "Back"
        }
      ]
    }
  ]
}
    """
