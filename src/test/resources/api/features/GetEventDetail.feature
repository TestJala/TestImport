Feature:Get Event Detail

  Scenario: Get Event Detail - /api/vmEvent/getDetail
    Given A POST request to "/api/vmEvent/getDetail" endpoint with the following values
      | eventNo | 4113137              |
      | userId  | 1                    |
      | geoCode | 32.910565,-97.259996 |
    Then The response status code should be 200
    And validate response JSON is the following
    """
    {
  "result": true,
  "statusCode": 0,
  "errorMessage": "",
  "eventDetail": {
    "eventProvider": "FleetNet America",
    "eventType": "0",
    "EventTypeDesc": "",
    "InspectionId": 0,
    "eventNo": "4113137",
    "dateDue": null,
    "dateRequested": null,
    "dateCreated": null,
    "eventStatus": "",
    "customerName": "",
    "customerMaxInvoiceLimit": "0",
    "customerMaxRepairLimit": "0",
    "customerMileageRequired": false,
    "customerId": "0",
    "refNo": "",
    "NationalAccountNum": "",
    "pointOfContact": "",
    "pointOfContactPhoneNo": "",
    "assignment": "",
    "notes": null,
    "city": "",
    "state": "",
    "street": "",
    "TowLocations": [],
    "Units": [],
    "Zip": "",
    "unitType": null,
    "canCompleteEvent": "False",
    "showSummary": "False",
    "otherTechsAssigned": "False"
  }
}
    """