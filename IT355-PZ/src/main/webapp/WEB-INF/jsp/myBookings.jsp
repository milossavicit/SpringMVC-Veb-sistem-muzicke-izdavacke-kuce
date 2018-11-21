<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<h1 align="center">My Booking: </h1>
<c:choose>
<c:when test="${!empty bookings}">
    <table class="table table-bordered table-hover" style="width: 90%" align="center">
        <tr>
            <th> Ime </th>
            <th> Datum </th>
            <th> Vreme </th>
            <th> Mesto </th>
            <th> Action </th>
        </tr>
        <c:forEach items="${requestScope.bookings}" var="a">
            <tr>
                <td>${a.artistId}</td>
                <td>${a.datum}</td>
                <td>${a.vreme}</td>
                <td>${a.mesto}</td>
                <td class="last"><a href="${pageContext.request.contextPath}/editBooking/${a.id}"><button type="button" class="btn btn-warning">EDIT</button></a>
                <a href="${pageContext.request.contextPath}/deleteBooking/${a.id}"><button type="button" class="btn btn-danger">DELETE</button></a></td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <br>
        <h5 align="center">Još uvek niste napravili rezervaciju.</h5>
    </c:otherwise>
</c:choose>
</table>
<%@include file="footer.jsp" %>