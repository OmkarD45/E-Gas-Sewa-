<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Responsive Form</title>
<style>
/* Style for the form container */
.form-container {
	max-width: 500px;
	margin: auto;
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 5px;
}

/* Style for the input field */
input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-radius: 4px;
	background-color: #fff;
	font-size: 16px;
	/* Required CSS */
	/* Highlight input field when invalid */
	border: 2px solid #ff6666;
}

/* Style for the submit button */
input[type=submit] {
	background-color: #008CBA;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

/* Style for the submit button on hover */
input[type=submit]:hover {
	background-color: #006d8a;
}

/* Style for form label */
label {
	font-size: 16px;
	font-weight: bold;
}

/* Style for form message */
.form-message {
	color: #ff6666;
	font-size: 14px;
	margin-top: 5px;
}

/* Media query for responsiveness */
@media screen and (max-width: 600px) {
	.form-container {
		max-width: 100%;
	}
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
	<div class="form-container">
		<form action="ManageStaff" action="get">
			<label for="inputField">Enter Staff ID to Delete:</label> <input type="text"
				id="id" name="id" placeholder="Enter staff id"
				required>
			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>



