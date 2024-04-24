
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeliverCylinder")
public class DeliverCylinder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		java.util.Random rand = new java.util.Random();
		int Cid = rand.nextInt(1000) + 1;
		
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("cno"));
		String bstatus = request.getParameter("Status");

		if (bstatus.equalsIgnoreCase("delivered")) {

			String BookingId = "OGBS" + Cid;

			Connection con;
			PreparedStatement ps, ps1, ps2;

			ResultSet rs;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");

				ps = con.prepareStatement("select * from bookcylinder where Reg_no=?");
				ps.setInt(1, id);
				rs = ps.executeQuery();
				while (rs.next()) {

					String sql = "INSERT INTO delivery VALUES (?,?,?,?,?,?,?)";
					ps1 = con.prepareStatement(sql);

					ps1.setInt(1, id);
					ps1.setString(2, bstatus);
					ps1.setString(3, BookingId);
					ps1.setString(4, rs.getString("name"));
					ps1.setString(5, rs.getString("address"));
					ps1.setString(6, rs.getString("mobile_number"));
					ps1.setString(7, rs.getString("date"));

					int res = ps1.executeUpdate();
					if (res > 0) {
						out.println("<script>alert('Successful');</script>");
						out.println(
								"<script>setTimeout(function(){window.location.href='dashboardUser.jsp'},1000);</script>");
						response.sendRedirect("dashboard.jsp");
					} else {

						out.println("<script>alert(' Unsuccessful');</script>");
						out.println(
								"<script>setTimeout(function(){window.location.href='NewBooking.jsp'},1000);</script>");

					}

				} // while

				ps2 = con.prepareStatement("delete from BookCylinder where Reg_no=?");
				ps2.setInt(1, id);
				int result = ps2.executeUpdate();
				

			} catch (Exception e) {
				out.println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");
				e.printStackTrace();
			}

		} // if
		else {
			out.println("<script>alert('only delivered are allowed');</script>");
			out.println("<script>setTimeout(function(){window.location.href='dashboardUser.jsp'},1000);</script>");
			response.sendRedirect("dashboard.jsp");

		} // else

	}

}