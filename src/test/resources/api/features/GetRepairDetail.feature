Feature:Create Repair

  Scenario: Create Repair - /api/vmUnit/getRepair
    Given A created repair with the following values
      | repairDescription       | Tire                |
      | repairType              | 1                   |
      | estimatedCompletionDate | 05/02/2017          |
      | hoursToComplete         | 2.0                 |
      | appLocalDate            | 08/21/2017 13:25:17 |
      | unitNo                  | 123456789           |
      | VIN                     | 1HGCM82633A004352   |
      | userId                  | 1                   |
      | workItemId              | 1                   |
      | reasonUnableToRepair    |                     |
      | notes                   |                     |
      | canRepair               | True                |
      | repairData              |                     |
    And A POST request to "/api/vmUnit/getRepair" endpoint with the following values
      | repairId | &repairId |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
