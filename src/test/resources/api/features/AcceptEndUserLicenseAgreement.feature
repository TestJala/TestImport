Feature:Accept End User License Agreement

  Scenario: Accept End User License Agreement - /api/vmUser/acceptEndUserLicenseAgreement
    Given A created user with the following values
      | deviceId            | 123456789          |
      | firstName           | John               |
      | lastName            | Doe                |
      | phoneNo             | 704-435-8077       |
      | serviceProviderName | 100 Service Center |
      | providerCode        | MSS8196            |
    And A POST request to "/api/vmUser/acceptEndUserLicenseAgreement" endpoint with the following values
      | userId       | &userId |
      | eulaAccepted | True    |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |