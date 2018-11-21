<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>

<h1 align="center">Korisnici: </h1>
<c:if test="${!empty users}">
    <table class="table table-bordered table-hover" style="width: 80%;" align="center">
        <tr>
            <th> ID </th>
            <th> Username </th>
            <th> First name </th>
            <th> Last name </th>
            <th> Email </th>
            <th> Action </th>
        </tr>
        <c:forEach items="${requestScope.users}" var="u">
            <tr>
                <td>${u.userId}</td>
                <td>${u.username}</td>
                <td>${u.firstname}</td>
                <td>${u.lastname}</td>
                <td>${u.email}</td>
                <td class="last"><a href="${pageContext.request.contextPath}/editUser/${u.userId}"><button type="button" class="btn btn-warning">EDIT</button></a>
                <a href="${pageContext.request.contextPath}/deleteUser/${u.userId}"><button type="button" class="btn btn-danger">DELETE</button></a></td>
            </tr>
        </c:forEach>
    </c:if>
</table>
<%@include file="footer.jsp" %>