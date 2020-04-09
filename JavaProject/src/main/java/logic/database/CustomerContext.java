package logic.database;

import javafx.scene.control.ListView;

import java.sql.*;

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
}
