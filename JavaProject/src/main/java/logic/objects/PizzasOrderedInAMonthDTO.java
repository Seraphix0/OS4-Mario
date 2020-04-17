package logic.objects;

public class PizzasOrderedInAMonthDTO {
    private int month;
    private int count;
    private String customer;

    public PizzasOrderedInAMonthDTO() {
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }
}
