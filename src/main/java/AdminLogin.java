
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");

		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		Statement st;
		String u = request.getParameter("username");
		String p = request.getParameter("password");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");
			ps = con.prepareStatement("select * from login " + " where user = ? and pass = ?");
			ps.setString(1, u);
			ps.setString(2, p);
			rs = ps.executeQuery();
			if (rs.next()) {
				response.sendRedirect("dashboard.jsp");
			} else {
				pw.println("<script>alert('Invalid Username or Password');</script>");
				pw.println("<script>setTimeout(function(){window.location.href='admin.jsp'},1000);</script>");
//				response.sendRedirect("dashboardUser.jsp");
				
//				request.setAttribute("errorMessage", "Invalid username or password");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
//				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
