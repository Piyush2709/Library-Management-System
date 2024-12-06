<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>User Signup</title>
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

  <style>
    /* Custom styles for signup page */
    body {
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #3b5d50; /* Set background color for the whole body */
    }

    /* ... (existing styles) ... */

    /* Adjustments for signup form */
    .form-signup {
      padding: 30px;
      max-width: 400px;
      width: 100%;
    }

    .form-signup .form-label {
      font-weight: 500;
    }

    .form-signup .btn-primary {
      background-color: #3b5d50 !important;
      border-color: #3b5d50 !important;
    }

    .form-signup .btn-primary:hover {
      background-color: #2d473c !important;
      border-color: #2d473c !important;
    }
    /* Custom styles for moving dots */
    .section.signup::before,
    .section.signup::after {
      content: '';
      position: absolute;
      width: 12px; /* Adjust the dot size */
      height: 12px; /* Adjust the dot size */
      background-color: #fff;
      border-radius: 50%;
      animation: dots 12s linear infinite; /* Adjust the animation speed */
    }

    .section.signup::before {
      top: 5%;
      left: 5%;
      animation-delay: 0s; /* Delay for the first dot */
    }

    .section.signup::after {
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
    .section.signup::after {
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
  </style>
</head>

<body>

  <main>
      
    <div class="container">
      <section class="section signup min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
              <div class="card mb-3">
                <div class="card-body form-signup">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Sign Up</h5>
                  </div>
                  <form  action="usersignup"  method="Post"   class="row g-3 needs-validation" >
                    <div class="col-12">
                      <label for="username" class="form-label">Name</label>
                      <input type="text" name="username" class="form-control" id="username" required>
                      <div class="invalid-feedback">Please enter a username.</div>
                    </div>
                    <div class="col-12">
                      <label for="phone" class="form-label">Phone Number</label>
                      <input type="tel" name="phone_no" class="form-control" id="phone" required>
                      <div class="invalid-feedback">Please enter a phone number.</div>
                    </div>
                    <div class="col-12">
                      <label for="email" class="form-label">College Email</label>
                      <input type="email" name="email" class="form-control" id="email" required>
                      <div class="invalid-feedback">Please enter a valid email.</div>
                    </div>
                    <div class="col-12">
                      <label for="password" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="password" required>
                      <div class="invalid-feedback">Please enter a password.</div>
                    </div>
                    <div class="col-12">
                      <label for="confirmPassword" class="form-label">Confirm Password</label>
                      <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required>
                      <div class="invalid-feedback">Passwords do not match.</div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit" value="btn_save" name="btn_save">Sign Up</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main><!-- End #main -->

  
