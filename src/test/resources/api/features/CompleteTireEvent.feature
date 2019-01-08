@Incomplete
Feature:Complete Tire Event

  Scenario: Complete Tire Event - /api/vmEvent/completeTireEvent
    Given A POST request to "/api/vmEvent/completeTireEvent" endpoint with the following values
      | eventNo              | 4341098                  |
      | position             | Left                     |
      | dotOff               | 56                       |
      | dotOn                | 65                       |
      | mileageHubRead       | 81,276                   |
      | drNo                 | 56                       |
      | reasonForFailure     | Old Tire                 |
      | notes                | Replaced left front tire |
      | unitReadyToRoll      | False                    |
      | reasonNotReadyToRoll | Still needs another tire |
      | userId               | 1                        |
      | estimatedPrice       | 200.00                   |
      | signatureBase64      | &signatureBase64         |
      | imageType            | png                      |
      | geoCode              | 32.910565,-97.259996     |
      | nationalAccountNo    | 12345                    |
      | eventPhotos          |                          |
    Then The response status code should be 200
    And response includes the following in any order
      | result        | true   |
      | errorMessage  |        |
      | statusCode    | 0      |
      | dateCompleted | &TODAY |