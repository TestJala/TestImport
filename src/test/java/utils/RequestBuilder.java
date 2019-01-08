package utils;

import client.api.Variables;
import cucumber.api.DataTable;
import org.json.simple.JSONObject;
import java.util.List;
import java.util.Map;

/**
 * Manages the Request Builder
 */
public class RequestBuilder {

    /**
     * Builds the request body replacing the values from data request table
     */
    public static JSONObject build(DataTable table) {
        JSONObject body = new JSONObject();
        body.put("apiKey", Variables.apiKey);
        for (List<String> data:table.raw()) {
            body.put(data.get(0),data.get(1));
        }
        Logger.log(body.toJSONString(),"Sending the following json");
        return body;
    }

    public static JSONObject build(Map<String, String> table) {
        JSONObject body = new JSONObject();
        body.put("apiKey", Variables.apiKey);
        for (Map.Entry<String, String> entry : table.entrySet()) {
            body.put(entry.getKey(),entry.getValue());
        }
        Logger.log(body.toJSONString(),"Sending the following json");
        return body;
    }
}
