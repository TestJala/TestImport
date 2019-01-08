@Incomplete
Feature:Create Work Item

  Scenario: Create Work Item - /api/vmUnit/createWorkItem
    Given A POST request to "/api/vmUnit/createWorkItem" endpoint with the following values
      | unitNo        | V200089           |
      | VIN           | 3H3V281C5HT286100 |
      | workItemType  | 1                 |
      | userId        | 1                 |
      | parentEventId | 4378641           |
    #parentEventId: Yard Check Event Id
    #XMJQH6J9WK6XMR6789
    Then The response status code should be 200
    And response includes the following in any order
      | result       | true |
      | errorMessage |      |

