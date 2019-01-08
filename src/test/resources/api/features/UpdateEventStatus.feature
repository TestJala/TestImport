Feature:Update Event Status

  Scenario Outline: Update Event Status - /api/vmEvent/updateStatus
    Given A POST request to "/api/vmEvent/updateStatus" endpoint with the following values
      | eventNo | <eventNo>            |
      | userId  | 1                    |
      | geoCode | 32.910565,-97.259996 |
    Then The response status code should be 200
    And response includes the following in any order
      | result       | <result>     |
      | statusCode   | <statusCode> |
      | errorMessage | <message>    |
      #| currentStatus | null     |
      #| nextStatus    | null     |

    Examples:
      | eventNo | result | statusCode | message                                              |
      | 4341098 | false  | 901        | Event is already being worked by another technician. |