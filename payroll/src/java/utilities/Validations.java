package utilities;

import java.sql.Date;

public class Validations {

    public static boolean isEmpty(String value) {
        if (value != null) {
            return value.trim().isEmpty();
        }
        return false;
    }

    public static boolean isNumber(String value) {
        try {
            Integer.parseInt(value.trim());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
    
    public static boolean isValidDate(String value){
        try{
            Date.valueOf(value);
            return true;
        }catch(Exception ex){
            return false;
        }
    }

    public static boolean isFloat(String value) {
        try {
            Float.parseFloat(value.trim());
            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    public static boolean isComplexPassword(String value) {
        String special_symbol = "@#$_";
        String digits = "123456789";
        boolean valid_password = true;
        int count = 0;
        for (int index = 0; index < value.length(); index++) {
            if (digits.contains(value.charAt(index) + "")) {
                count++;
            }
        }
        if (count == 0) {
            valid_password = false;
        }
        count = 0;
        for (int index = 0; index < value.length(); index++) {
            if (special_symbol.contains(value.charAt(index) + "")) {
                count++;
            }
        }
        if (count == 0) {
            valid_password = false;
        }
        count = 0;
        for (int index = 0; index < value.length(); index++) {
            if (Character.isLetter(value.charAt(index)) && Character.isUpperCase(value.charAt(index))) {
                count++;
            }
        }
        if (count == 0) {
            valid_password = false;
        }
        return valid_password;
    }

    public static boolean isValidEmail(String email) {
        int atindex = email.lastIndexOf("@");
        int dotindex = email.lastIndexOf(".");
        return atindex != -1 && dotindex != -1 && atindex < dotindex;
    }
}
