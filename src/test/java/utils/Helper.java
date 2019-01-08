package utils;

import client.api.Variables;
import cucumber.api.DataTable;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.testng.Assert;

import java.lang.reflect.Field;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * Class containing Helper Steps.
 */
public class Helper {

    private Map<String, String> storageMap;
    private Response response;
    private User user = User.getUser();
    private Event event=Event.getEvent();
    private WorkItem workItem=WorkItem.getWorkItem();
    private Repair repair=Repair.getRepair();
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
    private String request;
    private String endpoint;


    public Helper() {
        storageMap = new HashMap<>();
    }

    /**
     * Sets the response object.
     *
     * @param response response object.
     */
    public void setResponse(final Response response) {
        this.response = response;
    }

    /**
     * Gets the response object.
     *
     * @return response object.
     */
    public Response getResponse() {
        return response;
    }

    public void putInStorageMap(final String key, final String value) {
        storageMap.put(key, value);
    }

    public String getFromStorageMap(final String key) {
        return storageMap.get(key);
    }

    public Map<String, String> getStorageMap() {
        return storageMap;
    }

    public void validateResponseBody(DataTable table){
        JsonPath jsonPathEvaluator = response.jsonPath();
        for (List<String> data:table.raw()) {
            String ExpectedField = data.get(0);
            String ExpectedValue = data.get(1);
            if(ExpectedValue.startsWith("&userId"))ExpectedValue=user.getUserField("userId");
            if(ExpectedValue.startsWith("&username"))ExpectedValue=user.getUserField("userName");
            if(ExpectedValue.startsWith("&TODAY"))ExpectedValue=now.format(formatter);
            String errorMessage = "\n Resquest to: "+endpoint+"\n with the following body \n" +request+ "\n Response Json Body: \n" + response.body().prettyPrint()+ "\n";

            if (ExpectedValue.startsWith("null")) {
                Assert.assertNull(jsonPathEvaluator.get(ExpectedField));
            } else {
                String field =  jsonPathEvaluator.get(ExpectedField).toString();
                Assert.assertTrue(field.equalsIgnoreCase(ExpectedValue), errorMessage);
            }
        }
    }

    public void setUser(DataTable requestData) {
        for (List<String> data:requestData.raw()) {
            String Field = data.get(0);
            String Value = data.get(1);
            user.setUserField(Field,Value);
        }
    }

    @Deprecated
    public Map<String, String> AddUserIdToTable(Map<String, String> requestData) {
        Map table=new HashMap();
        table.put("userId",user.getUserField("userId"));
        for (Map.Entry<String, String> entry : requestData.entrySet()) {
            table.put(entry.getKey(),entry.getValue());
        }
        return table;
    }

    public void setUserIdUsername(Response result) {
        JsonPath jsonPathEvaluator = result.jsonPath();
        user.setUserField("userId",jsonPathEvaluator.get("userId").toString());
        user.setUserField("userName",jsonPathEvaluator.get("userName").toString());
    }

    public void setUserPasswordAndPin(Map<String, String> requestData) {
        user.setUserField("password",requestData.get("password"));
        user.setUserField("passwordRecoveryPin",requestData.get("passwordRecoveryPin"));
    }

    public Map<String,String> evaluateFields(Map<String, String> requestData){
        Map<String,String> map=new HashMap<String, String>();
        for (String field : requestData.keySet()) {
            map.put(field,requestData.get(field));
            if (requestData.get(field).equalsIgnoreCase("&userId")) {
                map.replace(field, user.getUserField("userId"));
            }
            if (requestData.get(field).equalsIgnoreCase("&username")) {
                map.replace(field, user.getUserField("userName"));
            }
            if (requestData.get(field).equalsIgnoreCase("&eventNo")) {
                map.replace(field, event.getEventField("eventNo"));
            }
            if (requestData.get(field).equalsIgnoreCase("&signatureBase64")) {
                map.replace(field, Variables.signatureBase64);
            }
            if (requestData.get(field).equalsIgnoreCase("&base64Image")) {
                map.replace(field, Variables.base64Image);
            }
            if (requestData.get(field).equalsIgnoreCase("&workItemId")) {
                map.replace(field, workItem.getWorkItemField("workItemId"));
            }
            if (requestData.get(field).equalsIgnoreCase("&repairId")) {
                map.replace(field, repair.getRepairField("repairId"));
            }
        }
        //System.out.println(map);
        return map;
    }

    public void setEvent(DataTable requestData) {
        for (List<String> data:requestData.raw()) {
            String column = data.get(0);
            for (Field field : event.getClass().getDeclaredFields()) {
                String[] columnName = field.toString().split("\\.", 10);
                if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    if (columnName[4].equalsIgnoreCase(column))
                        event.setEventField(columnName[4], data.get(1));
                }
            }
        }
    }

    public void setEvent(Response result) {
        JsonPath jsonPathEvaluator = result.jsonPath();
        event.setEventField("eventNo",jsonPathEvaluator.get("eventNo").toString());
        //System.out.println("eventNo "+event.getEventField("eventNo")+" eventType "+event.getEventField("eventType")+" customerId "+event.getEventField("customerId"));
    }

    public void setWorkItem(DataTable requestData) {
        for (List<String> data:requestData.raw()) {
            String column = data.get(0);
            for (Field field : workItem.getClass().getDeclaredFields()) {
                String[] columnName = field.toString().split("\\.", 10);
                if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    if (columnName[4].equalsIgnoreCase(column))
                        workItem.setWorkItemField(columnName[4], data.get(1));
                }
            }
        }
    }

    public void setWorkItem(Response result) {
        JsonPath jsonPathEvaluator = result.jsonPath();
        workItem.setWorkItemField("workItemId",jsonPathEvaluator.get("workItemId").toString());
    }

    public void setRepair(DataTable requestData) {
        for (List<String> data:requestData.raw()) {
            String column = data.get(0);
            for (Field field : repair.getClass().getDeclaredFields()) {
                String[] columnName = field.toString().split("\\.", 10);
                if (!java.lang.reflect.Modifier.isStatic(field.getModifiers())) {
                    if (columnName[4].equalsIgnoreCase(column))
                        repair.setRepairField(columnName[4], data.get(1));
                }
            }
        }
    }

    public void setRepair(Response result) {
        JsonPath jsonPathEvaluator = result.jsonPath();
        repair.setRepairField("repairId",jsonPathEvaluator.get("repairId").toString());
    }

    public void setEndPoint(String endpoint) {
        this.endpoint = endpoint;
    }

    public void setRequest(String request) {
        this.request = request;
    }
}