<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

  <!-- Bootstrap CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="css/tiny-slider.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <title>Books</title>
  <style>
    .product-section {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start; /* Align items at the start of the row */
}

.product-item {
  flex: 0 0 25%; /* Set width for responsiveness */
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  margin-bottom: 20px;
}

.product-item img {
  width: 200px;
  height: 200px;
}

.product-title {
  margin-top: 10px;
  font-size: 18px;
}

.product-price {
  margin-top: 5px;
  font-size: 17px;
}

.button-group {
  display: flex;
  flex-direction: row;
  justify-content: center;
  margin-top: 10px;
}

.button-group button {
  margin: 5px;
  padding: 5px 10px;
  font-size: 14px;
  width: 90px;
}
.hidden {
  visibility: hidden; /* Makes the item invisible */
  height: 0; /* Collapses the space */
  margin: 0; /* Removes any margin space */
  overflow: hidden; /* Ensures no content overflow */
  padding: 0; /* Removes padding space */
}

</style>

</head>

<body>
  <!-- Start Header/Navigation -->
  <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Library management system<span>.</span></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarsFurni">
        <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
          <li class="nav-item active"><a class="nav-link" href="books.jsp">Books</a></li>
          <li class="nav-item"><a class="nav-link" href="user_login.jsp">Logout</a></li>
          <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
        </ul>
          <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
	<li><a class="nav-link" href="profile.jsp"><img src="images/user.svg"></a></li>					
	</ul>
      </div>
    </div>
  </nav>
  <!-- End Header/Navigation -->

  <!-- Search Bar -->
  <!-- Search Bar -->
<div class="container my-4">
  <form action="searchedbooks.jsp" method="GET" class="row justify-content-center">
    <div class="col-md-8">
      <input type="text" name="query" class="form-control" placeholder="Search books by name..." required>
    </div>
    <div class="col-md-2">
      <button type="submit" class="btn btn-primary btn-block">Search</button>
    </div>
  </form>
</div>


  <!-- Product Dynamic Section -->
  <div class="untree_co-section product-section before-footer-section">
    <div class="container">
      <div class="row" id="bookList">
        <%
          Connection cn = null;
          Statement st = null;
          ResultSet rs = null;

          try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lms", "root", "root");
            st = cn.createStatement();
            String sql = "select * from books";
            rs = st.executeQuery(sql);

            while (rs.next()) {
              String price = rs.getString("price");
              String copies = rs.getString("copies");
        %>
        <div class="col-12 col-md-4 col-lg-3 mb-5">
                    <div class="product-item">
                        <img src="<%= rs.getString("book_img") %>" class="img-fluid product-thumbnail">
                        <h2 class="product-title"><%= rs.getString("bookname") %></h2>
                        <strong class="product-price">&#8377;<%= price %></strong>
                        <p class="product-price">QTY-<%= copies %></p>
                        <!-- Use &#8377; for Rupee symbol -->
                        <form action="borrow" method="POST">
                            <div class="button-group">
                                <input type="hidden" name="book_id" value="<%= rs.getString("book_id") %>">
                                <input type="hidden" name="bookname" value="<%= rs.getString("bookname") %>">
                                <input type="hidden" name="bookauthor" value="<%= rs.getString("bookauthor") %>">
                                <input type="hidden" name="book_description" value="<%= rs.getString("book_description") %>">
                                <input type="hidden" name="Category_name" value="<%= rs.getString("Category_name") %>">
                                <input type="hidden" name="copies" value="<%= rs.getString("copies") %>">
                                <input type="hidden" name="price" value="<%= rs.getString("price") %>">
                                <input type="hidden" name="book_img" value="<%= rs.getString("book_img") %>">
                                <button type="submit" class="btn btn-primary" name="btn_save" value="btn_save">Borrow</button>

                            </div>
                        </form>

                        <!-- Details form -->
                        <form action="view_book_details.jsp" method="POST">
                            <!-- Include necessary hidden fields for the specific menu -->
                            <input type="hidden" name="book_id" value="<%= rs.getString("book_id") %>">
                                <input type="hidden" name="bookname" value="<%= rs.getString("bookname") %>">
                                <input type="hidden" name="bookauthor" value="<%= rs.getString("bookauthor") %>">
                                <input type="hidden" name="book_description" value="<%= rs.getString("book_description") %>">
                                <input type="hidden" name="Category_name" value="<%= rs.getString("Category_name") %>">
                                <input type="hidden" name="copies" value="<%= rs.getString("copies") %>">
                                <input type="hidden" name="price" value="<%= rs.getString("price") %>">
                                <input type="hidden" name="book_img" value="<%= rs.getString("book_img") %>">
                            <button type="submit" class="btn btn-secondary view-details">Details</button>
                        </form>
                    </div>
                </div>
        <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null)
                                rs.close();
                            if (st != null)
                                st.close();
                            if (cn != null)
                                cn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
      </div>
    </div>
  </div>
  <!-- End Product Dynamic Section -->

  <!-- Footer Section -->
  <footer class="footer-section">
			<div class="container relative">

				<div class="sofa-img">
					<img src="images/LMS.png" alt="Image" class="rounded mx-auto d-block">
				</div>

				

				<div class="row g-5 mb-5">
					<div class="col-lg-4">
						<div class="mb-4 footer-logo-wrap"><a href="#" class="footer-logo">Library Management System.<span>.</span></a></div>
						<p class="mb-4">Transforming Manual to Modern..</p>

											</div>

					<div class="col-lg-8">
    <div class="row links-wrap">
        <div class="col-md-6">
            <ul class="list-unstyled">
                <li style="display: inline-block;"><a class="nav-link" href="user_login.jsp">Books</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="#about">About us</a></li>
                 <li style="display: inline-block;"><a class="nav-link" href="user_login.jsp">Login</a></li>
                <li style="display: inline-block;"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
        
    </div>
</div>


				</div>

				<div class="border-top copyright">
					<div class="row pt-4">
						<div class="col-lg-6">
							<p class="mb-2 text-center text-lg-start">Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://piyushadake.freewebhostmost.com/">PiyushAdake</a>
            </p>
						</div>

						

					</div>
				</div>

			</div>
		</footer>

  <!-- Scripts -->
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
   <script src="js/tiny-slider.js"></script>
 <script src="js/custom.js"></script>
     <script>
    document.getElementById('searchBar').addEventListener('input', function () {
  const query = this.value.toLowerCase();
  const items = document.querySelectorAll('.product-item');

  items.forEach(function (item) {
    const title = item.querySelector('.product-title').textContent.toLowerCase();

    if (title.includes(query)) {
      item.style.display = ''; // Reset to default to show matching items
    } else {
      item.style.display = 'none'; // Hide non-matching items
    }
  });
});







  </script>


</body>
</html>
