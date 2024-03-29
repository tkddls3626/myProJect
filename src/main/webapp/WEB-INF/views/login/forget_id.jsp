<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>아이디찾기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

    <!-- STYLE CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery.min.js"></script>
</head>

<body>

<div class="wrapper" style="background-image: url('images/weather-back.jpg');">
    <div class="inner">
        <div class="image-holder">
            <img src="/images/weather-front.jpg" alt="">
        </div>
        <form action="/forget_id" method="post">
            <h3>Registration Form</h3>
            <div class="form-wrapper">
                <input type="text" placeholder="Username" id="user_name" name="user_name" class="form-control" required="required">
                <i class="zmdi zmdi-account"></i>
            </div>
            <div class="form-wrapper">
                <input type="text" placeholder="age" id="age" name="age" class="form-control" required="required">
                <i class="zmdi zmdi-email"></i>

            </div>
            <button type="submit" value="Find you ID" onclick="location.href=/login">find ID
                <i class="zmdi zmdi-arrow-right">
                </i>
            </button>
        </form>
    </div>
</div>

</body>
<script>
    console.log("user_name : " + user_name);
    console.log("age : " + age);
</script>
</html>