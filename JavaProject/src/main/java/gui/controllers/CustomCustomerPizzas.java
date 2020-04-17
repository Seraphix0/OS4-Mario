package gui.controllers;

import javafx.fxml.FXML;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Tooltip;
import logic.database.CustomerContext;
import logic.objects.CustomPizzasOrderedDTO;

import java.text.MessageFormat;

public class CustomCustomerPizzas extends AbstractController {
    @FXML
    private PieChart pieChart;

    @FXML
    public void initialize() {
        CustomerContext customerContext = new CustomerContext();
        CustomPizzasOrderedDTO customPizzasOrderedDTO = customerContext.getCustomPizzasOrdered(customerName != null ? customerName : "Mirja Doomen");

        pieChart.getData().addAll(new PieChart.Data("Custom pizzas", customPizzasOrderedDTO.getPercentageCustomPizzas()),
                                  new PieChart.Data("Normal pizzas", 100 - customPizzasOrderedDTO.getPercentageCustomPizzas()));

        pieChart.setTitle(MessageFormat.format("Total pizzas ordered: {}", customPizzasOrderedDTO.getTotalPizzasOrdered()));

        pieChart.getData().forEach(data -> {
            String percentage = String.format("%.2f%%", (data.getPieValue()));
            Tooltip toolTip = new Tooltip(percentage);
            Tooltip.install(data.getNode(), toolTip);
        });
    }
}
