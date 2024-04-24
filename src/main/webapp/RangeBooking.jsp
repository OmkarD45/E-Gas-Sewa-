<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

h1, h2 {
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}

th, td {
	text-align: left;
	padding: 8px;
	border: 1px solid #ddd;
}

th {
	background-color: #bb2957;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

@media screen and (max-width: 600px) {
	.navbar a {
		float: none;
		width: 100%;
	}
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="index.jsp"><i class="fas fa-home"></i> Logout</a> <a
			onclick="window.history.back()">Back</a>
	</div>
	<table>
		<caption>
			<h2>Booking Report</h2>
		</caption>
		<tr>
			<th>Reg Id</th>
			<th>Booking Id</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Address</th>
			<th>Date</th>
			<th>Status</th>
		</tr>
		<%
		Connection con;
		PreparedStatement ps;
		Statement st;
		ResultSet rs;
		DatabaseMetaData dbmd;
		ResultSetMetaData rsmd;

		try {
			// load a driver
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project?useSSL=false";
			String user = "root";
			String pass = "";

			String sdate = request.getParameter("startDate");
			String ndate = request.getParameter("endDate");

			con = DriverManager.getConnection(url, user, pass);
			ps = con.prepareStatement("SELECT * FROM Delivery where date BETWEEN ? AND ? ");
			ps.setString(1, sdate);
			ps.setString(2, ndate);
			rs = ps.executeQuery();

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<%
		}

		} // try
		catch (Exception e) {
		System.out.println(e);
		} // catch
		%>


	</table>
</body>
</html>