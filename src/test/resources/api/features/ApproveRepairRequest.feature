Feature:Approve Repair Request (For FleetNet Only)

  Scenario: Approve Repair Request - /api/vmUnit/approveRepair
    Given A POST request to "/api/vmUnit/approveRepair" endpoint with the following values
      | repairId          | 1 |
      | eventId           | 1 |
      | nationalAccountNo |   |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |

