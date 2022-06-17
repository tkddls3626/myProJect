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
                <select name="tlv_int" id="tlv_int" class="form-control" >
                    <option value="" disabled selected>관심지역설정</option>
                    <option value="seoul">서울시</option>
                    <option value="gangwondo">강원도</option>
                    <option value="gyeonggido">경기도</option>
                    <option value="chungcheongbugdo">충청북도</option>
                    <option value="chungcheongnamdo">충청남도</option>
                    <option value="jeonlabugdo">전라북도</option>
                    <option value="jeonlanamdo">전라남도</option>
                    <option value="gyeongsangbugdo">경상북도</option>
                    <option value="gyeongsangnamdo">경상남도</option>
                    <option value="jejudo">제주도</option>
                </select>
                <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
            </div>
            <div class="form-wrapper">
                <select name="sex" id="sex" class="form-control" >
                    <option value="" disabled selected>gender</option>
                    <option value="male">male</option>
                    <option value="femal">Female</option>
                    <option value="other">Other</option>
                </select>
                <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
            </div>
            <div class="form-wrapper">
                <select name="car_yn" id="car_yn" class="form-control" >
                    <option value="" disabled selected>차량유무</option>
                    <option value="GET CAR">차량소지함</option>
                    <option value="NO CAR">차량없음</option>
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
        let tlv_int = document.getElementsByName("tlv_int")[0].value;
        let car_yn = document.getElementsByName("car_yn")[0].value;

        let param = {"user_name" : user_name, "user_email" : user_email,"password" : password,"age" : age,"sex" : sex, "tlv_int" : tlv_int, "car_yn" : car_yn};
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
        if (tlv_int===""){
            alert("관심지역을 기입하지 않으셨습니다.");
            document.getElementsByName("tlv_int")[0].focus();
            return false;
        }
        if (car_yn===""){
            alert("관심지역을 기입하지 않으셨습니다.");
            document.getElementsByName("car_yn")[0].focus();
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
                       location.href = "/login";
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