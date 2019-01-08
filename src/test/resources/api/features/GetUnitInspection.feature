Feature:Get Unit Inspection

  Scenario: Get Unit Inspection - /api/vmUnit/getInspectionData
    Given A POST request to "/api/vmInspection/get" endpoint with the following values
      | inspectionId | 1 |
    Then The response status code should be 200
    And validate response JSON is the following
    """
    {
  "result": true,
  "errorMessage": null,
  "inspectionId": 1,
  "inspectionDataFields": [
    {
      "fieldName": "Doors",
      "fieldValue": "repair_needed"
    },
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
    }
  ]
}
    """