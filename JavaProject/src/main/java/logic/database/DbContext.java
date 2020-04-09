package logic.database;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DbContext {
    private final String CONNECTIONSTRING = "jdbc:sqlserver://mssql.fhict.local;";
    private final String DATABASE_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    private static DbContext instance;
    private Connection connection;

    // init properties object
    private Properties properties;

    // create properties
    private Properties getProperties() {
        if (properties == null) {
            properties = new Properties();
            InputStream in = this.getClass().getResourceAsStream("/config.properties");
            try {
                properties.load(in);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }

    public static DbContext getInstance() {
        if (instance == null){
            instance = new DbContext();
        }
        return instance;
    }

    private DbContext(){

    }

    public Connection connect(){
        if (connection == null) {
            try {
                Class.forName(DATABASE_DRIVER);
                connection = DriverManager.getConnection(CONNECTIONSTRING, getProperties());
            } catch (ClassNotFoundException | SQLException e) {
                // Java 7+
                e.printStackTrace();
            }
        }
        return connection;
    }

    public void disconnect(){
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
