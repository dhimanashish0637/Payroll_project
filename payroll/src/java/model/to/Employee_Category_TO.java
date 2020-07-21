package model.to;

import java.io.Serializable;

public class Employee_Category_TO implements Serializable{
    private String category_id;
    private String category_name;
    private float basic_salary;
    private int leave_per_month;

    public int getLeave_per_month() {
        return leave_per_month;
    }

    public void setLeave_per_month(int leave_per_month) {
        this.leave_per_month = leave_per_month;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public float getBasic_salary() {
        return basic_salary;
    }

    public void setBasic_salary(float basic_salary) {
        this.basic_salary = basic_salary;
    }
}
