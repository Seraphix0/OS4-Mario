package gui.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import logic.database.CustomerContext;

public class RandomCustomersController extends BaseController {
    @FXML
    private Button nextButton;

    @FXML
    private ListView<String> listView;

    @FXML
    public void initialize() {
        CustomerContext customerContext = new CustomerContext();
        listView.getItems().addAll(customerContext.get10RandomCustomers().getItems());
    }

    public void goToNextScreen() {
        if (listView.getSelectionModel().getSelectedItem() != null) {
            changeToNextScreen(listView.getSelectionModel().getSelectedItem());
        }
    }
}
