import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class usersignup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String user_id=req.getParameter("user_id");
        String username=req.getParameter("username");
        String email=req.getParameter("email");
        String phone_no=req.getParameter("phone_no");
        String password=req.getParameter("password");
        String event=req.getParameter("btn_save");
       
        
        out.println(username);
        out.println(email);
        out.println(phone_no);
        out.println(password);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if(event.equals("btn_save"))
       {
            String query1 = "insert into user(username,email,phone_no,password)values('"+username+"','"+email+"','"+phone_no+"','"+password+"')";
            String result = db.Query(query1, "Signup Successful");
            out.println(result);

            
            
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Signup successful');");
            out.println("window.location='user_login.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged
}
