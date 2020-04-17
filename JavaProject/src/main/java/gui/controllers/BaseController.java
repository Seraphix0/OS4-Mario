package gui.controllers;

import javafx.fxml.FXML;
import javafx.scene.control.Button;

public class BaseController extends AbstractController {

    public void customPizzasButtonClick() {
        changeScreen("/random-customers.fxml", "/custom-customer-pizzas.fxml");
    }

    public void topPizzasButtonClick() {
        changeScreen("/best-selling.fxml");
    }

    public void mostUsedCouponsClick() {
        changeScreen("/top-used.fxml");
    }

    public void ordersPerMonthClick() {
        changeScreen("/random-customers.fxml", "/pizzas-ordered-month.fxml");
    }
}
