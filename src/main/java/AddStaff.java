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

@WebServlet("/AddStaff")
public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data
		int id = Integer.parseInt(request.getParameter("staffid"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");

		Connection con = null;
		PreparedStatement pstmt = null;
		PrintWriter out = response.getWriter();

		try {

			// Connect to the database
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");

			// Create a prepared statement to insert a new record into the "staff" table
			String sql = "INSERT INTO staff VALUES (?, ?, ?, ?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, mobile);
			pstmt.setString(5, address);

			// Execute the statement
			int rowsInserted = pstmt.executeUpdate();
			if (rowsInserted > 0) {
				out.println("<html><head><style>");
				out.println("body {background-color: #f2f2f2; font-family: Arial, sans-serif;}");
				out.println("h2 {color: #4CAF50;}");
				out.println("a {color: #008CBA;}");
				out.println("</style></head><body>");
				out.println("<h2>New staff member added successfully</h2>");
				out.println("<a href='add-staff.jsp'>Add another staff member</a><br>");
				out.println("<a href='dashboard.jsp'>Back to home</a></body></html>");

			} else {
				out.println("<html><body><h2>Error adding new staff member</h2></body></html>");
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
				e.printStackTrace();
			}
		}
	}

}
