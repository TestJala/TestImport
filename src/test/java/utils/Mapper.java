package utils;

import io.restassured.response.Response;
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static io.restassured.path.json.JsonPath.from;

/**
 * This class map the end point.
 */

public final class Mapper {

   // private static final Logger LOGGER = LogManager.getLogger(Mapper.class);
    private static final String REGEX_INSIDE_BRACKETS = "(?<=\\[)(.*?)(?=])";
    private static final String REGEX_DOT = "\\.";
    private static final String REGEX_BRACKETS = "[\\[\\]]";
    private static final Map<String, Response> RESPONSE_VALUES = new HashMap<>();
    private static final int KEY = 0;
    private static final int VALUE = 1;
    private static final int LIMIT = 2;

    /**
     * Private constructor.
     */
    private Mapper() {
    }

    /**
     * Replaces values in the request map using the values of the storage map.
     *
     * @param requestData request data map.
     * @param <T>         generic type.
     * @return map with replaced values.
     */
    public static <T> Map<T, String> replaceMapValues(final Map<T, String> requestData) {
        Map<T, String> replacedMap = new HashMap<>();
        requestData.forEach((field, value) -> replacedMap.put(field, mapEndpoint(value)));
        return replacedMap;
    }

    /**
     * This method help to build the end point.
     *
     * @param response  the response that have stored it could be project, story or comment.
     * @param parameter the value to be get from the response.
     * @return the full end point.
     */
    public static String getField(final Response response, final String parameter) {
        return from(response.asString()).get(parameter).toString();
    }

    /**
     * This method map the end point.
     *
     * @param endPoint the endpoint send by the features.
     * @return the built end point.
     */
    public static String mapEndpoint(final String endPoint) {
        Matcher matches = Pattern.compile(REGEX_INSIDE_BRACKETS).matcher(endPoint);
        StringBuffer newEndPoint = new StringBuffer();

        while (matches.find()) {
            String[] parametersParts = matches.group().split(REGEX_DOT, LIMIT);
            String key = parametersParts[KEY];
            String value = parametersParts[VALUE];
            String replaceParameter = Mapper.getField(RESPONSE_VALUES.get(key), value);
            matches.appendReplacement(newEndPoint, replaceParameter);
        }
        matches.appendTail(newEndPoint);
        //LOGGER.info(String.format("Mapper endpoint: %s", newEndPoint.toString().replaceAll(REGEX_BRACKETS, "")));
        return newEndPoint.toString().replaceAll(REGEX_BRACKETS, "");
    }

    /**
     * Add the response result to the Map.
     *
     * @param key      the key value that identify the response.
     * @param response the response result of the request.
     */
    public static void addResponse(final String key, final Response response) {
        RESPONSE_VALUES.put(key, response);
    }
}
