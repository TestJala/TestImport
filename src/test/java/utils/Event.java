package utils;

public class Event {
    private String eventNo;
    private String eventType;
    private String customerId;

    private static Event event =null;
    public static Event getEvent(){
        if(event==null)createEvent();
        return event;
    }
    private static void createEvent(){
        if(event==null)event=new Event();
    }

    public void setEventField(String field, String value) {
        if (field.equals("eventNo")) eventNo = value;
        if (field.equals("eventType")) eventType = value;
        if (field.equals("customerId")) customerId = value;
    }

    public String getEventField(String field) {
        if (field.equals("eventNo")) return eventNo;
        else if (field.equals("eventType")) return eventType;
        else if (field.equals("customerId")) return customerId;
        else return null;
    }
}

