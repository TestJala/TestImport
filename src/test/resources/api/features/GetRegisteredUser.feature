Feature:Get Registered User

  Scenario: Get Registered User - /api/vmUser/getUser
    Given A POST request to "/api/vmUser/getUser" endpoint with the following values
      | userId | 1044 |
    Then The response status code should be 200
    And response includes the following in any order
      | phoneNo             | 7044358077         |
      | userName            | JohnDoe0003        |
      | firstName           | John               |
      | lastName            | Doe                |
      | serviceProviderName | 100 SERVICE CENTER |
      | deviceId            | 123456789AAA1      |
      | serviceProviderCode | MSS8196            |
      | result              | true               |
      | errorMessage        |                    |