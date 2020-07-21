package model.to;

import java.io.Serializable;

public class Employee_Salary_Details_TO implements Serializable {

    private int salary_details_id;
    private int salary_id;
    private int wage_id;
    private float wage_amount;
    private float wage_percentage;
    private String wage_name;
    private String wage_type;

    public String getWage_type() {
        return wage_type;
    }

    public void setWage_type(String wage_type) {
        this.wage_type = wage_type;
    }

    public String getWage_name() {
        return wage_name;
    }

    public void setWage_name(String wage_name) {
        this.wage_name = wage_name;
    }

    public int getSalary_details_id() {
        return salary_details_id;
    }

    public void setSalary_details_id(int salary_details_id) {
        this.salary_details_id = salary_details_id;
    }

    public int getSalary_id() {
        return salary_id;
    }

    public void setSalary_id(int salary_id) {
        this.salary_id = salary_id;
    }

    public int getWage_id() {
        return wage_id;
    }

    public void setWage_id(int wage_id) {
        this.wage_id = wage_id;
    }

    public float getWage_amount() {
        return wage_amount;
    }

    public void setWage_amount(float wage_amount) {
        this.wage_amount = wage_amount;
    }

    public float getWage_percentage() {
        return wage_percentage;
    }

    public void setWage_percentage(float wage_percentage) {
        this.wage_percentage = wage_percentage;
    }
}
