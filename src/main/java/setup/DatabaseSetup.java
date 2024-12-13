package setup;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

import user.UserDAO;

public class DatabaseSetup {
	private Properties properties = new Properties();
	private String dbURL;
	private String dbName;
	private String tableName;
	private String dbID;
	private String dbPassword;
    
    public DatabaseSetup() {
    	try {
	    	InputStream inputStream = UserDAO.class.getClassLoader().getResourceAsStream("config.properties");
			properties.load(inputStream);
			
			dbURL = properties.getProperty("db.url");
			dbName = properties.getProperty("db.name");
			dbID = properties.getProperty("db.id");
			dbPassword = properties.getProperty("db.password");
			tableName = properties.getProperty("db.user.table.name");
			Class.forName("com.mysql.cj.jdbc.Driver");
			
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }

    public int setupDatabaseAndTable() {
        try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
             Statement stmt = conn.createStatement()) {

            // 데이터베이스 생성
            String createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS " + dbName;
            stmt.executeUpdate(createDatabaseQuery);

            // 테이블 생성
            String useDatabaseQuery = "USE " + dbName;
            stmt.executeUpdate(useDatabaseQuery);

            String createTableQuery = "CREATE TABLE IF NOT EXISTS " + tableName + " (" +
                    "userID VARCHAR(20)," +
                    "userPassword VARCHAR(64)," +
                    "userName VARCHAR(20)," +
                    "userGender VARCHAR(20)," +
                    "userEmail VARCHAR(50),"+
                    "PRIMARY KEY (userID)" +
                    ")";
            stmt.executeUpdate(createTableQuery);

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return -1;
    }
}
