package client.api;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.json.simple.JSONObject;

import java.util.Map;

import static io.restassured.RestAssured.given;

/**
 * It is in charged to send requests to specific endpoints.
 */
public final class RequestManager {

    /**
     * Private constructor for the Request Manager utility class.
     */
    private RequestManager() {
        // Default constructor.
    }

    /**
     * Sends a GET request to a specified end point.
     *
     * @param endpoint service end point.
     * @return service response.
     */
    public static Response get(final String endpoint) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().when().get(finalEndPoint);
    }

    /**
     * Sends a POST request to a specified end point.
     *
     * @param endpoint service end point.
     * @param body     request body content as String.
     * @return service response.
     */
    public static Response post(final String endpoint, final String body) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().contentType(ContentType.JSON).when().body(body).post(finalEndPoint);
    }

    /**
     * Sends a POST request to a specified end point.
     *
     * @param endpoint service end point.
     * @param body     request body content as Map.
     * @return service response.
     */
    public static Response post(final String endpoint, final Map<String, String> body) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().params(body).when().post(finalEndPoint);
    }

    /**
     * Sends a PUT request to a specified end point.
     *
     * @param endpoint service end point.
     * @param body     request body content as String.
     * @return service response.
     */
    public static Response put(final String endpoint, final String body) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().contentType(ContentType.JSON).when().body(body).put(finalEndPoint);
    }

    /**
     * Sends a PUT request to a specified end point.
     *
     * @param endpoint service end point.
     * @param body     request body content as Map.
     * @return service response.
     */
    public static Response put(final String endpoint, final JSONObject body) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().params(body).when().put(finalEndPoint);
    }

    /**
     * Sends a DELETE request to a specified end point.
     *
     * @param endpoint service end point.
     * @return service response.
     */
    public static Response delete(final String endpoint) {
        String finalEndPoint = Variables.Url + endpoint;
        return given().when().delete(finalEndPoint);
    }

    /**
     * Sends a POST request to a specified end point.
     *
     * @param endpoint service end point.
     * @param body     request body content as Map.
     * @return service response.
     */
    public static Response postJson(final String endpoint, JSONObject body) {
        String finalEndPoint = Variables.Url + endpoint;
        RestAssured.useRelaxedHTTPSValidation();
        return given().contentType(ContentType.JSON)
                .body(body.toString()).when().post(finalEndPoint);
    }
}
