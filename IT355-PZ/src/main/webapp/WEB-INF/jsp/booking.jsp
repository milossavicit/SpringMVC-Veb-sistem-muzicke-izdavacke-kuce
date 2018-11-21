<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<h1 align="center">Booking: </h1>
<c:choose>
    <c:when test="${!empty bookings}">

    <table class="table table-bordered table-hover" style="width: 90%" align="center">
        <tr>
            <th> ID </th>
            <th> Ime </th>
            <th> Datum </th>
            <th> Vreme </th>
            <th> Mesto </th>
            <th> Korisnik </th>
            <th> Action </th>
        </tr>
        <c:forEach items="${requestScope.bookings}" var="a">
            <tr>
                <td>${a.id}</td>
                <td>${a.artistId}</td>
                <td>${a.datum}</td>
                <td>${a.vreme}</td>
                <td>${a.mesto}</td>
                <td>${a.user.username}</td>
                <td class="last"><a href="${pageContext.request.contextPath}/deleteBooking/${a.id}"><button type="button" class="btn btn-danger">DELETE</button></a></td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <h5 align="center">Tabela booking je prazna. </h5>
    </c:otherwise>
</c:choose>
</table>
<%@include file="footer.jsp" %>