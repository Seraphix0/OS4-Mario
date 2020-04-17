package logic.database;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import logic.objects.MostUsedCouponDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CouponContext {
    private DbContext context;

    public CouponContext() {
        this.context = DbContext.getInstance();
    }

    public ObservableList<MostUsedCouponDTO> mostUsedCoupons() {
        String query = "SELECT * FROM TopUsedCoupons";
        ArrayList<MostUsedCouponDTO> list = new ArrayList<>();

        Connection connection = context.connect();
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    MostUsedCouponDTO dto = new MostUsedCouponDTO();
                    dto.setCount(resultSet.getInt("Count"));
                    String description = resultSet.getString("Description");
                    if (!description.equals("")) {
                        dto.setDescription(description);
                    } else {
                        continue;
                    }
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
