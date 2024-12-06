import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piyus
 */
@WebServlet(name = "Add_category", urlPatterns = {"/Add_category"})
public class Add_category extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String Category_id=req.getParameter("Category_id");
        String Category_name=req.getParameter("Category_name");
        String event=req.getParameter("btn_save");
       
        
        out.println(Category_name);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if(event.equals("btn_save"))
       {
            String query1 = "insert into category(Category_name)values('"+Category_name+"')";
            String result = db.Query(query1, "Category Added");
            out.println(result);

            
           
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Category Added successful');");
            out.println("window.location='add_category.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged
}
