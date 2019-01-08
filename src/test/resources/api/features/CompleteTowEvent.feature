Feature:Complete Tow Event

  Scenario: Complete Tow Event - /api/vmEvent/completeTowEvent
    Given A POST request to "/api/vmEvent/completeTowEvent" endpoint with the following values
      | eventNo              | 55454                              |
      | towDestination       | 100 Main St. Cherryville, NC 28021 |
      | mileageHubRead       | 87,756                             |
      | userId               | 1                                  |
      | estimatedPrice       | 300.00                             |
      | signatureBase64      | &signatureBase64                   |
      | imageType            | png                                |
      | geoCode              | 32.910565,-97.259996               |
      | notes                | Towed car to 100 Main St.          |
      | unitReadyToRoll      | False                              |
      | reasonNotReadyToRoll | Still needs another tire           |
      | eventPhotos          |                                    |
    Then The response status code should be 200
    And response includes the following in any order
      | result        | true   |
      | errorMessage  |        |
      | statusCode    | 0      |
      | dateCompleted | &TODAY |


