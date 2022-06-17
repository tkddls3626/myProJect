<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%
    List<List<String>> rList = (List<List<String>>) request.getAttribute("rList");
    String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
%>
<html>

<head>
    <title>MainPage</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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


<body class="homepage is-preload">
<div id="page-wrapper">

    <!-- Header -->
    <div id="header-wrapper">
        <div class="container">

            <!-- Header -->
            <header id="header">
                <div class="inner">

                    <!-- Logo -->
                    <h1><a href="/index" id="logo">WeatherTelling</a></h1>

                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li class="current_page_item"><a href="/index">Home</a></li>
                            <li>
                                <a href="/mypage">마이페이지</a>
                                <ul>
                                    <li><a href="/mypage">내 정보 수정</a></li>
                                    <li><a href="/mypageinfo">내 정보 확인</a></li>
                                </ul>
                            </li>
                            <li class="current_page_item">
                                <a>날씨조회</a>
                                <ul>
                                    <li><a href="/weather">현재날씨조회</a></li>
                                    <li><a href="weather2">미래날씨조회</a></li>
                                </ul>
                            </li>
                            <li><a href="/carFind">차박여행지조회</a></li>
                            <li><a href="/notice/NoticeList2">공지사항 및 자유게시판</a></li>
                            <button type="submit" class="btn btn-outline-secondary"><a href="/logout">로그아웃</a></button>
                        </ul>
                    </nav>

                </div>
            </header>

            <!-- Banner -->
            <div id="banner">
                <h2><strong>날씨알람서비스:</strong> 환영합니다.</h2>
                    <br />

            </div>
        </div>
    </div>
    <!-- Main Wrapper -->
    <div id="main-wrapper">
        <div class="wrapper style1">
            <div class="inner">

                <!-- Feature 1 -->
                <section class="container box feature1">
                    <div class="row">
                        <div class="col-12">
                            <header class="first major">
                                <h2>추천 야영지</h2>
                                <p>아래 이미지를 <strong>선택하여</strong> 홈페이지에 들어가보세요!</p>
                            </header>

                        </div>
                        <div class="col-4 col-12-medium">
                            <section>
                                <a href="<%=rList.get(0).get(2).substring(1,rList.get(0).get(2).length()-1)%>" class="image featured"><img src="<%=rList.get(0).get(1).substring(1,rList.get(0).get(1).length()-1)%>" alt="" /></a>
                                <header class="second icon solid fa-user">
                                    <h3><%=rList.get(0).get(0).substring(1, rList.get(0).get(0).length()-1)%></h3>
                                </header>
                            </section>
                        </div>
                        <div class="col-4 col-12-medium">
                            <section>
                                <a href="<%=rList.get(12).get(2).substring(1,rList.get(12).get(2).length()-1)%>" class="image featured"><img src="<%=rList.get(12).get(1).substring(1,rList.get(12).get(1).length()-1)%>" alt="" /></a>
                                <header class="second icon solid fa-user">
                                    <h3><%=rList.get(12).get(0).substring(1, rList.get(12).get(0).length()-1)%></h3>
                                </header>
                            </section>
                        </div>
                        <div class="col-4 col-12-medium">
                            <section>
                                <a href="<%=rList.get(3).get(2).substring(1,rList.get(3).get(2).length()-1)%>" class="image featured"><img src="<%=rList.get(3).get(1).substring(1,rList.get(3).get(1).length()-1)%>" alt="" /></a>
                                <header class="second icon solid fa-user">
                                    <h3><%=rList.get(3).get(0).substring(1, rList.get(3).get(0).length()-1)%></h3>
                                </header>
                            </section>
                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
    <div class="wrapper style2">
        <div class="inner">


        </div>
    </div>
    <div class="wrapper style3">
        <div class="inner">
            <div class="container">
                <div class="row">
                    <div class="col-8 col-12-medium">


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