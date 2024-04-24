

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		Statement st;
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		int amount = Integer.parseInt(request.getParameter("taxamount"));
		String pmethod = request.getParameter("paymentmethod");
		String upi = request.getParameter("upi");
		String cardnumber = request.getParameter("card-number");
		String cardexpiry = request.getParameter("cardexpiry");
		String cvv = request.getParameter("cvv");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "");

			ps = con.prepareStatement("insert into Payment values(?,?,?,?,?,?,?,?,?)");

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, address);
			ps.setInt(4, amount);
			ps.setString(5, pmethod);
			ps.setString(6, upi);
			ps.setString(7, cardnumber);
			ps.setString(8, cardexpiry);
			ps.setString(9, cvv);
			int res = ps.executeUpdate();
			if (res > 0) {
				out.println("<script>alert('Payment Successful');</script>");
				out.println("<script>setTimeout(function(){window.location.href='dashboardUser.jsp'},1000);</script>");
				response.sendRedirect("dashboardUser.jsp");
			} else {
				
				out.println("<script>alert('Payment Unsuccessful');</script>");
				out.println("<script>setTimeout(function(){window.location.href='Payment.jsp'},1000);</script>");

			}


		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
