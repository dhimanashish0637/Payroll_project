package model.to;

import java.io.Serializable;

public class Salary_Wages_TO implements Serializable{
    private int wage_id;
    private String wage_name;
    private float wage_percentage;
    private String wage_type;

    public int getWage_id() {
        return wage_id;
    }

    public void setWage_id(int wage_id) {
        this.wage_id = wage_id;
    }

    public String getWage_name() {
        return wage_name;
    }

    public void setWage_name(String wage_name) {
        this.wage_name = wage_name;
    }

    public float getWage_percentage() {
        return wage_percentage;
    }

    public void setWage_percentage(float wage_percentage) {
        this.wage_percentage = wage_percentage;
    }

    public String getWage_type() {
        return wage_type;
    }

    public void setWage_type(String wage_type) {
        this.wage_type = wage_type;
    }
}
