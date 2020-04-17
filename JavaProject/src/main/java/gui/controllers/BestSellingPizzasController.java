package gui.controllers;

import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import logic.database.PizzasContext;
import logic.objects.BestSellingPizzasDTO;

public class BestSellingPizzasController extends AbstractController {
    @FXML
    private TableColumn<BestSellingPizzasDTO, Integer> countColumn;
    @FXML
    private TableColumn<BestSellingPizzasDTO, String> nameColumn;
    @FXML
    private TableColumn<BestSellingPizzasDTO, String> descriptionColumn;
    @FXML
    private TableView<BestSellingPizzasDTO> table;

    @FXML
    public void initialize() {
        PizzasContext pizzasContext = new PizzasContext();
        ObservableList<BestSellingPizzasDTO> list = pizzasContext.bestSellingPizzas();
        countColumn.setCellValueFactory(new PropertyValueFactory<>("count"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));
        descriptionColumn.setCellValueFactory(new PropertyValueFactory<>("description"));

        table.setItems(list);
    }
}
