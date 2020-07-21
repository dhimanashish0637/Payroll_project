package utilities;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Operation {

    public static int calculateWorkingDays(MonthNames month, int year) {
        int days = 31;
        GregorianCalendar gcal = new GregorianCalendar();
        switch (month) {
            case April:
            case June:
            case September:
            case November:
                days = 30;
                break;
            case February:
                days = gcal.isLeapYear(year) ? 29 : 28;
                break;
        }
        gcal.set(Calendar.YEAR, year);
        gcal.set(Calendar.MONTH,month.ordinal());
        int day_of_week,working_days = 0;
        for( int day = 1; day <= days; day++){
            gcal.set(Calendar.DATE,day);
            day_of_week = gcal.get(Calendar.DAY_OF_WEEK);
            if(!(day_of_week == Calendar.SATURDAY || day_of_week == Calendar.SUNDAY)){
                working_days++;
            }
        }
        return working_days;
    }
}
