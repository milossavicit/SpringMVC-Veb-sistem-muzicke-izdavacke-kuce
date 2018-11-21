<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<%@include file="header.jsp" %>

<h1 align="center">Artists: </h1>
<c:if test="${!empty artists}">
    <table class="table table-bordered table-hover" style="width: 50%;" align="center">
        <tr>
            <th> Ime </th>
            <th> Br. albuma </th>
            <th> Br. nagrada </th>
        </tr>
        <c:forEach items="${requestScope.artists}" var="a">
            <tr>
                <td>${a.name}</td>
                <td>${a.brAlbuma}</td>
                <td>${a.brNagrada}</td>               
            </tr>
        </c:forEach>
    </c:if>
</table>
<%@include file="footer.jsp" %>