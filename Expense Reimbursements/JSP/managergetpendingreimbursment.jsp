<%@page import="com.model.EmployeeDao"%>
<%@page import="com.pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  margin: 0;
}

.header {
  background-color: #9cdef0;
  padding: 20px;
  text-align: center;
}
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
.button {
  background-color: #777;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.button {
	background-color: #777;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.sidebar {
	position: fixed;
	width: 200px;
	height: 250%;
	background: #4b4276;
	padding: 30px 0;
}

.sidebar h2 {
	color: #fff;
	text-transform: uppercase;
	text-align: center;
	margin-bottom: 30px;
}

.sidebar ul {
	list-style: none;
	margin: 0;
}

.sidebar ul li {
	text-align: center;
	padding: 10px;
	position: relative;
	width: 130px;
	background: #4b4276;
	padding: 15px 0;
	background-color: #4b4276;
	border-top: 1px solid #BDC3C7;
	border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	border-top: 1px solid rgba(225, 225, 225, 0.05);
}
.sidebar ul ul {
	transition: all 0.3s;
	opacity: 0;
	position: absolute;
	visibility: hidden;
	left: 70%;
	top: 0%;
}

.sidebar ul li:hover>ul {
	opacity: 1;
	visibility: visible;
}

.sidebar ul li a {
	color: #fff;
	text-decoration: none;
	display: block;
}

.main_content {
	width: 100%;
	margin-left: 200px;
}

.main_content{
	padding: 20px;
	background: #fff;
	color: #717171;
	border-bottom: 1px solid #e0e4e8;
}

.main_content .info {
	margin: 20px;
	color: #717171;
	line-height: 25px;
}

.main_content .info div {
	margin-bottom: 20px;
}

.main-content{
display: flex;
justify-content: center;
width: 70%;
margin-left: auto;
margin-right: auto;

}

.center {
  text-align:center
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #777;
   color: white;
   text-align: center;
}
</style>

<body>

<div class="header">
  <p>Expense Reimbursement System (ERS)</p>
</div>

<div class="sidebar">
			<h2>MANAGER DASHBOARD</h2>
			<ul>
				<li><a href="managergetallemployee.jsp">View All Employees</a></li>
				<li><a href="managerudatereimbursementstatus.jsp">Change Reimbursement Status</a></li>
				<li><a href="managergetpendingreimbursment.jsp">View Pending Request(s)</a></li>
			</ul>
		</div>

	<%@page import="com.model.EmployeeDao"%>
	<jsp:useBean id="obj" class="com.pojo.Employee" />

	<jsp:setProperty property="*" name="obj" />
<div class="center">
	<a href="manager.jsp" class="button">BACK</a>
	<a href="home.jsp" class="button">LOG-OUT</a>
	<br>
</div>

	<div class="center">
	<h2>EMPLOYEE DATA</h2>
	</div>

	<div class="main-content">
	<%
		List<Employee> list = EmployeeDao.getEmpByStatus();
		request.setAttribute("list", list);
	%>
	<table>

		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Amount</th>
			<th>Reimbursement Type</th>
			<th>Reimbursement Status</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getEmp_id()}</td>
				<td>${u.getEmp_name()}</td>
				<td>${u.getEmp_amount()}</td>
				<td>${u.getEmp_type()}</td>
				<td>${u.getEmp_status()}</td>
		</tr>
		</c:forEach>
	</table>
	
	
		</div>
		

	<div class="footer">
  <p>@2020. All Rights reserved by Reimbursement System (ERS)</p>
    </div>
   
	
</body>
</html>