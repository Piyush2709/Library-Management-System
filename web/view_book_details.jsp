<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
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
		<title>Details</title>
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
                    /* Custom CSS */
.red-btn {
    color: #fff;
    background-color: #dc3545; /* Red color */
    border-color: #dc3545; /* Red color */
}

.red-btn:hover {
    background-color: #c82333; /* Darker shade of red on hover */
    border-color: #bd2130; /* Darker shade of red on hover */
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
	<li><a class="nav-link" href="#"><img src="images/user.svg"></a></li>					
	</ul>
      </div>
    </div>
  </nav>
	
<div class="untree_co-section before-footer-section">
    <div class="container">
      <div class="row mb-5">
          <div class="site-blocks-table">
            <table class="table">
              <thead>
                <tr>
                  <th class="product-thumbnail">Image</th>
                  <th class="product-name">Book</th>
                  <th class="product-name">Author</th>
                  <th class="product-name">Category</th>
                  <th class="product-name">Description</th>
                  <th class="product-price">Price</th>
                  <th class="product-quantity">Quantity</th>
                  <th class="product-remove">Action</th>
                </tr>
              </thead>



    <h1>Book Details</h1>
    <div>
        <%
            // Retrieve the menu details from the request
            String book_id = request.getParameter("book_id");
            String bookname = request.getParameter("bookname");
            String bookauthor = request.getParameter("bookauthor");
            String Category_name = request.getParameter("Category_name");                        //
            String price = request.getParameter("price");
            String book_description = request.getParameter("book_description");
            String book_img = request.getParameter("book_img");
            String copies = request.getParameter("copies");

           
        %>
    </div>
   <tbody>
    <tr>
        <td class="product-thumbnail">
            <img src="<%= book_img %>" alt="Image" class="img-fluid">
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= bookname %></h2>
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= bookauthor %></h2>
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= Category_name %></h2>
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= book_description %></h2>
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= price %></h2>
        </td>
        <td class="product-name">
            <h2 class="h5 text-black"><%= copies %></h2>
        </td>
        <td>
    <form action="borrow" method="post">
        <input type="hidden" name="book_id" value="<%= book_id %>">
        <input type="hidden" name="bookname" value="<%= bookname %>">
        <input type="hidden" name="bookauthor" value="<%= bookauthor %>">
        <input type="hidden" name="Category_name" value="<%= Category_name %>">
        <input type="hidden" name="book_description" value="<%= book_description %>">
        <input type="hidden" name="copies" value="<%= copies %>">
        <input type="hidden" name="book_img" value="<%= book_img %>">
        <input type="hidden" name="price" value="<%= price %>">
        <button type="submit" class="btn btn-primary" name="btn_save" value="btn_save">Borrow</button>
        <a href="books.jsp" class="btn btn-info">Back</a>
    </form>
</td>
    </tr>
</tbody>
            </table>
          </div>
      </div>
    </div>
</div>
                
</body>
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
</html>
