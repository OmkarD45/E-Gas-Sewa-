<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Add Staff</title>
	<style>
		form {
			margin: 50px auto;
			width: 500px;
			padding: 20px;
			border: 1px solid #ccc;
			background-color: #f2f2f2;
			border-radius: 5px;
		}
		label {
			display: inline-block;
			width: 100px;
			margin-bottom: 10px;
		}
		input[type=text], input[type=email], input[type=tel], textarea {
			width: 100%;
			padding: 12px;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
			margin-bottom: 20px;
			resize: vertical;
		}
		input[type=submit] {
			background-color: #4CAF50;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			float: right;
		}
		input[type=submit]:hover {
			background-color: #45a049;
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
	<h2>Add Staff</h2>
	<form action="AddStaff" method="post">
		<label for="staffid" required>Staff ID</label>
		<input type="text" id="staffid" name="staffid" required>

		<label for="name">Name</label>
		<input type="text" id="name" name="name" required>

		<label for="email">Email</label>
		<input type="email" id="email" name="email" required>

		<label for="mobile">Mobile No</label>
		<input type="tel" id="mobile" name="mobile" pattern="[0-9]{10}" required>

		<label for="address">Address</label>
		<textarea id="address" name="address" required></textarea>

		<input type="submit" value="Add">
	</form>
</body>
</html>

