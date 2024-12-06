import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseConnection {
    private Connection cn = null;
    private Statement st = null;

    // Establish the connection
    public String Connectdb() {
        try {
            // Use the updated driver
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "root");
            return "Database connected successfully.";
        } catch (Exception ex) {
            return "Database connection error: " + ex.getMessage();
        }
    }

    // Execute a query
    public String Query(String sql, String msg) {
        if (cn == null) {
            return "Error: No database connection.";
        }

        try {
            st = cn.createStatement();
            st.executeUpdate(sql);
            return msg;
        } catch (Exception ex) {
            return "SQL Error: " + ex.getMessage();
        }
    }

    // Close the connection (optional)
    public void closeConnection() {
        try {
            if (st != null) st.close();
            if (cn != null) cn.close();
        } catch (Exception ex) {
            System.out.println("Error closing connection: " + ex.getMessage());
        }
    }
}
