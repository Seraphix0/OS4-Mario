package gui.controllers;

import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import logic.database.CouponContext;
import logic.objects.MostUsedCouponDTO;

public class TopUsedCouponsController extends AbstractController {
    @FXML
    private TableColumn<MostUsedCouponDTO, Integer> countColumn;
    @FXML
    private TableColumn<MostUsedCouponDTO, String> descriptionColumn;
    @FXML
    private TableView<MostUsedCouponDTO> table;

    @FXML
    public void initialize() {
        CouponContext couponContext = new CouponContext();
        ObservableList<MostUsedCouponDTO> list = couponContext.mostUsedCoupons();
        countColumn.setCellValueFactory(new PropertyValueFactory<>("count"));
        descriptionColumn.setCellValueFactory(new PropertyValueFactory<>("description"));
        table.setItems(list);
    }
}
