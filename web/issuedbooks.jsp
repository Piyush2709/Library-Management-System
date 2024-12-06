<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
       
                    .hero-img-wrap img {
   padding-left: 220px;
padding-top: 10px;
      width: auto;
  height: 550px;
                    }
                    .img-wrap{
                        padding-top: 20px;
                    }
                    .sofa-img{
                        padding-top: 50px;
                    }
                    .feedback-form .card {
      max-width: 600px; /* Adjust the maximum width of the card */
      width: 90%; /* Adjust the width of the card */
    }

    .feedback-form .card-body {
      padding: 30px;
    }
               
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
</style>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Menu</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/Logo Smart.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  
</head>
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/book.png" alt="">
        <span class="d-none d-lg-block">Library</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <!-- End Icons Navigation -->

  </header>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/book.png" alt="">
        <span class="d-none d-lg-block">Library</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
 <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">
<!--List Pages Starts Heres -->
   <li class="nav-item">
        <a class="nav-link " href="admin_dashbord.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
   </li><br>
      <li class="nav-item">
        <a class="nav-link " href="add_category.jsp">
          <i class="bi bi-bookmark-plus"></i>
          <span>Add Category</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="add_books.jsp">
          <i class="bi bi-bag"></i>
          <span>Add Books</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link " href="view_books.jsp">
          <i class="bi bi-card-list"></i>
          <span>View Books</span>
        </a>
      </li>
        <li class="nav-item">
        <a class="nav-link " href="issuedbooks.jsp">
          <i class="bi bi-bag-check-fill"></i>
          <span>Book Issuance</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="canclerequest.jsp">
          <i class="bi bi-cart-x-fill"></i>
          <span>Cancelled Requested</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="returnbooks.jsp">
          <i class="bi bi-cart-x-fill"></i>
          <span>Returned Books</span>
        </a>
      </li>
      <br>
      <br>
      
      
      
      <!-- End Tables Nav -->
        
      <li class="nav-item">
        <a class="nav-link " href="View_Feedback.jsp">
          <i class="bi bi-envelope"></i>
          <span>View FeedBack</span>
        </a>
      </li><!-- End Feedback Page Nav -->
      <br>
      <!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link" href="user_login.jsp">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Logout</span>
        </a>
      </li><!-- End Login Page Nav -->
      </ul>

  </aside><!-- End Sidebar-->

<!-- Main Card-->
<main id="main" class="main">

   <div class="col-12">
              <div class="card recent-sales overflow-auto">

                  <div class="card-body">
                  <h5 class="card-title">Issued Books<span>| Today</span></h5>

                   <table id="myTable">
            <tr>
              <th scope="col">#</th>
              <th>Student Name</th>
              <th>Book Name</th>
              <th>Author Name</th>
              <th>Date</th>
              
            </tr>
            <% int counter = 1;
            Connection cn = null;
            Statement st = null;
            try {
              Class.forName("com.mysql.jdbc.Driver");
              cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "root");
              st = cn.createStatement();
              String sql = "select * from accepted_borrow";
              ResultSet rs = st.executeQuery(sql);
              while (rs.next()) {
                String accept_id = rs.getString("accept_id");
            %>
            <form action="update_order" method="POST">
                <th scope="row"><%=counter++%></th>
               <input type="hidden" name="accept_id" value="<%=rs.getString("accept_id")%>" >   
               <td><%=rs.getString("username")%></td>
        <input type="hidden" name="username" value="<%=rs.getString("username")%>">
        <td><%=rs.getString("bookname")%></td>
        <input type="hidden" name="bookname" value="<%=rs.getString("bookname")%>">
        <td><%=rs.getString("bookauthor")%></td>
        <input type="hidden" name="bookauthor" value="<%=rs.getString("bookauthor")%>">
        <td><%=rs.getString("date")%></td>
        <input type="hidden" name="date" value="<%=rs.getString("date")%>">
             
         </form>
                   </tr>
            <% }
              // Close database connections and handle exceptions
            } catch (Exception ex) {
              out.println(ex.toString());
            } %>
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

  </main>

<!-- Main Card End-->
  

  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>