Feature:User Logout

  Scenario: User Logout - /api/vmUser/userLogout
    Given A POST request to "/api/vmUser/userLogout" endpoint with the following values
      | deviceId | 6BF2F80F-128E-477A-890B-B97B1DC751F0 |
      | userId   | 5587                                 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |

