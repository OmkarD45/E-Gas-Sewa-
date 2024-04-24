<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reject Connection</title>
<style type="text/css">
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
			<h2>Rejected Connections</h2>
		</caption>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Address</th>
			<th>Date</th>
		</tr>
		<%
		Connection con;
		PreparedStatement ps, ps1, ps2;
		Statement st;
		ResultSet rs, rs1;
		DatabaseMetaData dbmd;
		ResultSetMetaData rsmd;

		try {
			// load a driver
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/project?useSSL=false";
			String user = "root";
			String pass = "";
			con = DriverManager.getConnection(url, user, pass);
			String mobile=request.getParameter("mobile");
			ps = con.prepareStatement("select * from signupUser where mobile_number=?");
			ps.setString(1, mobile);
			rs = ps.executeQuery();

			while (rs.next()) {

				ps1 = con.prepareStatement("insert into rejectconnection values(?,?,?,?,?)");
				//name
				ps1.setString(1, rs.getString(1));
				//email
				ps1.setString(2, rs.getString(2));
				//mobile
				ps1.setString(3, rs.getString(3));
				//address
				ps1.setString(4, rs.getString(5));
				//date
				ps1.setString(5, rs.getString(6));

				ps1.executeUpdate();
			} // while rs

			ps1 = con.prepareStatement("select * from rejectconnection");

			rs1 = ps1.executeQuery();
			while (rs1.next()) {
		%>
		<tr>
			<td><%=rs1.getString(1)%></td>
			<td><%=rs1.getString(2)%></td>
			<td><%=rs1.getString(3)%></td>
			<td><%=rs1.getString(4)%></td>
			<td><%=rs1.getString(5)%></td>
		</tr>
		<%
		ps2 = con.prepareStatement("delete from signupUser where mobile_number=?");
		ps2.setString(1, mobile);
		int result = ps2.executeUpdate();
		}
		} // try
		catch (Exception e) {
		System.out.println(e);
		} // catch
		%>
	</table>
	<br />


</body>
</html>