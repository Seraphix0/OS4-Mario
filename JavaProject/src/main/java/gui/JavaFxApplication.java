package gui;

import gui.util.ControllerHelper;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class JavaFxApplication extends Application {
    @Override
    public void start(Stage primaryStage) throws Exception {

        primaryStage.setTitle("Mario Business application");
        ControllerHelper helper = ControllerHelper.getInstance();
        helper.loadFxml("/base.fxml", primaryStage);
    }
}
