/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class update_books extends HttpServlet {
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String book_id=req.getParameter("book_id");
        String bookname=req.getParameter("bookname");
        String bookauthor=req.getParameter("bookauthor");
        String book_img=req.getParameter("book_img");
        String Category_name=req.getParameter("Category_name");
        String copies=req.getParameter("copies");
        String price=req.getParameter("price");
        String book_description=req.getParameter("book_description");
        String event=req.getParameter("btn_save");
       
        
        out.println(bookname);
        out.println(bookauthor);
        out.println(book_img);
        out.println(Category_name);
        out.println(copies);
        out.println(price);
        out.println(book_description);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

       
            
            if(event.equals("Update")) 
            {

      String query1 = "Update books set bookname='" +bookname+ "', bookauthor='" +bookauthor+ "',book_img='Img/" +book_img+ "',Category_name='" +Category_name+ "',copies='" +copies+ "',price='" +price+ "',book_description='" +book_description+ "'WHERE book_id='" +book_id+ "'";
      String result = db.Query(query1, "Book Updated"); 
    out.println(result);

}
            else if (event.equals("Delete")) {
            String deleteQuery = "DELETE FROM books WHERE book_id='" + book_id + "'";
            String result = db.Query(deleteQuery, "Record Deleted");
            out.println(result);
        }
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Book Updated successful');");
            out.println("window.location='view_books.jsp';");
            out.println("</script>");
        }
    }
