<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Connection Request</title>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
}

.navbar {
	background-color: #333;
	overflow: hidden;
}

.navbar a {
	float: left;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

@media screen and (max-width: 600px) {
	.navbar a {
		float: none;
		width: 100%;
	}
}

.search-form {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	margin: 20px;
}

label {
	font-weight: bold;
	margin-right: 10px;
}

input[type="text"] {
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-right: 10px;
}

input[type="submit"] {
	padding: 5px 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="index.jsp"><i class="fas fa-home"></i> Logout</a> 
		<a onclick="window.history.back()"> Back</a>
	</div>
	<form class="search-form" action="BookingTable.jsp" method="post">
		<label for="cno">Booking number</label> <input type="text" id="cno"
			name="cno" required> <input type="submit" value="Submit">
	</form>
</body>
</html>
</body>
</html>