package com.agile.agile_porject;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/allDep")
public class AllDep extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String formType = request.getParameter("formType");
        ConnectionToDb con = new ConnectionToDb();
        //String messageResponse = null;
        if ("add".equals(formType)){
            String depName = request.getParameter("depNameInput");
            String instruction = "INSERT INTO DEPARTMENT (DepartmentID, DepartmentName) VALUES (NULL, ? );";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setString(1, depName);
                preparedStatement.executeUpdate();
                //messageResponse = depName + " is Created !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("delete".equals(formType)) {
            Integer depId = Integer.valueOf(request.getParameter("depId"));
            String depName = request.getParameter("depName");
            String instruction = "DELETE FROM DEPARTMENT WHERE DepartmentID = ?";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setInt(1, depId);
                preparedStatement.executeUpdate();
                //messageResponse = depName + " is Deleted !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else if ("update".equals(formType)) {
            Integer depId = Integer.valueOf(request.getParameter("depId"));
            String depName = request.getParameter("depName");
            String instruction = "UPDATE DEPARTMENT SET DepartmentName = ? WHERE DepartmentID = ?;";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setString(1, depName);
                preparedStatement.setInt(2, depId);
                preparedStatement.executeUpdate();
                //messageResponse = depName + " is updated !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        String instruction = "SELECT * FROM DEPARTMENT;";
        //request.setAttribute("message", messageResponse);
        List<String[]> departmentsArray = new ArrayList<>();

        try (Connection connection = con.getConnection();
             Statement statement = connection.createStatement()) {

            ResultSet resultSet = statement.executeQuery(instruction);

            while (resultSet.next()) {
                String departmentId = resultSet.getString("DepartmentID");
                String departmentName = resultSet.getString("DepartmentName");
                String[] departmentValues = { departmentId, departmentName };
                departmentsArray.add(departmentValues);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("executionResult", departmentsArray);
        RequestDispatcher dispatcher = request.getRequestDispatcher("allDep.jsp");
        dispatcher.forward(request, response);
    }
}

