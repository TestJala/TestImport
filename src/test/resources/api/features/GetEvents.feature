@Incomplete
Feature:Get Events

  Scenario: Get Events - /api/vmEvent/getOpenEvents
    Given A POST request to "/api/vmEvent/getOpenEvents" endpoint with the following values
      | vendorId | MSS8196              |
      | userId   | 1                    |
      | geoCode  | 32.910565,-97.259996 |
    Then The response status code should be 200
    And response includes the following in any order
      | result            | true |
      | errorMessage      | null |
      | statusCode        | 0    |
      | openEvents        | null |
      | scheduledMessages | null |
      | waitTimeEvent     | 0    |