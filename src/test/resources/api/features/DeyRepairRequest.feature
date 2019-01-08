Feature:Deny Repair Request (For FleetNet Only)

  Scenario: Deny Repair Request - /api/vmUnit/denyRepair
    Given A POST request to "/api/vmUnit/denyRepair" endpoint with the following values
      | repairId | 1 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
