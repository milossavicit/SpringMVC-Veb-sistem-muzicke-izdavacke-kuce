<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="header.jsp" %>
<div class="container col-md-4 col-md-offset-4 mt-3">
    <h1>Add User</h1>
    <h5 class="text-danger"><i>*Nemojte dodavati korisnika koji već postoji</i></h5>
        <c:url var="post_url" value="/addUser/" />
        <form:form method="POST" action="${post_url}" modelAttribute="user">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
            <div class="form-group">
                <form:input type="hidden" id="userId" class="form-control" placeholder="userId" path="userId" />
                <form:label path="username">Username</form:label>
                <form:input type="username" id="username" class="form-control" path="username" />
            </div>
            <div class="form-group">

                <form:label path="password">Password</form:label>
                <form:input type="password" id="password" class="form-control" path="password" />
            </div>

            <div class="form-group">
                <form:label path="email">E-mail</form:label>
                <form:input type="email" id="email" class="form-control" path="email" />
            </div>
            <div class="form-group">
                <form:label path="firstname">First name</form:label>
                <form:input type="firstname" id="firstname" class="form-control" path="firstname" />
            </div>
            <div class="form-group">
                <form:label path="lastname">Last name</form:label>
                <form:input type="lastname" id="lastname" class="form-control" path="lastname" />
            </div>
            <div class="form-group">
            <input type="checkbox" onclick="myFunction()"><font size="2.5"> Show Password</font>
            </div>
            <button type="submit" class="btn btn-outline-primary">Submit</button>

        </form:form>
</div>        
<%@include file="footer.jsp" %>
