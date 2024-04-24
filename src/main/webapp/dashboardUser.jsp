<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
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


.sidebar {
  background-color: #f1f1f1;
  height: 100%;
  position: fixed;
  left: 0;
  top: 39;
  width: 200px;
}

.sidebar ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.sidebar ul li {
  border-bottom: 1px solid #ccc;
  position: relative;
}

.sidebar ul li:last-child {
  border-bottom: none;
}

.sidebar ul li a {
  color: #333;
  display: block;
  padding: 12px 16px;
  text-decoration: none;
}

.sidebar ul li a:hover {
  background-color: #ddd;
}

.sidebar ul li ul {
  display: none;
  position: absolute;
  left: 200px;
  top: 0;
  background-color: #fff;
  width: 200px;
  z-index: 1;
}

.sidebar ul li:hover ul {
  display: block;
}

.sidebar ul li ul li a {
  color: #333;
  display: block;
  padding: 8px 16px;
  text-decoration: none;
}

.sidebar ul li ul li a:hover {
  background-color: #ddd;
}

</style>
</head>
<body>
<div>
	<nav>
		<h2>E Gas Sewa</h2>
		<ul><!--  
			<li><a href="index.jsp">Home</a></li>
			<li><a href="admin.jsp">Admin</a></li>
			-->
			<li><a href="index.jsp">Logout</a></li>
		</ul>
	</nav>

</div>
<div class="sidebar">
     <!--  -->
      <ul>
        <li><a href="BookCylinder.jsp">Book Cylinder</a></li>
      </ul>
      <ul>
        <li><a href="BookingHistory.jsp">Booking History</a></li>
      </ul>
      
    </li>
      <ul>
        <li><a href="SearchBooking.jsp">Search Booking</a></li>
      </ul>
    </li>
  </ul>
</div>
<div class="image-container">
  <h1 class="heading"></h1>
  <img src="customer.jpg" alt="Image description" height="500" width="500" style="display: block; margin: auto;">
</div>

</body>
</html>