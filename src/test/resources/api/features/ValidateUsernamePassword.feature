Feature:Validate Username/Password
##typo in method name
  Scenario: Validate Username/Password - /api/vmRegistration/validateUser
    Given A POST request to "/api/vmUser/validateUser" endpoint with the following values
      | username         | ChadDalton0001                       |
      | password         | Base                                 |
      | deviceId         | 6BF2F80F-128E-477A-890B-B97B1DC751F0 |
      | mobileAppVersion | 2017.02.23                           |
      | make             | Apple                                |
      | model            | iPhone 6                             |
      | os               | IOS                                  |
    Then The response status code should be 200
    And response includes the following in any order
      | result           | true                |
      | errorMessage     |                     |
      | userId           | 5587                |
      | eulaAccepted     | true                |
      | eulaAcceptedDate | 2/7/2018 8:42:17 PM |