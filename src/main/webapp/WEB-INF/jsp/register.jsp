<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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

        .register-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .register-container h1 {
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

        .error {
            color: #dc3545;
            font-size: 0.875em;
            display: none;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
        <form:form action="doregister" method="post" modelAttribute="user" id="registerForm">
            <div class="form-group">
                <label for="name" class="form-label">Username</label>
                <form:input path="name" class="form-control" id="name"/>
                <div id="nameError" class="error">Username must be at least 3 characters long</div>
            </div>
            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <form:input path="email" class="form-control" id="email"/>
                <div id="emailError" class="error">Invalid email address</div>
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <form:password path="password" class="form-control" id="password"/>
                <div id="passwordError" class="error">Password must be at least 2 characters long</div>
            </div>
            <div class="form-group">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <form:password path="confirmPassword" class="form-control" id="confirmPassword"/>
                <div id="confirmPasswordError" class="error">Passwords do not match</div>
            </div>
            <div style="display: flex; gap: 10px;">
    <button type="submit" class="btn btn-dark">Register</button>
    <a href="../login" class="btn btn-dark">Back</a>
</div>
        </form:form>
    </div>
    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            let isValid = true;

            const name = document.getElementById('name').value;
            if (name.length < 3) {
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('nameError').style.display = 'none';
            }

            const email = document.getElementById('email').value;
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('emailError').style.display = 'none';
            }

            const password = document.getElementById('password').value;
            if (password.length < 2) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('passwordError').style.display = 'none';
            }

            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmPasswordError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('confirmPasswordError').style.display = 'none';
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
