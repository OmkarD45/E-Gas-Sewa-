<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Form Example</title>
<style>
body {
	font-family: Arial, sans-serif;
	font-size: 16px;
	line-height: 1.5;
	background-color: #f2f2f2;
}

form {
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 20px;
	max-width: 600px;
	margin: 0 auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="text"], select {
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	width: 100%;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #bb2957;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
	float: right;
}

input[type="submit"]:hover {
	background-color: #a2224e;
}

.back-button {
	background-color: #008CBA;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: left;
}

.back-button:hover {
	background-color: #006d8a;
}
</style>
</head>
<body>
<button class="back-button" onclick="window.history.back()">Back</button>
	<h1 align="center">Book Cylinder</h1>
	<form method="post" action="BookCylinder">
		<label for="id"> Connection ID:</label> <input type="text" id="id"
			name="id" required> <label for="name">Name:</label> <input
			type="text" id="name" name="name" required> <label
			for="mobile">Mobile Number:</label> <input type="text" id="mobile"
			name="mobile" required> <label for="address">Address:</label>
			
		<input type="text" id="address" name="address" required> 
		<label
			for="date">Date</label> <input type="date" id="date"
			name="date" required>
		<label
			for="quantity">Quantity of Cylinder:</label> <select id="quantity"
			name="quantity">
			<option value="10">10 kg</option>
			<option value="15">15 kg</option>
			<option value="20">20 kg</option>
		</select> <input type="submit" value="Submit">
	</form>
</body>
</html>
