<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="css/Login.css">
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">--%>
</head>


<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="user" method="post" >
            <h1>Create Account</h1>
            <div class="social-container">
                <!-- <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
            </div>
            <!-- <span>or use your email for registration</span> -->
            <input name="cName" class="form-input" type="text" placeholder="Name"  required />
            <input name="cEmail" class="form-input" type="email" placeholder="Email"  required />
            <input name="cPassword" class="form-input" type="password" placeholder="Password"  required />

            <div class="job-roll">
                <div>
                    <label class="form-check-label" for="radioDefault1">Admin</label>
                    <input class="form-check-input" type="radio" name="roll" id="radioDefault1" value="Admin">

                </div>
                <div>
                    <label class="form-check-label" for="radioDefault2">User</label>
                    <input class="form-check-input" type="radio" name="roll" id="radioDefault2" value="User" checked>
                </div>
            </div>

            <button type="submit">Sign Up</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="user" method="get">
            <h1>Sign in</h1>
            <div class="social-container">
                <!-- <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a> -->
            </div>
            <!-- <span>or use your account</span> -->
            <input name="email" class="form-input" type="email" placeholder="Email"  required/>
            <input name="password" class="form-input" type="password" placeholder="Password"  required />
            <!-- <a href="#">Forgot your password?</a> -->
            <button type="submit">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signIn">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
            </div>
        </div>
    </div>
</div>


<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>--%>
<script src="js/Login.js"></script>


</body>
</html>