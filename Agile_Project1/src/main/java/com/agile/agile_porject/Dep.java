package com.agile.agile_porject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/dep")
public class Dep extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String departmentIdParam = request.getParameter("departmentId");
        String departmentNameParam = request.getParameter("departmentName");
        if (departmentIdParam != null && !departmentIdParam.isEmpty()) {
            try {
                Integer departmentId = Integer.valueOf(departmentIdParam);
                String departmentName = departmentNameParam;
                session.setAttribute("depId", departmentId);
                session.setAttribute("depName", departmentName);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

        HttpSession session = request.getSession();
        Integer depId  = (Integer) session.getAttribute("depId");
        String depName = (String) session.getAttribute("depName");
        String formType = request.getParameter("formType");
        ConnectionToDb con = new ConnectionToDb();
        //String messageResponse = null;
        if ("add".equals(formType)){
            String filName = request.getParameter("filNameInput");
            String instruction = "INSERT INTO FILE (FILEID, FILENAME, DEPARTMENTID) VALUES (NULL, ?, ? );";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setString(1, filName);
                preparedStatement.setInt(2, depId);
                preparedStatement.executeUpdate();
                //messageResponse = filName + " is Created !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("delete".equals(formType)) {
            Integer filId = Integer.valueOf(request.getParameter("filId"));
            String filName = request.getParameter("filName");
            String instruction = "DELETE FROM FILE WHERE FILEID = ?";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setInt(1, filId);
                preparedStatement.executeUpdate();
                //messageResponse = filName + " is Deleted !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }else if ("update".equals(formType)) {
            Integer filId = Integer.valueOf(request.getParameter("filId"));
            String filName = request.getParameter("filName");
            String instruction = "UPDATE FILE SET FILENAME = ? WHERE FILEID = ?;";
            try(Connection connection = con.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(instruction))
            {
                preparedStatement.setString(1, filName);
                preparedStatement.setInt(2, filId);
                preparedStatement.executeUpdate();
                //messageResponse = depName + " is updated !";
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        //Select Elements
        String instruction = "SELECT * FROM FILE WHERE DEPARTMENTID = " + depId + ";";
        List<String[]> filieresArray = new ArrayList<>();

        try (Connection connection = con.getConnection();
             Statement statement = connection.createStatement()) {

            ResultSet resultSet = statement.executeQuery(instruction);

            while (resultSet.next()) {
                String filiereId = resultSet.getString("FileID");
                String filiereName = resultSet.getString("FileName");
                String filiereDepId = resultSet.getString("DepartmentID");
                String[] filiereValues = { filiereId, filiereName, filiereDepId };
                filieresArray.add(filiereValues);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("executionResult", filieresArray);
        request.setAttribute("depName", depName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dep.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

        HttpSession session = request.getSession();
        Integer depId  = (Integer) session.getAttribute("depId");
        String depName = (String) session.getAttribute("depName");
        ConnectionToDb con = new ConnectionToDb();

        //Select Elements
        String instruction = "SELECT * FROM FILE WHERE DEPARTMENTID = " + depId + ";";
        List<String[]> filieresArray = new ArrayList<>();
        try (Connection connection = con.getConnection();
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(instruction);
            while (resultSet.next()) {
                String filiereId = resultSet.getString("FileID");
                String filiereName = resultSet.getString("FileName");
                String filiereDepId = resultSet.getString("DepartmentID");
                String[] filiereValues = { filiereId, filiereName, filiereDepId };
                filieresArray.add(filiereValues);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("executionResult", filieresArray);
        request.setAttribute("depName", depName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dep.jsp");
        dispatcher.forward(request, response);
    }
}
