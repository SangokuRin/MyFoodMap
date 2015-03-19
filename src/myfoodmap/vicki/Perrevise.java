package myfoodmap.vicki;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myfoodmap.lpw.MD5code;

public class Perrevise extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession(false);
		String jsp="";
		jsp=session==null?"login.jsp":session.getAttribute("login")==null?"login.jsp":"revise.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(jsp);
		rd.include(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		boolean login = false;
		String password="",name="",sql="",email="",accountsession="";
		String account =request.getParameter("account");  //前端給後端資料
		System.out.println(account);
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		Connection conn = null;
		ResultSet rs = null;
		JDBC jdbc = new JDBC();
		MD5code code = new MD5code(); 


		if (session != null){
			accountsession = (String) session.getAttribute("account");
			if (accountsession != null){
				if (account.equals(accountsession)){
					name = request.getParameter("name");
					password = request.getParameter("password");
					email = request.getParameter("email");
					if (password.equals("")){
						password = code.md5(password);
						sql = "UPDATE MapUser SET UName = '"+name+"' , UEmail = '"+email+"' where UAcc='"+accountsession+"'";
					}
					else {
						password = code.md5(password);
						sql = "UPDATE MapUser SET UName = '"+name+"' , UPw = '"+password+"' , UEmail = '"+email+"' where UAcc='"+accountsession+"'";
					}

					System.out.println(name);
					System.out.println(email);
					conn = jdbc.MsSQLConnection(request.getServletContext());
					System.out.println(sql);
					rs = jdbc.Data(conn, sql, false);
					session.setAttribute("name", name);
					session.setAttribute("email", email);
					System.out.println(session.getAttribute("name"));
					System.out.println(session.getAttribute("email"));
					login=true;
				}
			}
		}

		if (login == true){
			session.setAttribute("revisemessage", "會員資料修改成功");
			out.println("<script>");    
			out.println("alert('會員資料修改成功!!!');");  
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("revise.jsp");
			rd.include(request, response);
		} else {
			request.setAttribute("logoutmessage", "您太久沒有使用，系統已自動");
			RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
			rd.include(request, response);
		}


		try {
			if (conn != null){
				conn.close();
			}
			
			if (rs != null){
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
