<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="header.jsp" %>
<div class="container col-md-4 col-md-offset-4 mt-3">
    <h1>Registracija</h1>
    <c:url var="register" value="/register" ></c:url>
    <c:url var="post_url" value="/register/" />
    <form:form method="POST" action="${post_url}" modelAttribute="user">
        <% String success = (String) request.getAttribute("successMsg");%>
        <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
        <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
        <div class="form-group">
            <form:input type="username" id="username" class="form-control" placeholder="Username" path="username" />
        </div>
        <div class="form-group">
            <form:input type="password" id="password" class="form-control" placeholder="Password" path="password" />
        </div>

        <div class="form-group">
            <form:input type="email" id="email" class="form-control" placeholder="E-mail" path="email" />
        </div>
        <div class="form-group">
            <form:input type="firstname" id="firstname" class="form-control" placeholder="First name" path="firstname" />
        </div>
        <div class="form-group">
            <form:input type="lastname" id="lastname" class="form-control" placeholder="Last name" path="lastname" />
        </div>
        <div class="form-group">
            <input type="checkbox" onclick="myFunction()"><font size="2.5"> Show Password</font>
        </div>

        <button type="submit" class="btn btn-outline-primary">Submit</button>

    </form:form>
</div>        
<%@include file="footer.jsp" %>
