package com.agile.agile_porject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionToDb {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/agile";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public ConnectionToDb() {
    }

    public Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        ConnectionToDb con = new ConnectionToDb();
        Connection connection = con.getConnection();

        if (connection != null) {
            System.out.println("Connection Successful");
            // Close the connection when done
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Connection failed");
        }
    }
}