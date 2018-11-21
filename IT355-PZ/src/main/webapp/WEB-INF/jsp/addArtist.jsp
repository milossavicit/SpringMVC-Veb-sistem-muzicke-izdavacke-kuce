<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@include file="header.jsp" %>
<div class="container col-md-4 col-md-offset-4 mt-3">
    <h1>Add artist</h1>
    <c:url var="addArtist" value="/addArtist" ></c:url>
        <c:url var="post_url" value="/addArtist/" />
        <form:form method="POST" action="${post_url}" modelAttribute="artist">
            <% String success = (String) request.getAttribute("successMsg");%>
            <%= (success != null) ? "<div class=\"alert alert-success\">" + success + "</div>" : ""%>
            <div class="form-group">
                <form:input type="hidden" id="id" class="form-control" placeholder="id" path="id" />
                <form:label path="name">Ime</form:label>
                <form:input type="name" id="name" class="form-control" path="name" />
            </div>
            <div class="form-group">           
                <form:label path="brAlbuma">Br. albuma</form:label>
                <form:input type="brAlbuma" id="brAlbuma" class="form-control" path="brAlbuma" />
            </div>
            <div class="form-group">
                <form:label path="brNagrada">Br. nagrada</form:label>
                <form:input type="brNagrada" id="brNagrada" class="form-control" path="brNagrada" />
            </div>

            <button type="submit" class="btn btn-outline-primary">Submit</button>

        </form:form>
</div>        
<%@include file="footer.jsp" %>
