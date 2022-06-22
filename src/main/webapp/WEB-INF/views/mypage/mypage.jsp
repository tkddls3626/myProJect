<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
%>
<!DOCTYPE HTML>

<html>

<head>
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/car.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" type="text/css">
    <script>
        function doSubmit(f) {
            if (f.age.value().replace(/[^0-9]/g,"") === ""  ) {
                alert("숫자만 입력해주세요!.");
                f.age.focus();
                return false;
            }
        }
    </script>
    <style type="text/css">
        @font-face {
            src: url("/fonts/poppins/BMJUA_ttf.ttf");
            font-family: "jua";
        }
        p {
            font-family: "jua";
        }
        label{
            font-family: "jua";
        }
        a{
            font-family: "jua";
        }
        h2{
            font-family: "jua";
        }
        h3{
            font-family: "jua";
        }

    </style>
</head>

<body class="right-sidebar is-preload">
<div id="page-wrapper">

    <!-- Header Wrapper -->
    <div id="header-wrapper">
        <div class="container">

            <!-- Header -->
            <header id="header">
                <div class="inner">

                    <!-- Logo -->
                    <h1><a href="/index" id="logo">WEATHERTELLING</a></h1>

                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li class="current_page_item"><a href="/index">Home</a></li>
                            <li><a href="/mypageinfo">내 정보 확인</a></li>

                            <li class="current_page_item">
                                <a>날씨조회</a>
                                <ul>
                                    <li><a href="/weather">현재날씨조회</a></li>
                                    <li><a href="weather2">미래날씨조회</a></li>
                                </ul>
                            </li>
                            <li><a href="/carFind">차박여행지조회</a></li>
                            <li class="current_page_item">
                                <a>공지사항 및 게시판</a>
                                <ul>
                                    <li><a href="/notice/NoticeList2">자유게시판</a></li>
                                    <li><a href="/board/BoardList">공지사항</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>

                </div>
            </header>

        </div>
    </div>

    <!-- Main Wrapper -->
    <div id="main-wrapper">
        <div class="wrapper style2">
            <div class="inner">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-12-medium">
                            <div id="content">

                                <!-- Content -->

                                <article class="container box feature1">
                                    <div>
                                        <header class="major">
                                            <h2 style="margin: 0 0 0.5em 0;">내 정보 수정</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">

                                        <h2><%=user_name%>님 의 내 정보 수정 페이지 입니다.</h2>
                                        <div class="col-4 col-12-medium">
                                            <section>
                                                <form id="f" action="/UpdateMyPage" method="post" onsubmit="return doSubmit(this);">

                                                    <div class="form-wrapper">
                                                        <input type="text" placeholder="나이(숫자만 입력해주세요)" id="age" name="age" class="form-control" required="required" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>>
                                                        <i class="zmdi zmdi-email"></i>

                                                    </div>
                                                    <div class="form-wrapper">
                                                        <select name="sex" id="sex" class="form-control" required="required">
                                                            <option value="" disabled selected>Gender</option>
                                                            <option value="male">Male</option>
                                                            <option value="femal">Female</option>
                                                            <option value="other">Other</option>
                                                        </select>
                                                        <i class="zmdi zmdi-email"></i>

                                                    </div>
                                                    <div class="form-wrapper">
                                                        <select name="tlv_int" id="tlv_int" class="form-control" required="required">
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
                                                        <i class="zmdi zmdi-email"></i>

                                                    </div>
                                                    <div class="form-wrapper">
                                                        <select name="car_yn" id="car_yn" class="form-control"  required="required">
                                                            <option value="" disabled selected>차량유무</option>
                                                            <option value="GET CAR">차량소지함</option>
                                                            <option value="NO CAR">차량없음</option>
                                                        </select>
                                                        <i class="zmdi zmdi-email"></i>

                                                    </div>
                                                    <button type="submit" value="UpdateMyPage" onclick="location.href=/login">정보 수정
                                                    <i class="zmdi zmdi-arrow-right">
                                                    </i>
                                                    </button>
                                                    <button type="button"><a href="/updatePasswd">비밀번호변경하기</a>
                                                        <i class="zmdi zmdi-arrow-right">
                                                        </i>
                                                    </button>
                                                </form>
                                            </section>
                                        </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/browser.min.js"></script>
<script src="/js/breakpoints.min.js"></script>
<script src="/js/util.js"></script>
<script src="/js/main.js"></script>
</body>

</html>