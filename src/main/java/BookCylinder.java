
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

@WebServlet("/BookCylinder")
public class BookCylinder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		Connection con;
		PreparedStatement ps, ps1;
		ResultSet rs;
		Statement st;
		int f=0;
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String qty = request.getParameter("quantity");
		String date=request.getParameter("date");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");

			ps1 = con.prepareStatement("select Reg_no from ApproveConnection where Reg_no=?");
			ps1.setInt(1, id);

			rs = ps1.executeQuery();
			while (rs.next()) {
				f = 1;
				break;
			}

			if(f==1) {
			ps = con.prepareStatement("insert into BookCylinder values(?,?,?,?,?,?)");

			ps.setInt(1, id);
			ps.setString(2, name);
			ps.setString(3, mobile);
			ps.setString(4, address);
			ps.setString(5, qty);
			ps.setString(6, date);
			
			int res = ps.executeUpdate();
			if (res > 0) {
				out.println("<script>alert('Booking Request Successfully Registered');</script>");
				out.println("<script>setTimeout(function(){window.location.href='Payment.jsp'},1000);</script>");
				response.sendRedirect("dashboardUser.jsp");
			} 
//			else {
//				
//				out.println("<script>alert('Record Already found');</script>");
//				out.println("<script>setTimeout(function(){window.location.href='BookCylinder.jsp'},1000);</script>");
//				
//				request.setAttribute("errorMessage", "Please Enter valid data");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("BookCylinder.jsp");
//				dispatcher.forward(request, response);
//			}
			}
			else {
				out.println("<script>alert('Please enter Valid details');</script>");
				out.println("<script>setTimeout(function(){window.location.href='BookCylinder.jsp'},1000);</script>");
				
//				request.setAttribute("errorMessage", "Invalid Data");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("BookCylinder.jsp");
//				dispatcher.forward(request, response);
				
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		finally {
			out.println("<script>alert('Record Already found');</script>");
			out.println("<script>setTimeout(function(){window.location.href='BookCylinder.jsp'},1000);</script>");
			
		}

	}

}
