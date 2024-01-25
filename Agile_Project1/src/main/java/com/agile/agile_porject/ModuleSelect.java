package com.agile.agile_porject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ModuleSelect {
    public static class ModuleData {
        private List<String[]> moduleArray;
        private List<String[]> moduleElementArray;

        public ModuleData(List<String[]> moduleArray, List<String[]> moduleElementArray) {
            this.moduleArray = moduleArray;
            this.moduleElementArray = moduleElementArray;
        }

        public List<String[]> getModuleArray() {
            return moduleArray;
        }

        public List<String[]> getModuleElementArray() {
            return moduleElementArray;
        }
    }
    public static ModuleData selectModuleData(int fileId, ConnectionToDb con) {
        Connection connection = con.getConnection();
        String instruction = "SELECT * FROM MODULE WHERE FILEID = ? ;";
        List<String[]> moduleArray = new ArrayList<>();
        List<String[]> moduleElementArray = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(instruction)) {
            statement.setInt(1, fileId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String moduleId = resultSet.getString("ModuleID");
                String moduleName = resultSet.getString("ModuleName");
                String moduleFileId = resultSet.getString("FileID");
                String secondInstruction = "SELECT * FROM MODULEELEMENT WHERE MODULEID = ? ;";
                try (PreparedStatement secondStatement = connection.prepareStatement(secondInstruction)) {
                    secondStatement.setInt(1, Integer.parseInt(moduleId));
                    ResultSet resultSet1 = secondStatement.executeQuery();
                    while (resultSet1.next()) {
                        String moduleElementId = resultSet1.getString("ModuleElementID");
                        String moduleElementName = resultSet1.getString("ModuleElementName");
                        String moduleElementModuleId = resultSet1.getString("ModuleID");
                        String[] moduleElementValues = {moduleElementId, moduleElementName, moduleElementModuleId};
                        moduleElementArray.add(moduleElementValues);
                    }
                }
                String[] moduleValues = {moduleId, moduleName, moduleFileId};
                moduleArray.add(moduleValues);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return new ModuleData(moduleArray, moduleElementArray);
    }
}
