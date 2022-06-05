<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>RegistrationForm_v1 by Colorlib</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

    <!-- STYLE CSS -->
    <link rel="stylesheet" href="/css/style.css">


</head>
<body>
<div class="wrapper" style="background-image: url(/images/weather-back.jpg);">
    <div class="inner">
        <div class="image-holder">
            <img src="/images/weather-front.jpg" alt="">
        </div>
        <form>
            <h3>Registration Form</h3>
            <div class="form-wrapper">
                <input type="text" placeholder="Username" class="form-control" name="user_name">
                <i class="zmdi zmdi-account"></i>
            </div>
            <div class="form-wrapper">
                <input type="text" placeholder="Email Address" class="form-control" name="user_email">
                <i class="zmdi zmdi-email"></i>
            </div>
            <div class="form-wrapper">
                <input type="text" placeholder="AGE" class="form-control" name="age">
                <i class="zmdi zmdi-email"></i>
            </div>
            <div class="form-wrapper">
                <select name="sex" id="" class="form-control" >
                    <option value="" disabled selected>Gender</option>
                    <option value="male">Male</option>
                    <option value="femal">Female</option>
                    <option value="other">Other</option>
                </select>
                <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
            </div>
            <div class="form-wrapper">
                <input type="password" placeholder="Password" class="form-control" name="password1" id="pw">
                <i class="zmdi zmdi-lock"></i>
            </div>
            <div class="form-wrapper">
                <input type="password" placeholder="Confirm Password" class="form-control" name="password2" id ="pw2">
                <i class="zmdi zmdi-lock"></i>
            </div>
            <button type="button" class="form-control" value="회원가입" onclick="moveUrl()">register
                <i class="zmdi zmdi-arrow-right">
                </i>
            </button>
        </form>
    </div>
</div>

</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/js/jquery.min.js"></script>
<script>
    function doSwal(title, content, type = "info") {
        swal(title, content, type, {
            timer : 4000,
            button : "확인"
        });
    }
</script>
<script>
    function moveUrl() {


        let user_name = document.getElementsByName("user_name")[0].value;
        let user_email = document.getElementsByName("user_email")[0].value;
        let password = document.getElementsByName("password1")[0].value;
        let password2 = document.getElementsByName("password2")[0].value;
        let age = document.getElementsByName("age")[0].value;
        let sex = document.getElementsByName("sex")[0].value;

        let param = {"user_name" : user_name, "user_email" : user_email,"password" : password,"age" : age,"sex" : sex,};
        /*유효성 검사*/
        if (user_name===""){
            alert("이름을 입력하세요");
            document.getElementsByName("user_name")[0].focus();
            return false;
        }
        if (user_email===""){
            alert("이메일을 입력하세요");
            document.getElementsByName("user_email")[0].focus();
            return false;
        }
        if (password===""){
            alert("비빌번호를 입력하세요");
            document.getElementsByName("password")[0].focus();
            return false;
        }
        if (password2!==password){
            alert("비빌번호확인을 입력하세요");
            document.getElementsByName("password2")[0].focus();
            return false;
        }
        if (sex===""){
            alert("성별을 기입하지 않으셨습니다.");
            document.getElementsByName("sex")[0].focus();
            return false;
        }


        $.ajax({
            type: "GET", // get방식
            url: "/insertUserInfo", // 파이썬으로 통신
            data: param, // area 데이터 값
            contentType: "application/json; charset=utf-8", // json 인코딩
            dataType: "text", //json타입
            success(result) {
                if(result==="success") {
                    swal({
                        title : "회원가입 성공!!",
                        text : "확인 버튼을 눌러주세요.",
                        icon : "success"
                    }).then(function() {
                       location.href = "/index";
                    });
                } else {
                    swal({
                        title : "회원가입 실패 !!",
                        text : "확인 버튼을 눌러주세요.",
                        icon : "error"
                    });
                }
            },
            error: (log) => {
                alert("실패" + log);
            }
        });
    }
</script>

</html>