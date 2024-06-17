package spring.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {

	private static final String URL = "jdbc:mysql://localhost:3306/ojt";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	private static Connection connection;

	public static Connection getConnection() {

		try {
			Class.forName("com.mysql.jdbc.Driver");

			if (connection == null) {
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} else {
				return connection;
			}

		} catch (ClassNotFoundException e) {
			System.out.println("Driver class not found");
		} catch (SQLException e) {
			System.out.println("Database Coonectin not found");
		} finally {
			System.out.println("Success");
		}
		return connection;

	}

}
