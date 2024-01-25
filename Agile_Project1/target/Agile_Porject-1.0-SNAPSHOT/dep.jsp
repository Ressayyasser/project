<%--
  Created by IntelliJ IDEA.
  User: BANAXE
  Date: 17/12/2023
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dep</title>
    <link rel="stylesheet" href="css/dep.css">
</head>
<body>
    <%@include file="base.jsp"%>
    <main class="mainSection">
        <section class="upperSection">
            <form action="allDep" id="goBack" method="GET">
                <svg onclick="goBack()" xmlns="http://www.w3.org/2000/svg" width="23" height="25" fill="currentColor" class="bi bi-arrow-left-square backArrowSvg" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
                </svg>
            </form>
            <h3>${depName}</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="105" height="25" fill="currentColor" class="bi bi-plus-lg firstSvg" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
            </svg>
        </section>
        <section class="lowerSection">
            <c:forEach var="row" items="${executionResult}">
            <div class="filElement">
                <form id="${row[0]}" action="dep" method="POST">
                    <input type="hidden" value="${row[0]}" name="filId">
                    <input type="hidden" value="${row[1]}" name="filName">
                    <input type="hidden" value="${row[2]}" name="depId">
                    <input type="hidden" value="delete" name="formType">
                    <svg onclick="submitDelete(${row[0]})" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash secondSvg" viewBox="0 0 16 16">
                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                        <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                    </svg>
                </form>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square modifieSvg" onclick="updateModal('${row[0]}','${row[1]}')" viewBox="0 0 16 16">
                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                </svg>
                <form action="fil" method="POST">
                    <input type="hidden" name="filiereId" id="filiereId" value="${row[0]}">
                    <input type="submit" name="filiereName" class="filiereName" value="${row[1]}">
                </form>
            </div>
            </c:forEach>
            <a id="openPopUp" class="addElement">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
                </svg>
                <h5>Click to add Dep</h5>
            </a>
            <!--Modal pour créer une nouveel filière-->
            <div class="blackWindow" id="blackWindow">
                <div class="addElementForm">
                    <h4 class="addElementFormTitle">Add a new Filiere</h4>
                    <form method="POST" action="dep">
                        <input type="hidden" name="formType" value="add">
                        <input type="hidden" name="depId" value="${row[2]}">
                        <input type="text" id="filNameInput" name="filNameInput"><br>
                        <input type="button" id="cancel" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
            <!--Modal pour modifier le nom de filiere -->
            <div class="updateModal" id="updateModal">
                <div class="addElementForm">
                    <h4 class="addElementFormTitle">Update Filiere Name</h4>
                    <form method="POST" action="dep">
                        <input type="hidden" name="formType" value="update">
                        <input type="hidden" name="filId" id="updateModaleIdInput">
                        <input type="text" id="updateModalNameInput" name="filName"><br>
                        <input type="button" id="cancelUpdate" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
        </section>
    </main>
    <script src="js/dep.js"></script>
</body>
</html>
