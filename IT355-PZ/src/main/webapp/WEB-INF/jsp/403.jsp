<%-- 
    Document   : 403
    Created on : Mar 12, 2018, 5:50:51 PM
    Author     : Milos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>403</title>
    </head>
    <body>
        <h1>You are not allowed to see this page</h1>
        <c:choose>
            <c:when test="${empty username}">
                <h2>Login</h2>
            </c:when>
            <c:otherwise>
                <h2>Korisniku ${username} nije dozvoljen pristup!</h2>
            </c:otherwise>
        </c:choose>
        <a href="${pageContext.request.contextPath}">Početna</a>
    </body>
</html>
