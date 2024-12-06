import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;  // For formatting the date
import java.util.Date;  // For getting the current date
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author piyush
 */
public class returnbooks extends HttpServlet {

  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    PrintWriter out = resp.getWriter();

    // Retrieve parameters
    String accept_id = req.getParameter("accept_id");
    String book_id = req.getParameter("book_id");
    String bookname = req.getParameter("bookname");
    String bookauthor = req.getParameter("bookauthor");
    String book_img = req.getParameter("book_img");
    String Category_name = req.getParameter("Category_name");
    String copies = req.getParameter("copies");
    String price = req.getParameter("price");
    String book_description = req.getParameter("book_description");
    String date = req.getParameter("date");
    String event = req.getParameter("btn_save");

    // Session attributes
    HttpSession session = req.getSession(false); 
    String username = session != null ? (String) session.getAttribute("username") : null;

    // Current date
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String redate = sdf.format(new Date());

    // Validate inputs
    if (accept_id == null || book_id == null || bookname == null || bookauthor == null || username == null) {
        out.println("Error: Missing required parameters.");
        return;
    }

    // Database operations
    DatabaseConnection db = new DatabaseConnection();
    String dbStatus = db.Connectdb();
    if (!dbStatus.contains("successfully")) {
        out.println("Error: " + dbStatus);
        return;
    }

    if ("btn_save".equals(event)) {
        try {
            String query1 = "INSERT INTO returnbooks (accept_id, book_id, bookname, bookauthor, book_img, Category_name, copies, price, book_description, username, date, redate) " +
                            "VALUES ('" + accept_id + "', '" + book_id + "', '" + bookname + "', '" + bookauthor + "', '" + book_img + "', '" + Category_name + "', '" + copies + "', '" + price + "', '" + book_description + "', '" + username + "', '" + date + "', '" + redate + "')";
            String result1 = db.Query(query1, "Book Returned");

            String query2 = "UPDATE books SET copies = copies + 1 WHERE book_id = '" + book_id + "' AND copies >= 0";
            String result2 = db.Query(query2, "Book Quantity Updated");

            String query3 = "DELETE FROM accepted_borrow WHERE accept_id = '" + accept_id + "'";
            String result3 = db.Query(query3, "Accepted Borrow Record Deleted");

            if ("Book Returned".equals(result1) && "Book Quantity Updated".equals(result2) && "Accepted Borrow Record Deleted".equals(result3)) {
                out.println("<script>");
                out.println("alert('Book return process completed successfully.');");
                out.println("window.location='books.jsp';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('Error in processing book return. Please check logs for details.');");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            db.closeConnection(); // Close the database connection
        }
    }
}
}
