package logic.database;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import logic.objects.BestSellingPizzasDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PizzasContext {
    private DbContext context;

    public PizzasContext(){
        this.context = DbContext.getInstance();
    }

    public ObservableList<BestSellingPizzasDTO> bestSellingPizzas() {
        String query = "SELECT * FROM TopSellingPizza";
        ArrayList<BestSellingPizzasDTO> list = new ArrayList<>();

        Connection connection = context.connect();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    BestSellingPizzasDTO dto = new BestSellingPizzasDTO();
                    dto.setCount(resultSet.getInt("Count"));
                    dto.setName(resultSet.getString("Name"));
                    dto.setDescription(resultSet.getString("Description"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        context.disconnect();
        return FXCollections.observableArrayList(list);
    }
}
