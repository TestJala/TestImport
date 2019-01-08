Feature:Get Photo Types

  Scenario: Get Photo Types - /api/vmSystem/getPhotoTypes
    Given A POST request to "/api/vmSystem/getPhotoTypes" endpoint with the following values
      | eventType | 1 |
    Then The response status code should be 200
    And validate response JSON is the following
      """
      {
    "photoTypes": [
        {
            "photoTypeId": 1,
            "description": "3rd Party Bill"
        },
        {
            "photoTypeId": 2,
            "description": "Invoice  / Ticket"
        },
        {
            "photoTypeId": 3,
            "description": "Payout Receipt"
        },
        {
            "photoTypeId": 4,
            "description": "Pre-Existing Damage"
        },
        {
            "photoTypeId": 5,
            "description": "Tire After"
        },
        {
            "photoTypeId": 6,
            "description": "Tire Before"
        }
    ],
    "errorMessage": "",
    "result": true
}
      """
