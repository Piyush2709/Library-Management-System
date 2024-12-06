/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
         PrintWriter out= resp.getWriter();
        
        
        String username=req.getParameter("username");
    String password=req.getParameter("password");
    String event=req.getParameter("Login");
           

//print the input from users

        out.println(username);
        out.println(password);
       
        out.println(event);
        
        
        
        DatabaseConnection db=new DatabaseConnection();
        out.println(db.Connectdb());
        
        
        
        Connection cn=null;
       Statement st=null;
       
        HttpSession session=req.getSession();

        if (event.equals("Login")) {
    if (username.equals("admin") && password.equals("admin")) { // Check if username and password are "admin"
        resp.sendRedirect("admin_dashbord.jsp"); // Redirect directly to admin dashboard
    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "root");
            st = cn.createStatement();
            String pass = null;
            String sql = "select * from user where username='" + username + "' and password='" + password + "'";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                session.setAttribute("username", rs.getString("username"));
                out.println(session.getAttribute("username"));
                resp.sendRedirect("books.jsp");
            } else {
                out.println("Login Failed");
            }
        } catch (Exception ex) {
            out.println(ex.toString());
        }
    }
}
    }
    
    
}
