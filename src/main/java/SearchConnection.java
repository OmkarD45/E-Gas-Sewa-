
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

@WebServlet("/SearchConnection")
public class SearchConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		Statement st;
		int number = Integer.parseInt(request.getParameter("cno"));
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");
			ps = con.prepareStatement("select * from approveconnection where Reg_no=?");
			ps.setInt(1, number);

			rs = ps.executeQuery();
			if (rs.next()) {

				out.println("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<meta charset=\"UTF-8\">\r\n"
						+ "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
						+ "<title>Payment Details</title>\r\n" + "<style>\r\n" + "* {\r\n"
						+ "	box-sizing: border-box;\r\n" + "}\r\n" + "\r\n" + "body {\r\n" + "	margin: 0;\r\n"
						+ "	font-family: Arial, sans-serif;\r\n" + "	font-size: 16px;\r\n"
						+ "	line-height: 1.5;\r\n" + "}\r\n" + "\r\n" + ".navbar {\r\n" + "	background-color: #333;\r\n"
						+ "	overflow: hidden;\r\n" + "}\r\n" + "\r\n" + ".navbar a {\r\n" + "	float: left;\r\n"
						+ "	display: block;\r\n" + "	color: #f2f2f2;\r\n" + "	text-align: center;\r\n"
						+ "	padding: 14px 16px;\r\n" + "	text-decoration: none;\r\n" + "}\r\n" + "\r\n"
						+ ".navbar a:hover {\r\n" + "	background-color: #ddd;\r\n" + "	color: black;\r\n" + "}\r\n"
						+ "\r\n" + "h1, h2 {\r\n" + "	text-align: center;\r\n" + "}\r\n" + "\r\n" + "table {\r\n"
						+ "	border-collapse: collapse;\r\n" + "	width: 100%;\r\n" + "	margin-top: 20px;\r\n" + "}\r\n"
						+ "\r\n" + "th, td {\r\n" + "	text-align: left;\r\n" + "	padding: 8px;\r\n"
						+ "	border: 1px solid #ddd;\r\n" + "}\r\n" + "\r\n" + "th {\r\n"
						+ "	background-color: #bb2957;\r\n" + "	color: white;\r\n" + "}\r\n" + "\r\n"
						+ "tr:nth-child(even) {\r\n" + "	background-color: #f2f2f2;\r\n" + "}\r\n" + "\r\n"
						+ "@media screen and (max-width: 600px) {\r\n" + "	.navbar a {\r\n"
						+ "		float: none;\r\n" + "		width: 100%;\r\n" + "	}\r\n" + "}\r\n" + "</style>\r\n"
						+ "</head>");

				out.println("<body>");
				out.print("<div class=\"navbar\">\r\n"
						+ "		<a href=\"index.jsp\"><i class=\"fas fa-home\"></i> Logout</a>\r\n" + "		<a onclick=\"window.history.back()\"> Back</a>\r\n" + "	</div>\r\n"
						+ "	<table>\r\n" + "		<caption>\r\n" + "			<h2>Connection details</h2>\r\n"
						+ "		</caption>\r\n" + "		<tr>\r\n" + "			<th>Reg_no</th>\r\n"
						+ "			<th>Name</th>\r\n" + "			<th>Email</th>\r\n" + "			<th>Mobile</th>\r\n"
						+ "			<th>Address</th>\r\n" + "			<th>Connection Date</th>\r\n" + "\r\n" + "\r\n" + "		</tr>");

				out.print("		<tr>\r\n" + "			<td>"+rs.getInt(1)+"</td>\r\n"
						+ "			<td>"+rs.getString(2)+"</td>\r\n" + "			<td>"+rs.getString(3)+"</td>\r\n"
						+ "			<td>"+rs.getString(4)+"</td>\r\n" + "			<td>"+rs.getString(6)+"</td>\r\n"
						+ "			<td>"+rs.getInt(7)+"</td>\r\n"	+ "\r\n" + "		</tr>");

				out.println("</table></body></html>");

			} else {
				request.setAttribute("errorMessage", "Invalid ID");
				RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
