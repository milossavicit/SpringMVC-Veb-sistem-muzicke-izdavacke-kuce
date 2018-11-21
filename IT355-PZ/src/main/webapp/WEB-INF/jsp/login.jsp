<%-- 
    Document   : login
    Created on : Mar 12, 2018, 6:10:54 PM
    Author     : Milos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<div class="container col-md-4 col-md-offset-4 mt-3">
    <h1>Login</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="alert alert-success">${msg}</div>
    </c:if>

    <form accept-charset="UTF-8" role="form"  name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>
        <fieldset>
            <div class="form-group">
                <input class="form-control" placeholder="Username" name="username" type="text">
            </div>
            <div class="form-group">
                <input id="password" class="form-control" placeholder="Password" name="password" type="password" value="">
            </div>
            <div class="form-group">
            <input type="checkbox" onclick="myFunction()"><font size="2.5"> Show Password</font>
            </div>
            <input type="submit" name="submit" class="btn btn-outline-primary" value="Submit">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </fieldset>
    </form>
</div>
                        
<%@ include file="footer.jsp" %>
