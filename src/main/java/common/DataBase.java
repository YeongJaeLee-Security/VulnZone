package common;

import java.io.InputStream;
import java.util.Properties;

public class DataBase {
	private Properties properties = new Properties();
	private String dbURL;
	private String dbName;
	private String tableName;
	private String dbID;
	private String dbPassword;
	private String sqlTableName;
	private String xssTableName;
	
	public DataBase() {
		try {
			InputStream inputStream = DataBase.class.getClassLoader().getResourceAsStream("config.properties");
			properties.load(inputStream);
			
			dbURL = properties.getProperty("db.url");
			dbName = properties.getProperty("db.name");
			dbID = properties.getProperty("db.id");
			dbPassword = properties.getProperty("db.password");
			tableName = properties.getProperty("db.user.table.name");
			
			sqlTableName = properties.getProperty("db.sql.table.name");
			xssTableName = properties.getProperty("db.xss.table.name");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Properties getProperties() {
		return properties;
	}

	public String getDbURL() {
		return dbURL;
	}

	public String getDbName() {
		return dbName;
	}

	public String getTableName() {
		return tableName;
	}

	public String getDbID() {
		return dbID;
	}

	public String getDbPassword() {
		return dbPassword;
	}
	
	public String getSqlTableName() {
		return sqlTableName;
	}
	
	public String getXssTableName() {
		return xssTableName;
	}
}