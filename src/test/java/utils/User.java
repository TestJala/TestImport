package utils;

public class User {
    private String deviceId;
    private String firstName;
    private String lastName;
    private String userName;
    private String phoneNo;
    private String userId;
    private String password;
    private String passwordRecoveryPin;
    private String serviceProviderName;
    private String providerCode;

    private static User user =null;
    public static User getUser(){
        if(user==null)createUser();
        return user;
    }
    private static void createUser(){
        if(user==null)user=new User();
    }

    public void setUserField(String field, String value){
        if(field.equals("deviceId"))deviceId=value;
        if(field.equals("firstName"))firstName=value;
        if(field.equals("lastName"))lastName=value;
        if(field.equals("userName"))userName=value;
        if(field.equals("phoneNo"))phoneNo=value;
        if(field.equals("userId"))userId=value;
        if(field.equals("password"))password=value;
        if(field.equals("passwordRecoveryPi"))passwordRecoveryPin=value;
        if(field.equals("serviceProviderName"))serviceProviderName=value;
        if(field.equals("providerCode"))providerCode=value;
    }

    public String getUserField(String field){
        if(field.equals("deviceId")) return deviceId;
        else if(field.equals("firstName")) return firstName;
        else if(field.equals("lastName")) return lastName;
        else if(field.equals("userName")) return userName;
        else if(field.equals("phoneNo")) return phoneNo;
        else if(field.equals("userId")) return userId;
        else if(field.equals("password"))return password;
        else if(field.equals("passwordRecoveryPi")) return passwordRecoveryPin;
        else if(field.equals("serviceProviderName"))return serviceProviderName;
        else if(field.equals("providerCode")) return providerCode;
        else return null;
    }
}
