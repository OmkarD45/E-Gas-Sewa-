<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<title>User Registration Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #eee;
}

form {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px #ccc;
	max-width: 400px;
	margin: 0 auto;
	text-align: center;
}

h2 {
	margin-top: 0;
	color: #333;
	font-weight: bold;
	text-transform: uppercase;
	font-size: 24px;
	margin-bottom: 30px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #333;
	text-transform: uppercase;
	font-size: 14px;
	text-align: left;
}

input[type=text], input[type=email], input[type=tel], input[type=password]
	{
	padding: 15px;
	border-radius: 5px;
	border: none;
	margin-bottom: 20px;
	width: 100%;
	box-sizing: border-box;
	background-color: #f2f2f2;
	color: #666;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	outline: none;
}

input[type=text]:focus, input[type=email]:focus, input[type=tel]:focus,
	input[type=password]:focus {
	background-color: #fff;
	color: #333;
}

input[type=submit] {
	background-color: #333;
	color: #fff;
	padding: 15px 30px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
	width: 100%;
	box-sizing: border-box;
	text-transform: uppercase;
	font-size: 16px;
	font-weight: bold;
	transition: all 0.3s ease;
}

input[type=submit]:hover {
	background-color: #555;
	transform: translateY(-2px);
	box-shadow: 0px 5px 10px #888;
}

.btn {
	background-color: #fff;
	color: #333;
	padding: 15px 30px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 20px;
	width: 100%;
	box-sizing: border-box;
	text-transform: uppercase;
	font-size: 16px;
	font-weight: bold;
	transition: all 0.3s ease;
	border: 2px solid #333;
}

.btn:hover {
	background-color: #333;
	color: #fff;
	transform: translateY(-2px);
	box-shadow: 0px 5px 10px #888;
}

button:hover {
	background-color: #555;
	transform: translateY(-2px);
	box-shadow: 0px 5px 10px #888;
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
	<button class="back-button"
		onclick="window.location.href='customer.jsp'">Back</button>
	<form action="SignUp" method="post">
		<h2>User Connection Form</h2>
		<label for="fullname">Full Name:</label> <input type="text"
			id="fullname" name="fullname" required> <label for="email">Email:</label>
		<input type="email" id="email" name="email" required> <label
			for="mobile">Mobile Number:</label> <input type="tel" id="mobile"
			name="mobile" pattern="[0-9]{10}" required> <label
			for="Address">Address:</label> <input type="text" id="Address"
			name="Address" required>
			<label
			for="date">Date</label> <input type="date" id="date"
			name="date" min="<%= java.time.LocalDate.now() %>" max="<%= java.time.LocalDate.now() %>" required>
			 <label
			for="password">Password:</label> <input type="password" id="password"
			name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,}" title="Must contain at least one 
			number, one uppercase letter, one lowercase letter, and at least 4 or more characters" required> <input type="submit"
			value="Register">
		<p>
			Already have an account? <a href="customer.jsp">Login here</a>
		</p>
	</form>
</body>
</html>
