Feature:Can Pause Event

  Scenario: Can Pause Event - /api/vmEvent/canPause
    Given A created event with the following values
      | address               | 100 Main St.                        |
      | city                  | Cherryville                         |
      | state                 | NC                                  |
      | zip                   | 28021                               |
      | pointOfContact        | Jim Allen                           |
      | pointOfContactPhoneNo | 704-111-2222                        |
      | assignment            | Customer has requested a yard check |
      | additionalInformation | Gate Passcode: 1234                 |
      | unitNo                |                                     |
      | vin                   |                                     |
      | customerId            | 1                                   |
      | eventType             | 4                                   |
    And A POST request to "/api/vmEvent/canPause" endpoint with the following values
      | eventNo | &eventNo |
      | userId  | 1        |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true  |
      | errorMessage |       |
      | canPause     | false |
