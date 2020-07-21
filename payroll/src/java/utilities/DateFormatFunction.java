package utilities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatFunction {
    public static String getDateTimeString(Timestamp date_time){
        SimpleDateFormat date_format = new SimpleDateFormat("dd MMMMM, yyyy HH:mm:ss");
        Date date = new Date(date_time.getTime());
        return date_format.format(date);
    }
}
