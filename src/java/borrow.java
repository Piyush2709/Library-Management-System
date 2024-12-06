import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;  // For formatting the date
import java.util.Date;  // For getting the current date
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class borrow extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        // Retrieve parameters from the request
        String book_id = req.getParameter("book_id");
        String bookname = req.getParameter("bookname");
        String bookauthor = req.getParameter("bookauthor");
        String book_img = req.getParameter("book_img");
        String Category_name = req.getParameter("Category_name");
        String copies = req.getParameter("copies");
        String price = req.getParameter("price");
        String book_description = req.getParameter("book_description");
        String event = req.getParameter("btn_save");

        // Retrieve username from session
        HttpSession session = req.getSession(false); // false: Do not create a new session if one doesn't exist
        String username = (String) session.getAttribute("username");

        // Get the current date
        Date currentDate = new Date();  // Get current date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  // Format the date
        String date = sdf.format(currentDate);  // Format the current date

        // Debug output
        out.println("username: " + username);
        out.println("date: " + date);
        out.println("Book ID: " + book_id);

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if (event.equals("btn_save")) {
            // Insert into the borrow table
            String query1 = "INSERT INTO borrow(book_id, bookname, bookauthor, book_img, Category_name, copies, price, book_description, username, date) " +
                    "VALUES ('" + book_id + "', '" + bookname + "', '" + bookauthor + "', '" + book_img + "', '" + Category_name + "', '" + copies + "', '" + price + "', '" + book_description + "', '" + username + "', '" + date + "')";

            String result1 = db.Query(query1, "Book Requested");
            out.println("Insert result: " + result1);

            // Update the quantity of the book in the books table
            String query2 = "UPDATE books SET copies = copies - 1 WHERE book_id = '" + book_id + "' AND copies > 0";
            out.println("Executing query: " + query2);
            String result2 = db.Query(query2, "Book Quantity Updated");
            out.println("Update result: " + result2);

            // Handle result
            resp.setContentType("text/html;charset=UTF-8");
            if (result2.equals("success")) {
                out.println("<script>");
                out.println("alert('Inventory updated.');");
                out.println("window.location='books.jsp';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Book borrowed successfully.');");
                out.println("window.location='books.jsp';");
                out.println("</script>");
            }
        }
    }
}
