<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>User Login</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/Logo Smart.png" rel="icon">
  <link href="assets/img/Smart Canteen.png" rel="apple-touch-icon">

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

   <head>
  <!-- ... (existing head content) ... -->
   <head>
  <!-- ... (existing head content) ... -->
   <style>
    /* Custom styles for login page */
    body {
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #3b5d50; /* Set background color for the whole body */
    }

    .section.register {
      position: relative;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* White dots on the background */
    .section.register::before,
    .section.register::after {
      content: '';
      position: absolute;
      width: 12px; /* Increase the dot size */
      height: 12px; /* Increase the dot size */
      background-color: #fff;
      border-radius: 50%;
      animation: dots 12s linear infinite; /* Adjust the animation speed */
    }

    /* Multiple dots */
    .section.register::before {
      top: 5%;
      left: 5%;
      animation-delay: 0s; /* Delay for the first dot */
    }

    .section.register::after {
      top: 70%;
      left: 70%;
      animation-delay: 2s; /* Delay for the second dot */
    }

    @keyframes dots {
      0% {
        transform: translate(0, 0);
        opacity: 1;
      }
      100% {
        transform: translate(150vw, 150vh); /* Adjust the direction and distance */
        opacity: 0;
      }
    }

    /* Additional dots with different directions */
    .section.register::after {
      animation: dots2 8s linear infinite; /* Adjust the animation speed */
    }

    @keyframes dots2 {
      0% {
        transform: translate(0, 0);
        opacity: 1;
      }
      100% {
        transform: translate(-150vw, -150vh); /* Adjust the direction and distance */
        opacity: 0;
      }
    }

    .card {
      border: none;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 400px;
      width: 100%;
    }

    .form-label {
      font-weight: 500;
    }

    .btn-primary {
      background-color: #3b5d50 !important;
      border-color: #3b5d50 !important;
    }

    .btn-primary:hover {
      background-color: #2d473c !important;
      border-color: #2d473c !important;
    }
  </style>
</head>

<body>

  <main>
      <form action="Login" method="Post">
    <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                  </div>
                  <form class="row g-3 needs-validation" novalidate>
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        
                        <input type="text" name="username" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Please enter your Email.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div><br>
                    <div class="col-12">
                        <button class="btn btn-primary w-100" type="submit" value="Login" name="Login">Login</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Don't have an account? <a href="user_signup.jsp">Create an account</a></p>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
      </form>
  </main><!-- End #main -->

  <!-- ... (existing script tags) ... -->

</body>

</html>
