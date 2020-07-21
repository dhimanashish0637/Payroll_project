package model.to;

import java.io.Serializable;
import java.sql.Timestamp;

public class Employee_Salary_TO implements Serializable{
    private int salary_id;
    private int employee_id;
    private Timestamp salary_date;
    private String salary_month;
    private int salary_year;
    private float basic_salary;
    private float gross_salary;
    private String employee_name;

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public int getSalary_id() {
        return salary_id;
    }

    public void setSalary_id(int salary_id) {
        this.salary_id = salary_id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public Timestamp getSalary_date() {
        return salary_date;
    }

    public void setSalary_date(Timestamp salary_date) {
        this.salary_date = salary_date;
    }

    public String getSalary_month() {
        return salary_month;
    }

    public void setSalary_month(String salary_month) {
        this.salary_month = salary_month;
    }

    public int getSalary_year() {
        return salary_year;
    }

    public void setSalary_year(int salary_year) {
        this.salary_year = salary_year;
    }

    public float getBasic_salary() {
        return basic_salary;
    }

    public void setBasic_salary(float basic_salary) {
        this.basic_salary = basic_salary;
    }

    public float getGross_salary() {
        return gross_salary;
    }

    public void setGross_salary(float gross_salary) {
        this.gross_salary = gross_salary;
    }
}
