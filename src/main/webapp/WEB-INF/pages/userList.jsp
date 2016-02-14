<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/taglibs/customTaglib.tld"%>
<%--
  Created by IntelliJ IDEA.
  User: Владимир
  Date: 06.02.2016
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users Information</title>
    <!-- Bootstrap CSS -->
    <%-- <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> --%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        .myrow-container {
            margin: 20px;
        }
    </style>
</head>
<body>
<div class="container myrow-container">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">
                <%--<div align=""><b>Users Information</b> </div>--%>
                <div align="left"><a href="getAllUsers">Users Information</a></div>
                <div align="right"><a href="createUser">Add New User</a></div>
            </h3>
        </div>
        <div class="panel-body">
            <c:if test="${empty userList}">
                There are no Users
            </c:if>
            <c:if test="${not empty userList}">

                <form action="searchUser">
                    <div class="row">
                        <div class="col-md-6"><div class="col-md-6">Search Users:</div><div class="col-md-6"> <input type="text" name="searchName" id="searchName" required> </div></div>
                        <div class="col-md-4"><input class="btn btn-success" type='submit' value='Search'/></div>
                    </div>
                </form>

                <table class="table table-hover table-bordered">
                    <thead style="background-color: #bce8f1;">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Admin</th>
                        <th>Timestamp</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <th><c:out value="${offset + user.id + 1}"/></th>
                            <th><c:out value="${user.name}"/></th>
                            <th><c:out value="${user.age}"/></th>
                            <th><c:out value="${user.admin}"/></th>
                            <th><c:out value="${user.timestamp}"/></th>
                            <th><a href="editUser?id=<c:out value='${user.id}'/>">Edit</a></th>
                            <th><a href="deleteUser?id=<c:out value='${user.id}'/>">Delete</a></th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <tag:paginate max="15" offset="${offset}" count="${count}"
                              uri="/" next="&raquo;" previous="&laquo;" />
            </c:if>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <%-- <script src="<c:url value="/resources/js/jquery-2.1.3.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    --%>
</body>
</html>
