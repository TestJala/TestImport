Feature:Get App Start View Object

  Scenario Outline: Get App Start View Object - /api/vmStart/getStartView
    Given A POST request to "/api/vmStart/getStartView" endpoint with the following values
      | deviceId   | 123456789            |
      | deviceType | <device>             |
      | geoCode    | 32.910565,-97.259996 |
    Then The response status code should be 200
    And response includes the following in any order
      | viewId                     | 3     |
      | serviceProviderCode        | 0     |
      | firstName                  |       |
      | lastName                   |       |
      | serviceProviderName        |       |
      | photoUploadLimitToWiFiOnly | false |
      | userId                     | 0     |
      | result                     | True  |
      | errorMessage               |       |

    Examples:
      | device  |
      | iPhone  |
      | Android |