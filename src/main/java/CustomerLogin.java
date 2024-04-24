
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		Statement st;
		
		String mobileNo = request.getParameter("phone");
		String password = request.getParameter("password");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");
			ps = con.prepareStatement("select mobile_number, password from ApproveConnection "
					+ " where mobile_number = ? and password = ?");
			ps.setString(1, mobileNo);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				response.sendRedirect("dashboardUser.jsp");
				HttpSession session=request.getSession();
				session.setAttribute("mobileno", mobileNo);
			} else {

				pw.println("<script>alert('Invalid Username or Password');</script>");
				pw.println("<script>setTimeout(function(){window.location.href='customer.jsp'},1000);</script>");
				
//				request.setAttribute("errorMessage", "Invalid username or password");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("customer.jsp");
//				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
