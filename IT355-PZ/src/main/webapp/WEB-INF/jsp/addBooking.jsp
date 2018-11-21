<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<div class="container col-md-4 col-md-offset-4 mt-3">
    <h2>Booking</h2>
    <h6><i>Rezervišite nastup</i></h6>
    <c:url var="post_url"  value="/addBooking/" />
        <form:form method="POST" action="${post_url}" modelAttribute="booking">
            <% String success = (String) request.getAttribute("successMsg"); %>
            <%= (success != null) ? "<div class=\"alert alert-success\">"+success+"</div>" : "" %>
            <div class="form-group">
                <form:input type="hidden" id="id" class="form-control" placeholder="id" path="id" />
                <form:label for="artistId" path="artistId">Artists</form:label>
                <form:select id="artistId" class="form-control" path="artistId">
                    <form:option value="">Choose an artist</form:option>
                    <form:options items="${requestScope.artists}" itemValue="id" itemLabel="name" />
                </form:select>
            </div>
            <div class="form-group">               
                <form:label path="datum">Datum</form:label>
                <form:input type="datum" id="datum" class="form-control" placeholder="DD.MM.YY." path="datum" />
            </div>
            <div class="form-group">
                <form:label path="vreme">Vreme</form:label>
                <form:input type="vreme" id="vreme" class="form-control" placeholder="HH:MM" path="vreme" />
            </div>
            <div class="form-group">
                <form:label path="mesto">Mesto</form:label>
                <form:input type="mesto" id="mesto" class="form-control" path="mesto" />
            </div>
            
            <button type="submit" class="btn btn-outline-primary">Submit</button>
        </form:form>
</div>

<%@include file="footer.jsp" %>