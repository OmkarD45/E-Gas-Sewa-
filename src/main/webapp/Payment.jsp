<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Online Water Tax Payment Form</title>
  <style>
  .container {
  width: 80%;
  margin: 0 auto;
  max-width: 600px;
}

form {
  margin: 0 auto;
  width: 100%;
  max-width: 500px;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 10px;
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

h2 {
  text-align: center;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

input[type="text"], input[type="email"], textarea, select {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 10px;
  font-size: 16px;
  font-family: Arial, sans-serif;
}

input[type="number"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 10px;
  font-size: 16px;
  font-family: Arial, sans-serif;
}
input[type="submit"] {
  display: block;
  margin: 0 auto;
}
input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  margin-top: 10px;
}

input[type="submit"]:hover {
  background-color: #3e8e41;
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
  <script>function showPaymentFields() {
	  var paymentMethod = document.getElementById("paymentmethod").value;
	  var upiFields = document.getElementById("upi-fields");
	  var cardFields = document.getElementById("card-fields");
	  if (paymentMethod === "upi") {
	    upiFields.style.display = "block";
	    cardFields.style.display = "none";
	  } else if (paymentMethod === "card") {
	    upiFields.style.display = "none";
	    cardFields.style.display = "block";
	  } else {
	    upiFields.style.display = "none";
	    cardFields.style.display = "none";
	  }
	}
  

  </script>
</head>
<body>
<button class="back-button" onclick="window.history.back()">Back</button>
  <div class="container">
  <form action="Payment" method="post">
    <h2>Online Payment Form</h2>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>
    <label for="address">Address:</label>
    <textarea id="address" name="address" required></textarea>
    <label for="taxamount">Enter Amount:</label>
    <input type="number" id="taxamount" name="taxamount" required>
    <label for="paymentmethod">Select Payment Method:</label>
    <select id="paymentmethod" name="paymentmethod" onchange="showPaymentFields()">
      <option value="">-- Select Payment Method --</option>
      <option value="upi">UPI</option>
      <option value="card">Debit/Credit Card</option>
    </select>
    <div id="upi-fields" style="display: none;">
      <label for="upi">UPI ID:</label>
      <input type="text" id="upi" name="upi">
    </div>
    <div id="card-fields" style="display: none;">
      <label for="cardnumber">Card Number:</label>
      <input type="text" id="card-number" name="cardnumber">
      <label for="card-expiry">Card Expiry:</label>
      <input type="text" id="cardexpiry" name="cardexpiry">
      <label for="cvv">CVV:</label>
      <input type="text" id="cvv" name="cvv">
    </div>
    <input type="submit" value="Pay Now">
  </form>
</div>
</body>
</html>