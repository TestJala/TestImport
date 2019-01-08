Feature:Complete Repair

  Scenario: Complete Repair - /api/vmUnit/completeRepair
    Given A POST request to "/api/vmUnit/completeRepair" endpoint with the following JSON
    """
{
  "apiKey": "ABC1234",
  "repairId": "9",
  "appLocalDate": "08/21/2017 13:25:17",
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
      "fieldName": "DOT Off",
      "fieldValue": "abc"
    },
    {
      "fieldName": "DOT On",
      "fieldValue": "def"
    },
    {
      "fieldName": "Reason For Failure",
      "fieldValue": "Tread Wore Out"
    },
    {
      "fieldName": "Notes",
      "fieldValue": "Replaced tire"
    }
  ]
}
"""
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
