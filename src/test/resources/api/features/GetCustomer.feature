Feature:Get Customer

  Scenario: Get Customer - /api/vmCustomer/get
    Given A POST request to "/api/vmCustomer/get" endpoint with the following values
      | customerId | 1 |
    Then The response status code should be 200
    And response includes the following in any order
      | result                      | true   |
      | errorMessage                |        |
      | maxRepairCostBeforeApproval | 850.00 |
