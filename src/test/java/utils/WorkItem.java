package utils;

public class WorkItem {
    private String unitNo;
    private String VIN;
    private String workItemType;
    private String userId;
    private String workItemId;
    private String parentEventId;

    private static WorkItem workItem =null;
    public static WorkItem getWorkItem(){
        if(workItem==null)createWorkItem();
        return workItem;
    }
    private static void createWorkItem(){
        if(workItem==null)workItem=new WorkItem();
    }

    public void setWorkItemField(String field, String value) {
        if (field.equals("unitNo")) unitNo = value;
        if (field.equals("VIN")) VIN = value;
        if (field.equals("workItemType")) workItemType = value;
        if (field.equals("userId")) userId = value;
        if (field.equals("workItemId")) workItemId = value;
        if (field.equals("parentEventId")) parentEventId = value;
    }

    public String getWorkItemField(String field) {
        if (field.equals("unitNo")) return unitNo;
        else if (field.equals("VIN")) return VIN;
        else if (field.equals("workItemType")) return workItemType;
        else if (field.equals("userId")) return userId;
        else if (field.equals("workItemId")) return workItemId;
        else if (field.equals("parentEventId")) return parentEventId;
        else return null;
    }
}


