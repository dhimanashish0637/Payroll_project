package utilities;

public enum MonthNames {
    
    January(1),February(2),March(3),April(4),May(5),June(6),July(7),August(8),September(9),October(10),November(11),December(12);
    
    private int month_number;

    public int getMonth_number() {
        return month_number;
    }

    private MonthNames(int month_number) {
        this.month_number = month_number;
    }
}
