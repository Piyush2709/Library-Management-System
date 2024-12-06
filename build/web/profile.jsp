<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Profile</title>
                <style>
                          
* {
  box-sizing: border-box;
}
#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 16px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 4px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
    .table-container {
  margin-bottom: 20px; /* Add space between tables */
}

@media (max-width: 768px) {
  .table-container {
    margin-bottom: 15px; /* Adjust space for smaller screens */
  }
}
button {
  background-color: #1B4D3E !important; /* Overrides Bootstrap */
  color: white !important;
}


    
                </style>
	</head>

<body>
    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Library management system<span>.</span></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarsFurni">
        <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item "><a class="nav-link" href="books.jsp">Books</a></li>
          <li class="nav-item"><a class="nav-link" href="user_login.jsp">Logout</a></li>
          <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
        </ul>
          <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
	<li class="nav-item active"><a class="nav-link active" href="profile.jsp"><img src="images/user.svg"></a></li>					
	</ul>
      </div>
    </div>
  </nav>

    <main id="main" class="main">
<div> 
    <% // Retrieve the menu details from the request 
String book_id = request.getParameter("book_id"); 
String bookname = request.getParameter("bookname"); 
String bookauthor = request.getParameter("bookauthor"); 
String Category_name = request.getParameter("Category_name");                        
String price = request.getParameter("price"); 
String book_description = request.getParameter("book_description"); 
String book_img = request.getParameter("book_img"); 
String copies = request.getParameter("copies"); 
String date = request.getParameter("date");
%> 
</div>
<div class="table-container">
   <div class="col-12">
    <div class="card recent-sales overflow-auto">
        <div class="card-body">
            <h5 class="card-title">Borrow Accepted <span>| Today</span></h5>

            <table id="myTable">
                <tr>
                    <th scope="col">#</th>
                    <th>Student Name</th>
                    <th>Book Name</th>
                    <th>Author Name</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Action</th>
         
                </tr>

                <% 
                int counter = 1;
                Connection cn = null; 
                Statement st = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "root");
                    st = cn.createStatement();
                     String sql = "SELECT * FROM accepted_borrow WHERE username='" + session.getAttribute("username") + "'";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {
                %>
                <tr>
                    <form action="returnbooks" method="POST">
                        <th scope="row"><%= counter++ %></th>
                        <input type="hidden" name="username" value="<%= rs.getString("username") %>">
                        <td><%= rs.getString("username") %></td>
                        <input type="hidden" name="accept_id" value="<%= rs.getString("accept_id") %>">
                        <input type="hidden" name="book_id" value="<%= rs.getString("book_id") %>">
                        <td><%= rs.getString("bookname") %></td>
                        <input type="hidden" name="bookname" value="<%= rs.getString("bookname") %>">
                        
                        <td><%= rs.getString("bookauthor") %></td>
                        <input type="hidden" name="bookauthor" value="<%= rs.getString("bookauthor") %>">

                        <td><%= rs.getString("Category_name") %></td>
                        <input type="hidden" name="Category_name" value="<%= rs.getString("Category_name") %>">

                        <td><%= rs.getString("book_description") %></td>
                        <input type="hidden" name="book_description" value="<%= rs.getString("book_description") %>">
                        <input type="hidden" name="copies" value="<%= rs.getString("copies") %>">
                        <input type="hidden" name="book_img" value="<%= rs.getString("book_img") %>">
                        <input type="hidden" name="price" value="<%= rs.getString("price") %>">
                        <input type="hidden" name="borrow_id" value="<%= rs.getString("borrow_id") %>">
                        <input type="hidden" name="date" value="<%= rs.getString("date") %>">
                        <td>
                            <button type="submit" class="btn btn-primary" name="btn_save" value="btn_save">Return</button>
                        </td>
                    </form>
                </tr>
                <% 
                    }
                } catch (Exception ex) {
                    out.println("Error: " + ex.toString());
                } 
                %>
            </table>

            <script>
                function myFunction() {
                    var input, filter, table, tr, td, i, txtValue;
                    input = document.getElementById("myInput");
                    filter = input.value.toUpperCase();
                    table = document.getElementById("myTable");
                    tr = table.getElementsByTagName("tr");
                    for (i = 0; i < tr.length; i++) {
                        td = tr[i].getElementsByTagName("td")[0];
                        if (td) {
                            txtValue = td.textContent || td.innerText;
                            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                tr[i].style.display = "";
                            } else {
                                tr[i].style.display = "none";
                            }
                        }
                    }
                }
            </script>
        </div>
    </div>
