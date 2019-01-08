Feature:Create/Register User

  Scenario: Create/Register User - /api/vmRegistration/createUser
    Given A POST request to "/api/vmRegistration/createUser" endpoint with the following values
      | deviceId            | 123456789          |
      | firstName           | John               |
      | lastName            | Doe                |
      | phoneNo             | 704-435-8077       |
      | serviceProviderName | 100 Service Center |
      | providerCode        | MSS8196            |
    Then The response status code should be 200
    And response includes the following in any order
#      | userName     | JohnDoe00059 | These values are incremented
#      | userId       | 6167         |
      | result       | true         |
      | statusCode   | 0            |
      | errorMessage |              |