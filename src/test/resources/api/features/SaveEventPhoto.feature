Feature:Save Event Photo

  Scenario: Save Event Photo - /api/vmEvent/saveEventPhoto
    Given A POST request to "/api/vmEvent/saveEventPhoto" endpoint with the following values
      | eventNo     | 777          |
      | userId      | 1            |
      | base64Image | &base64Image |
      | imageType   | png          |
      | photoTypeId | 3            |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |
      | statusCode   | 0    |
