
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String address = request.getParameter("Address");
		String date=request.getParameter("date");

		Connection con = null;
		PreparedStatement pstmt = null;
		PrintWriter out = response.getWriter();

		try {

			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");

			// Create a prepared statement to insert a new record into the "staff" table
			String sql = "INSERT INTO signupUser VALUES (?, ?, ?, ?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, mobile);
			pstmt.setString(4, password);
			pstmt.setString(5, address);
			pstmt.setString(6, date);

			// Execute the statement
			int rowsInserted = pstmt.executeUpdate();
			if (rowsInserted > 0) {
				out.println("<html><head><style>");
				out.println("body {background-color: #f2f2f2; font-family: Arial, sans-serif;}");
				out.println("h2 {color: #4CAF50;}");
				out.println("a {color: #008CBA;}");
				out.println(".container {margin: auto; width: 50%; padding: 10px;}");
				out.println("</style></head><body>");
				out.println("<div class='container'>");
				out.println("<h2>You have Registered Successfully</h2>");
				out.println("<a href='SignUp.jsp'>Register another member</a><br>");
				out.println("<a href='customer.jsp'>Back to home</a>");
				out.println("</div></body></html>");

			} else {
				out.println("<html><body><h2>Error while regestering new member</h2></body></html>");
			}

		} catch (Exception e) {
			out.println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
}
