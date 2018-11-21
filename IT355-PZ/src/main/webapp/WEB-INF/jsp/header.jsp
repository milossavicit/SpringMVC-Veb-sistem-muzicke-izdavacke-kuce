<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href='<c:url value="/css/bootstrap.min.css" />'/>
        <!--<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.0.0/lux/bootstrap.min.css" rel="stylesheet" integrity="sha384-GxhP7S92hzaDyDJqbdpcHqV5cFflxAx0Yze/X7vUONp43KK1E8eUWaJIMkit3D0R" crossorigin="anonymous">-->
        <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href='<c:url value="/css/style.css" />'/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>IT355-PZ</title>
        <style>
            td.last {   
                width: 1px;
                white-space: nowrap;
            }
        </style>
    </head>
    <body>
        
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="${pageContext.request.contextPath}"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" 
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
        <c:url var="home"  value="/" />
        <c:url var="about"  value="/about" />
        <c:url var="login"  value="/login" />
        <c:url var="register"  value="/register" />
        <c:url var="addUser"  value="/addUser" />
        <c:url var="users"  value="/users" />
        <c:url var="addArtist"  value="/addArtist" />
        <c:url var="artists"  value="/artists" />
        <c:url var="artistsList"  value="/artistsList" />
        <c:url var="addBooking"  value="/addBooking" />
        <c:url var="booking"  value="/booking" />
        <c:url var="myBookings"  value="/myBookings" />
        
      <li class="nav-item <%=  (pageName.equals("index.jsp")) ? "active" : ""%>">
        <a class="nav-link" href="${home}">Home</a>
      </li>
      
      <sec:authorize access="hasRole('ROLE_USER')">
          <li class="nav-item <%=  (pageName.equals("artistsList.jsp")) ? "active" : ""%>">
            <a class="nav-link" href="${artistsList}">Artists</a>
          </li>
          <li class="nav-item <%=  (pageName.equals("addBooking.jsp")) ? "active" : ""%>">
            <a class="nav-link" href="${addBooking}">Booking</a>
          </li>
          <li class="nav-item <%=  (pageName.equals("myBookings.jsp")) ? "active" : ""%>">
            <a class="nav-link" href="${myBookings}">My Bookings</a>
          </li>
      </sec:authorize>
      
      <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item dropdown <%=  (pageName.startsWith("add")) ? "active" : ""%>">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Add
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item <%=  (pageName.equals("addArtist.jsp")) ? "active" : ""%>" href="${addArtist}">Artist</a>         
          <a class="dropdown-item <%=  (pageName.equals("addUser.jsp")) ? "active" : ""%>" href="${addUser}">User</a>
        </div>
      </li>
      <li class="nav-item dropdown <%=  (pageName.equals("artists.jsp") || pageName.equals("booking.jsp") || pageName.equals("users.jsp")) ? "active" : ""%>">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          List
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item <%=  (pageName.equals("artists.jsp")) ? "active" : ""%>" href="${artists}">Artists</a>
          <a class="dropdown-item <%=  (pageName.equals("booking.jsp")) ? "active" : ""%>" href="${booking}">Booking</a>        
          <a class="dropdown-item <%=  (pageName.equals("users.jsp")) ? "active" : ""%>" href="${users}">Users</a>
        </div>
      </li>
      </sec:authorize>
      <li class="nav-item <%=  (pageName.equals("about.jsp")) ? "active" : ""%>">
        <a class="nav-link" href="${about}">About</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
        <sec:authorize access="isAuthenticated()">
            <c:url value="/j_spring_security_logout" var="logoutUrl" />
            <form type="hidden" action="${logoutUrl}" method="post" id="logoutForm">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
                
            <script>
                function formSubmit() {
                    document.getElementById("logoutForm").submit();
                }
            </script>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="nav-item">              
                    <a class="nav-link" href="#">Welcome ${pageContext.request.userPrincipal.name}</a>
                </li> 
            </c:if>
            <li class="nav-item">              
                <a class="nav-link" href="javascript:formSubmit()">Logout</a>
            </li>   
        </sec:authorize>
        
        <sec:authorize access="!isAuthenticated()">
            <li class="nav-item">
                <a class="nav-link <%=  (pageName.equals("register.jsp")) ? "active" : ""%>" href="${register}">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=  (pageName.equals("login.jsp")) ? "active" : ""%>" href="${login}">Login</a>
            </li>            
        </sec:authorize>     
    </ul>
    </div>
    </nav>
