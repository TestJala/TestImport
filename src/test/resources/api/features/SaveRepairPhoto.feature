Feature:Save Repair Photo

  Scenario: Save Repair Photo - /api/vmUnit/saveRepairPhoto
    Given A POST request to "/api/vmUnit/saveRepairPhoto" endpoint with the following values
      | repairId    | 1            |
      | photoTypeId | 3            |
      | userId      | 1            |
      | base64Image | &base64Image |
      | imageType   | png          |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | statusCode   | 0    |
      | errorMessage |      |