package gui.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class BaseController extends AbstractController {
    @FXML
    private Button customPizzasButton;

    public void customPizzasButtonClick() {
        changeScreen("/random-customers.fxml", "/custom-customer-pizzas.fxml");
    }
}
