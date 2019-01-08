Feature:Yard Check Summary

  Scenario: Yard Check Summary - /api/vmEvent/yardCheckSummary
    Given A POST request to "/api/vmEvent/yardCheckSummary" endpoint with the following values
      | userId  | 1       |
      | eventNo | 4378704 |
    Then The response status code should be 200
    And response includes the following in any order
      | result           | true  |
      | errorMessage     |       |
      | canCompleteEvent | False |
    #|unitsChecked|null|
  #|totalHoursWorked|null|