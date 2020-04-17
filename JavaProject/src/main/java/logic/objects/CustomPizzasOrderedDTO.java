package logic.objects;

public class CustomPizzasOrderedDTO {
    private String customerName;
    private int totalPizzasOrdered;
    private double percentageCustomPizzas;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getTotalPizzasOrdered() {
        return totalPizzasOrdered;
    }

    public void setTotalPizzasOrdered(int totalPizzasOrdered) {
        this.totalPizzasOrdered = totalPizzasOrdered;
    }

    public double getPercentageCustomPizzas() {
        return percentageCustomPizzas;
    }

    public void setPercentageCustomPizzas(double percentageCustomPizzas) {
        this.percentageCustomPizzas = percentageCustomPizzas;
    }
}
