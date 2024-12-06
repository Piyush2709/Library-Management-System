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
		<title>Feedback</title>
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
						<li class="nav-item ">
							<a class="nav-link" href="index.jsp">Home</a>
						</li>
						<li><a class="nav-link" href="user_login.jsp">Books</a></li>
						<li><a class="nav-link" href="#about">About us</a></li>
						<li><a class="nav-link" href="user_login.jsp">Login</a></li>
						<li class="nav-item active"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
					</ul>

					<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
						<li><a class="nav-link" href="user_login.jsp"><img src="images/user.svg"></a></li>
					</ul>
				</div>
			</div>
				
		</nav>
		
<body>
  <main>
    <div class="container">
      <section class="section feedback-form min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10 d-flex flex-column align-items-center justify-content-center">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Feedback Form</h5>
                  </div>
                  <form action="submit_feedback" method="post" class="needs-validation">
                    <div class="mb-3">
                      <label for="username" class="form-label">Username</label>
                      <!-- Assuming you'll set the username in a session on the server-side -->
                      <input type="text" class="form-control" id="username" name="username">
                    </div>
                    <div class="mb-3">
                      <label for="feedback" class="form-label">Feedback</label>
                      <textarea class="form-control" id="feedback" name="Message" rows="5" required></textarea>
                      <div class="invalid-feedback">Please enter your feedback.</div>
                    </div>
                    <div class="mb-3">
                      <button class="btn btn-primary w-100" type="submit" name="btn_save" value="btn_save">Submit Feedback</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main>
  <!-- Other HTML content and scripts -->
</body>

</html>
