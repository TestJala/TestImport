package api.steps;

import client.api.RequestManager;
import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.qameta.allure.Description;
import io.qameta.allure.Step;
import io.restassured.response.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.testng.annotations.Test;
import utils.Helper;
import utils.RequestBuilder;
import utils.User;

import java.util.Map;

public class RequestSteps {
    private Helper helper;
    private Response response;

    public RequestSteps(final Helper helper) {
        this.helper = helper;
    }

    @Test(description = "ANNOTATION TEST")
    @Description("DESCRIP GABO")
    @Step("Step GABO")
    @Given("^A POST request to \"([^\"]*)\" endpoint with the following values$")
    public void aPOSTRequestToEndpointWithTheFollowingValues(final String endpoint, final Map<String, String> requestData){
        JSONObject body = RequestBuilder.build(helper.evaluateFields(requestData));
        response = RequestManager.postJson(endpoint, body);
        helper.setRequest(body.toString());
        helper.setEndPoint(endpoint);
        helper.setResponse(response);
    }

    @Given("^A POST request to \"([^\"]*)\" endpoint with the following JSON$")
    public void aPOSTRequestToEndpointWithTheFollowingJSON(String endpoint, String jsonString){
        JSONParser parser = new JSONParser();
        JSONObject json = null;
        try {
            json = (JSONObject) parser.parse(jsonString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        response = RequestManager.postJson(endpoint,json);
        helper.setResponse(response);
    }

    @Given("^A created user with the following values$")
    public void aCreatedUserWithTheFollowingValues(final DataTable requestData){
        String endpoint = "/api/vmRegistration/createUser";
        JSONObject body = RequestBuilder.build(requestData);
        Response result=RequestManager.postJson(endpoint, body);
        helper.setUser(requestData);
        helper.setUserIdUsername(result);
    }

    @Given("^A created event with the following values$")
    public void aCreatedEventWithTheFollowingValues(final DataTable requestData){
        String endpoint = "/api/vmEvent/create";
        JSONObject body = RequestBuilder.build(requestData);
        Response result=RequestManager.postJson(endpoint, body);
        helper.setEvent(requestData);
        helper.setEvent(result);
    }

    @Given("^A created work item with the following values$")
    public void aCreatedWorkItemWithTheFollowingValues(final DataTable requestData){
        String endpoint = "/api/vmUnit/createWorkItem";
        JSONObject body = RequestBuilder.build(requestData);
        Response result=RequestManager.postJson(endpoint, body);
        helper.setWorkItem(requestData);
        helper.setWorkItem(result);
    }

    @Given("^A created repair with the following values$")
    public void aCreatedRepairWithTheFollowingValues(final DataTable requestData){
        String endpoint = "/api/vmUnit/createRepair";
        JSONObject body = RequestBuilder.build(requestData);
        Response result=RequestManager.postJson(endpoint, body);
        helper.setRepair(requestData);
        helper.setRepair(result);
    }

    @And("^update user password with the following values$")
    public void updateUserPasswordWithTheFollowingValues(final Map<String, String> requestData){
        String endpoint = "/api/vmRegistration/updatePassword";
        Map<String,String> table=helper.AddUserIdToTable(requestData);

        JSONObject body = RequestBuilder.build(table);
        RequestManager.postJson(endpoint, body);
        helper.setUserPasswordAndPin(requestData);
    }

    @Deprecated
    @When("^change password with POST request to \"([^\"]*)\" endpoint with the following values$")
    public void changePasswordWithPOSTRequestToEndpointWithTheFollowingValues(final String endpoint, final Map<String, String> requestData) {
        Map<String,String> table=helper.AddUserIdToTable(requestData);
        JSONObject body = RequestBuilder.build(table);
        response = RequestManager.postJson(endpoint, body);
        helper.setResponse(response);
    }
}