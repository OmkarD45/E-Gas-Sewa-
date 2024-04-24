import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageStaff
 */
@WebServlet("/ManageStaff")
public class ManageStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		Connection con;
		PreparedStatement ps;

		int id = Integer.parseInt(request.getParameter("id"));

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

			ps = con.prepareStatement("delete from staff where id = ?");
			ps.setInt(1, id);
			int rowsInserted = ps.executeUpdate();

			if (rowsInserted != 0) {
				// send a success response with delay and redirection
				out.println("<script>alert('Staff deleted successfully!');</script>");
				out.println("<script>setTimeout(function(){window.location.href='dashboard.jsp'},1000);</script>");
			} else {
				out.println("<script>alert('No Staff Found!');</script>");
				out.println("<script>setTimeout(function(){window.location.href='managestaff.jsp'},1000);</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h1>No Record found </h1>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}
	}
}
