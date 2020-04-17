package gui.controllers;

import javafx.fxml.FXML;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.XYChart;
import logic.database.CustomerContext;
import logic.objects.PizzasOrderedInAMonthDTO;

import java.text.DateFormatSymbols;
import java.util.List;

public class PizzasOrderedMonthController extends AbstractController {
    @FXML
    private BarChart<String, Integer> chart;

    @FXML
    public void initialize() {
        CustomerContext context = new CustomerContext();
        List<PizzasOrderedInAMonthDTO> list = context.ordersPerMonth(customerName);

        for (PizzasOrderedInAMonthDTO dto : list) {
            XYChart.Series dataSeries = new XYChart.Series();
            dataSeries.setName("Orders");
            XYChart.Data data = new XYChart.Data();
            data.setXValue(new DateFormatSymbols().getMonths()[dto.getMonth() - 1]);
            data.setYValue(dto.getCount());

            dataSeries.getData().add(data);
            chart.getData().add(dataSeries);
        }
    }
}
