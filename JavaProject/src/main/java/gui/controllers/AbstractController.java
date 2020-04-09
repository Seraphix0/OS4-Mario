package gui.controllers;

import gui.util.ControllerHelper;

public abstract class AbstractController {
    private static String nextScreen;
    private static String customerName;

    protected void changeScreen(String fxml){
        ControllerHelper helper = ControllerHelper.getInstance();

        loadFxml(fxml, helper);
    }

    protected void changeScreen(String fxml, String nextScreen1){
        ControllerHelper helper = ControllerHelper.getInstance();
        nextScreen = nextScreen1;

        loadFxml(fxml, helper);
    }

    protected void changeToNextScreen(String customerName1) {
        customerName = customerName1;
        changeScreen(nextScreen);
    }

    private void loadFxml(String fxml, ControllerHelper helper) {
        try {
            helper.loadFxml(fxml);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
