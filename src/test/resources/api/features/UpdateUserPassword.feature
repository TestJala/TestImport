Feature:Update User Password

  Scenario: Update User Password - /api/vmRegistration/updatePassword
    Given A POST request to "/api/vmRegistration/updatePassword" endpoint with the following values
      | userId              | 1044     |
      | password            | Test123  |
      | passwordRecoveryPin | Aloha111 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |