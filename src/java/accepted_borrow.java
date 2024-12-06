import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class accepted_borrow extends HttpServlet {
    @Override
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String book_id = req.getParameter("book_id");
        String borrow_id = req.getParameter("borrow_id");
        String bookname = req.getParameter("bookname");
        String bookauthor = req.getParameter("bookauthor");
        String book_img = req.getParameter("book_img");
        String Category_name = req.getParameter("Category_name");
        String copies = req.getParameter("copies");
        String price = req.getParameter("price");
        String book_description = req.getParameter("book_description");
        String username = req.getParameter("username");
        String event = req.getParameter("btn_save");
        String status = req.getParameter("status");
        
Date currentDate = new Date();  // Get current date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  // Format the date
        String date = sdf.format(currentDate); 
        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        
            if (status.equals("Borrow Accept")) {
                 String query1 = "INSERT INTO accepted_borrow(borrow_id,book_id, bookname, bookauthor, book_img, Category_name, copies, price, book_description, username, date) " +
                    "VALUES ('" + borrow_id + "','" + book_id + "', '" + bookname + "', '" + bookauthor + "', '" + book_img + "', '" + Category_name + "', '" + copies + "', '" + price + "', '" + book_description + "', '" + username + "', '" + date + "')";
            String result = db.Query(query1, "Record Inserted");
            out.println(result);

                String query2 = "DELETE FROM borrow WHERE book_id='" + book_id + "'";
                 result = db.Query(query2, "Record Inserted");
            out.println(result);;
             resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Completed successful');");
            out.println("window.location='admin_dashbord.jsp';");
            out.println("</script>");
                
            } else if (status.equals("Borrow Canceled")) {
                 String query1 = "INSERT INTO cancelled_borrow(borrow_id,book_id, bookname, bookauthor, book_img, Category_name, copies, price, book_description, username, date) " +
                    "VALUES ('" + borrow_id + "','" + book_id + "', '" + bookname + "', '" + bookauthor + "', '" + book_img + "', '" + Category_name + "', '" + copies + "', '" + price + "', '" + book_description + "', '" + username + "', '" + date + "')";
            String result = db.Query(query1, "Record Inserted");
            out.println(result);

                String query2 = "DELETE FROM borrow WHERE borrow_id='" + borrow_id + "'";
                 result = db.Query(query2, "Record Inserted");
            out.println(result);;

            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Cancelled successful');");
            out.println("window.location='admin_dashbord.jsp';");
            out.println("</script>");// Close database connection (modify as per your DatabaseConnection class)
        }
    }

    // Other overridden methods remain unchanged
}
