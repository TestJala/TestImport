package utils;

public class Repair {
    private static Repair repair =null;
    public static Repair getRepair(){
        if(repair==null)createRepair();
        return repair;
    }
    private static void createRepair(){
        if(repair==null)repair=new Repair();
    }

    private String repairId;

    public void setRepairField(String field, String value) {
        if (field.equals("repairId")) repairId = value;
    }

    public String getRepairField(String field) {
        if (field.equals("repairId")) return repairId;
        else return null;
    }
}