</div>
</div>


<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
                </div>
              </div>
            </div>
   
  <div class="table-container">
  <div class="col-12">
    <div class="card recent-sales overflow-auto">
      <div class="card-body">
        <h5 class="card-title">Your Borrow <span>| Cancelled</span></h5>
        <table id="myTable">
    <thead>
        <tr>
            <th>#</th>
            <th>Student Name</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Date</th>
            <th>Status</th>
           <!-- <th>Action</th> <!-- Fixed header alignment -->
        </tr>
    </thead>
    
        <% 
        counter = 1;
        try {
            String sql = "SELECT * FROM cancelled_borrow WHERE username='" + session.getAttribute("username") + "'";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
        %>
        <tr>
            <td><%= counter++ %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("bookname") %></td>
            <td><%= rs.getString("bookauthor") %></td>
            <td><%= rs.getString("date") %></td>
            <td>Cancelled</td>
            <td>
                <form action="borrow" method="POST" style="margin: 0;">
                    <input type="hidden" name="book_id" value="<%= book_id %>">
                     <input type="hidden" name="bookname" value="<%= bookname %>">
                     <input type="hidden" name="bookauthor" value="<%= bookauthor %>">
                     <input type="hidden" name="Category_name" value="<%= Category_name %>">
                     <input type="hidden" name="book_description" value="<%= book_description %>">
                     <input type="hidden" name="copies" value="<%= copies %>">
                     <input type="hidden" name="book_img" value="<%= book_img %>">
                     <input type="hidden" name="price" value="<%= price %>">
                      <input type="hidden" name="date" value="<%= date %>">
                    <!--<button type="submit" class="btn btn-primary">Borrow Again</button> -->
                </form>
            </td>
        </tr>
        <% 
            }
        } catch (Exception ex) {
            out.println(ex.toString());
        } 
        %>
    
</table>
      </div>
    </div>
  </div>
</div>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>


                </div>

              </div>
            </div>
            
            
 <div class="table-container">
  <div class="col-12">
    <div class="card recent-sales overflow-auto">
      <div class="card-body">
        <h5 class="card-title">Return Books</h5>
        <table id="myTable">
    <thead>
        <tr>
            <th>#</th>
            <th>Student Name</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Borrow Date</th>
            <th>Return Date</th>
           <!-- <th>Action</th> <!-- Fixed header alignment -->
        </tr>
    </thead>
    
        <% 
        counter = 1;
        try {
            String sql = "SELECT * FROM returnbooks WHERE username='" + session.getAttribute("username") + "'";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
        %>
        <tr>
            <td><%= counter++ %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getString("bookname") %></td>
            <td><%= rs.getString("bookauthor") %></td>
            <td><%= rs.getString("date") %></td>
            <td><%= rs.getString("redate") %></td>
           
            <td>
                <form action="borrow" method="POST" style="margin: 0;">
                    <input type="hidden" name="book_id" value="<%= book_id %>">
                     <input type="hidden" name="bookname" value="<%= bookname %>">
                     <input type="hidden" name="bookauthor" value="<%= bookauthor %>">
                     <input type="hidden" name="Category_name" value="<%= Category_name %>">
                     <input type="hidden" name="book_description" value="<%= book_description %>">
                     <input type="hidden" name="copies" value="<%= copies %>">
                     <input type="hidden" name="book_img" value="<%= book_img %>">
                     <input type="hidden" name="price" value="<%= price %>">
                      <input type="hidden" name="date" value="<%= date %>">
                    <!--<button type="submit" class="btn btn-primary">Borrow Again</button> -->
                </form>
            </td>
        </tr>
        <% 
            }
        } catch (Exception ex) {
            out.println(ex.toString());
        } 
        %>
    
</table>
      </div>
    </div>
  </div>
</div>

  </main>
    <!-- Other HTML content and scripts -->
</body>
</html>
