package gui.util;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

public class ControllerHelper {
    private static ControllerHelper instance = null;
    private String name = null;

    public void setName(String name){
        this.name = name;
    }

    public static ControllerHelper getInstance() {
        if (instance == null) {
            instance = new ControllerHelper();
        }
        return instance;
    }

    Stage primaryStage;

    public Stage getPrimaryStage() {
        return primaryStage;
    }

    public void loadFxml(String fxml)   throws Exception
    {
        FXMLLoader loader = new FXMLLoader(getClass().getResource(fxml));
        Parent root = loader.load();

        loadStage(root);
    }

    public void loadFxml(String fxml, Object controller) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource(fxml));
        loader.setController(controller);
        Parent root = loader.load();

        loadStage(root);
    }

    private void loadStage(Parent root) {
        if (name == null){
            this.primaryStage.setTitle("Mario Business application");
            this.primaryStage.setScene(new Scene(root));
            this.primaryStage.show();
        }
        else{
            this.primaryStage.setTitle("Mario Business application" + " - " + name);
            this.primaryStage.setScene(new Scene(root));
            this.primaryStage.show();
        }
    }

    public void loadFxml(String fxml, Stage primaryStage)  throws Exception
    {
        if(this.primaryStage==null)
            this.primaryStage = primaryStage;

        loadFxml(fxml);
    }
}
