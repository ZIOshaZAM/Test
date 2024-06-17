<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .login-container h1 {
            color: #343a40;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            margin-bottom: 15px;
            border-radius: 5px;
        }

        .btn-dark {
            background-color: #343a40;
            border-color: #343a40;
            width: 100%;
            border-radius: 5px;
        }

        .btn-dark:hover {
            background-color: #212529;
            border-color: #212529;
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
            text-align: center;
        }
    </style>
    <script>
        function validateForm(event) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.querySelector('.error-message');
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

            errorMessage.textContent = '';

            if (!emailPattern.test(email)) {
                errorMessage.textContent = 'Please enter a valid email address.';
                event.preventDefault();
                return false;
            }

            if (password.length < 2) {
                errorMessage.textContent = 'Password must be at least 6 characters long.';
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <form action="login" method="post" onsubmit="validateForm(event)">
            <h1>Login</h1>
            <p class="error-message">${message}</p>
            <div class="form-group">
                <label for="email" class="form-label">User Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Email"  />
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Password"  />
            </div>
	<br>
            <button type="submit" class="btn btn-dark">Login</button>
            <p class="text-muted text-center mt-3">Not registered? <a href="user/register">Create an account</a></p>
        </form>
    </div>
</body>
</html>
