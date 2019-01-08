Feature:Change Password

  Scenario: Change Password - /api/vmUser/changePassword
    Given A created user with the following values
      | deviceId            | 123456789          |
      | firstName           | John               |
      | lastName            | Doe                |
      | phoneNo             | 704-435-8077       |
      | serviceProviderName | 100 Service Center |
      | providerCode        | MSS8196            |
    And update user password with the following values
      | password            | Test123  |
      | passwordRecoveryPin | Aloha111 |
    And A POST request to "/api/vmUser/changePassword" endpoint with the following values
      | userId          | &userId  |
      | oldPassword     | Test123  |
      | newPassword     | Baseball |
      | isProviderLogin | false    |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |