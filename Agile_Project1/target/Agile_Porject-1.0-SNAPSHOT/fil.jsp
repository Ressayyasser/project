<%--
  Created by IntelliJ IDEA.
  User: BANAXE
  Date: 17/12/2023
  Time: 23:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Fil</title>
    <link type="text/css" rel="stylesheet" href="css/fil.css">
</head>
<body>
    <%@include file="base.jsp"%>
    <main class="mainSection">
        <section class="upperSection">
            <form action="dep" id="goBack" method="GET">
                <svg onclick="goBack()" xmlns="http://www.w3.org/2000/svg" width="23" height="25" fill="currentColor" class="bi bi-arrow-left-square backArrowSvg" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
                </svg>
            </form>
            <h3 alt="${filiereId}">${filiereName}</h3>
            <svg xmlns="http://www.w3.org/2000/svg" width="105" height="25" fill="currentColor" class="bi bi-plus-lg firstSvg" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2"/>
            </svg>
        </section>
        <section class="lowerSection">
            <c:forEach var="row1" items="${moduleData}">
            <div class="module">
                <div class="moduleInfo">
                    <form id="${row1[0]}" class="deleteModuleElementForm" action="fil" method="POST">
                        <input type="hidden" value="${row1[0]}" name="moduleId">
                        <input type="hidden" value="${row1[1]}" name="moduleName">
                        <input type="hidden" value="deleteModule" name="formType">
                        <svg onclick="submitDelete(${row1[0]})" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash secondSvg" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                            <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                        </svg>
                    </form>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square modifieSvg" onclick="updateModal1('${row1[0]}','${row1[1]}')" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                    </svg>
                    <h4 class="modName">${row1[1]}</h4>
                </div>
                <c:forEach var="row2" items="${moduleElementData}">
                <c:if test="${row1[0] eq row2[2]}">
                <div class="modElement">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square thirdSvg" onclick="updateModal2('${row2[0]}','${row2[1]}')" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                    </svg>
                    <form id="${row2[0]}" action="fil" method="POST">
                        <input type="hidden" name="moduleElementId" value="${row2[0]}">
                        <input type="hidden" name="moduleElementName" value="${row2[1]}">
                        <input type="hidden" name="moduleId" value="${row1[0]}">
                        <input type="hidden" name="formType" value="deleteModuleElement">
                        <svg onclick="submitDelete(${row2[0]})" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash fourthSvg" viewBox="0 0 16 16">
                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                            <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                        </svg>
                    </form>
                    <p class="modElementName">${row2[1]}</p>
                </div>
                </c:if>
                </c:forEach>
                <div onclick="addModal('${row1[0]}','${row1[1]}')" class="addModElement">
                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
                    </svg>
                    <h5>Add Element</h5>
                </div>
            </div>
            </c:forEach>
            <a id="openPopUp" class="addElement">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"/>
                </svg>
                <h5>Click to add Module</h5>
            </a>
            <!--Modal pour créer un Module-->
            <div class="blackWindow" id="blackWindow">
                <div class="addModuleForm">
                    <h4 class="addModuleFormTitle">Add a new Module</h4>
                    <form method="POST" action="fil">
                        <input type="hidden" name="formType" value="addModule">
                        <input type="hidden" name="filiereIdValue" value="${filiereId}">
                        <input type="text" id="moduleNameInput" name="moduleNameInput"><br>
                        <input type="button" id="cancel" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
            <!--Modal pour modifier le nom de module -->
            <div class="updateModal" id="updateModal1">
                <div class="addModuleForm">
                    <h4 class="addModuleFormTitle">Update Module Name</h4>
                    <form method="POST" action="fil">
                        <input type="hidden" name="formType" value="updateModule">
                        <input type="hidden" name="moduleId" id="updateModaleIdInput">
                        <input type="text" id="updateModalNameInput" name="moduleName"><br>
                        <input type="button" id="cancelUpdate" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
            <!--Modal pour ajouter un element de module -->
            <div class="updateModal" id="addModal">
                <div class="addModuleForm">
                    <h4 class="addModuleFormTitle">Add Element to <span id="addModalNameText"></span></h4>
                    <form method="POST" action="fil">
                        <input type="hidden" name="formType" value="addModuleElement">
                        <input type="hidden" name="moduleId" id="addModaleIdInput">
                        <input type="text" name="moduleElementName"><br>
                        <input type="button" id="cancelAdd" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
            <!--Modal pour modifier l'element de module -->
            <div class="updateModal" id="updateModal2">
                <div class="addModuleForm">
                    <h4 class="addModuleFormTitle">Update Module Element Name</h4>
                    <form method="POST" action="fil">
                        <input type="hidden" name="formType" value="updateModuleElement">
                        <input type="hidden" name="moduleElementId" id="updateModaleIdInput2">
                        <input type="text" id="updateModalNameInput2" name="moduleElementName"><br>
                        <input type="button" id="cancelUpdate2" value="Cancel">
                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
        </section>
    </main>
    <script src="js/fil.js"></script>
</body>
</html>
