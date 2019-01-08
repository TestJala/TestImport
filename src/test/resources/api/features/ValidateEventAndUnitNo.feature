@Incomplete
Feature:Validate Event and Unit No

  Scenario: Validate Event and Unit No - /api/vmEvent/validate
    Given A POST request to "/api/vmEvent/validate" endpoint with the following values
      | eventNo | 4377857              |
      | unitNo  | V210050              |
      | geoCode | 32.910565,-97.259996 |
    Then The response status code should be 200
    And response includes the following in any order
      | result                  | true |
      | errorMessage            |      |
      | statusCode              | 0    |
      | Assignment              |      |
      | City                    |      |
      | CustomerID              |      |
      | CustomerName            |      |
      | CustomerMaxInvoiceLimit |      |
      | CustomerMaxRepairLimit  |      |
      | CustomerMileageRequired |      |
      | MileageRequired         |      |
      | eventProvider           |      |
      | EventNumber             |      |
      | EventType               |      |
      | EventTypeDesc           |      |
      | eventStatus             |      |
      | IsValid                 |      |
      | PointOfContact          |      |
      | PointOfContactPhone     |      |
      | RefNumber               |      |
      | NationalAccountNum      |      |
      | State                   |      |
      | Street                  |      |
      | TowLocations            |      |
      | Units                   |      |
      | Zip                     |      |
