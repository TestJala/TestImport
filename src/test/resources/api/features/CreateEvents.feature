Feature:Create Event

  Scenario Outline: Create Event - /api/vmEvent/create
    Given A POST request to "/api/vmEvent/create" endpoint with the following values
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
      | eventType             | <eventTypeId>                       |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |

    Examples:
      | typeName   | eventTypeId |
      | Tire       | 1           |
      | Towing     | 2           |
      | Mechanical | 3           |
      | Yard Check | 4           |