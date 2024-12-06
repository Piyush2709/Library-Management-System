import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class submit_feedback extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String feedback_id=req.getParameter("feedback_id");
        String username=req.getParameter("username");
        String Message=req.getParameter("Message");
        String event=req.getParameter("btn_save");
       
        
        out.println(username);
        out.println(Message);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if(event.equals("btn_save"))
       {
            String query1 = "insert into feedback(username,Message)values('"+username+"','"+Message+"')";
            String result = db.Query(query1, "Feedback Successful");
            out.println(result);

            
            
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            //out.println("alert('Signup successful');");
            out.println("window.location='index.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged
}
