Feature:Save Unit Inspection

  Scenario: Save Unit Inspection - /api/vmUnit/saveInspection
    Given A POST request to "/api/vmInspection/update" endpoint with the following JSON
      """
      {
  "apiKey": "ABC1234",
  "inspectionId": "828",
  "appLocalDate": "08/21/2017 13:25:17",
  "unitNo": "123456789",
  "VIN": "1HGCM82633A004352",
  "inspectionType": "1",
  "workItemId": "1",
  "eventNo": "4341814",
  "userId": "1",
  "inspectionData": [
    {
      "fieldName": "Lights",
      "fieldValue": "Pass"
    },
    {
      "fieldName": "Mud Flaps",
      "fieldValue": "repair_needed"
    },
    {
      "fieldName": "Tires",
      "fieldValue": "Pass"
    },
    {
      "fieldName": "Doors",
      "fieldValue": "repair_needed"
    }
  ]
}
      """
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |
      | inspectionId | 828  |