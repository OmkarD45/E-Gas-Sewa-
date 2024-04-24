<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Date Range Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
    }
    form {
        width: 400px;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0px 0px 5px #ccc;
        border-radius: 5px;
    }
    label {
        display: block;
        font-size: 16px;
        margin-bottom: 10px;
    }
    input[type="date"] {
        padding: 5px;
        font-size: 16px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        box-sizing: border-box;
    }
    input[type="submit"] {
        padding: 10px;
        font-size: 16px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
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
</style>
</head>
<body>
	<div class="navbar">
		<a href="index.jsp"><i class="fas fa-home"></i> Logout</a>
		<a onclick="window.history.back()">Back</a>
	</div>
    <form method="post" action="RangeConnection.jsp">
        <label>Start Date:</label>
        <input type="date" name="startDate" required><br><br>
        <label>End Date:</label>
        <input type="date" name="endDate" required><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
