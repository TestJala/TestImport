Feature:Complete Mechanical Event

  Scenario: Complete Mechanical Event - /api/vmEvent/completeMechanicalEvent
    Given A POST request to "/api/vmEvent/completeMechanicalEvent" endpoint with the following values
      | eventNo              | 4373081                  |
      | cause                | Test                     |
      | correction           | true                     |
      | mileageHubRead       | 81,276                   |
      | userId               | 1                        |
      | notes                | Replaced left front tire |
      | estimatedPrice       | 200.00                   |
      | signatureBase64      | &signatureBase64         |
      | imageType            | png                      |
      | geoCode              | 32.910565,-97.259996     |
      | unitReadyToRoll      | false                    |
      | reasonNotReadyToRoll | Still needs another tire |
      | eventPhotos          |                          |
    Then The response status code should be 200
    And response includes the following in any order
      | result        | true   |
      | errorMessage  |        |
      | statusCode    | 0      |
      | dateCompleted | &TODAY |
