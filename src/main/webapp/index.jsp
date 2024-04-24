<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Online Gas Booking System</title>
<style>
nav {
	background-color: #333;
	color: #fff;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
}

nav ul li {
	margin-right: 20px;
}

nav ul li:last-child {
	margin-right: 0;
}

nav a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}

nav a:hover {
	color: #ccc;
}

h1 {
	text-align: center;
	margin-top: 50px;
}

p {
	text-align: center;
	font-size: 18px;
}
</style>
</head>
<body>
	<nav>
		<h2>Online Gas Booking System</h2>
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="admin.jsp">Admin</a></li>
			<li><a href="customer.jsp">Customer</a></li>
		</ul>
	</nav>
	<h1>Welcome to the Online Gas Booking System</h1>
	<img src="gas.jpg" alt="Image description" height="500" width="500"
		style="display: block; margin: auto;">


</body>
</html>
