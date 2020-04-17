package logic.database;

import javafx.scene.control.ListView;
import logic.objects.CustomPizzasOrderedDTO;
import logic.objects.PizzasOrderedInAMonthDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerContext {
    private DbContext context;

    public CustomerContext() {
        this.context = DbContext.getInstance();
    }

    public ListView<String> get10RandomCustomers() {
        String query = "SELECT TOP 10 Customer.Name FROM Customer";
        ListView<String> names = new ListView<>();

        Connection connection = context.connect();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    names.getItems().add(resultSet.getString("Name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        context.disconnect();
        return names;
    }

    public CustomPizzasOrderedDTO getCustomPizzasOrdered(String customerName) {
        CustomPizzasOrderedDTO customPizzasOrderedDTO = new CustomPizzasOrderedDTO();
        String query = "EXEC [PercentageCustomPizzaForCustom] @CustomerName = ?";

        Connection connection = context.connect();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customerName);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    customPizzasOrderedDTO.setCustomerName(customerName);
                    customPizzasOrderedDTO.setTotalPizzasOrdered(resultSet.getInt("Total"));
                    customPizzasOrderedDTO.setPercentageCustomPizzas(resultSet.getDouble("Custom"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        context.disconnect();

        return customPizzasOrderedDTO;
    }

    public List<PizzasOrderedInAMonthDTO> ordersPerMonth(String customerName) {
        List<PizzasOrderedInAMonthDTO> list = new ArrayList<>();
        String query = "EXEC [OrderPerCustomerPerMonth] @CustomerName = ?";

        Connection connection = context.connect();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, customerName);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    PizzasOrderedInAMonthDTO dto = new PizzasOrderedInAMonthDTO();
                    dto.setMonth(resultSet.getInt("month"));
                    dto.setCount(resultSet.getInt("orders"));
                    dto.setCustomer(customerName);
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        context.disconnect();

        return list;
    }

}
