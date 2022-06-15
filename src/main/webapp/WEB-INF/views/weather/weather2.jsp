<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    List<List<String>> rList = (List<List<String>>) request.getAttribute("rList");

    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");

    String weather = "";

%>
<!DOCTYPE HTML>

<html>

<head>
    <title>Right Sidebar - ZeroFour by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/car.css" />
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b596c8e6e2eb1dc9d160e1a1319a1587"></script>
    <style type="text/css">
        @font-face {
            src: url("/fonts/poppins/BMJUA_ttf.ttf");
            font-family: "jua";
        }
        p {
            font-size: 15px;
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
                            <li>
                                <a href="/mypage">마이페이지</a>
                                <ul>
                                    <li><a href="/chat">채팅내역</a></li>
                                    <li><a href="#">카카오톡 알림 신청</a></li>
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
                                            <h2 style="margin: 0 0 0.5em 0;">3시간 단위 날씨</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div style="width: 15%; float: left; margin: 5px;">
                                    <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                        <div class="card">
                                            <div class="card__info">
                                                <div style="float:inside; width: 100%; height: 100%;">
                                                    <h4><%=rList.get(0).get(7).substring(1,rList.get(0).get(7).length()-1)%></h4>
                                                </div>
                                                <p class="card__info__date">시간 :<%=rList.get(0).get(0).substring(1,rList.get(0).get(0).length()-3)%>시</p>
                                            </div>
                                            <div class="card__weather">
                                                <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                            d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                            fill="#567DF4" />
                                                </svg>

                                                <p class="card__weather__temp">온도 :<%=rList.get(0).get(1).substring(1,rList.get(0).get(1).length()-1)%>C</p>
                                                <%
                                                    if((rList.get(0).get(3).substring(1,rList.get(0).get(3).length()-1)) .equals("1")) {
                                                        weather = "맑음";
                                                    }else if((rList.get(0).get(3).substring(1,rList.get(0).get(3).length()-1)).equals("3")){
                                                        weather = "구름많음";
                                                    }else if((rList.get(0).get(3).substring(1,rList.get(0).get(3).length()-1)).equals("4")) {
                                                        weather = "흐림";
                                                    }
                                                %>
                                                <p class="card__weather__temp">날씨상태 : <%=weather%></p>

                                                <p class="card__weather__temp">강수확률 :<%=rList.get(0).get(5).substring(1,rList.get(0).get(5).length()-1)%>%</p>
                                                <p class="card__weather__temp">강수량 : <%=rList.get(0).get(6).substring(1,rList.get(0).get(6).length()-1)%></p>

                                            </div>

                                        </div>
                                    </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                    <form style="border: 1px solid black;border-radius: 10px; padding:10px;">
                                        <div class="card">
                                            <div class="card__info">
                                                <div style="float:inside; width: 100%; height: 100%;">
                                                    <h4><%=rList.get(1).get(7).substring(1,rList.get(1).get(7).length()-1)%></h4>
                                                </div>
                                                <p class="card__info__date">시간 :<%=rList.get(1).get(0).substring(1,rList.get(1).get(0).length()-3)%>시</p>
                                            </div>
                                            <div class="card__weather">
                                                <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                            d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                            fill="#567DF4" />
                                                </svg>
                                                <p class="card__weather__temp">온도 :<%=rList.get(1).get(1).substring(1,rList.get(1).get(1).length()-1)%>C</p>
                                                <%
                                                    if((rList.get(1).get(3).substring(1,rList.get(1).get(3).length()-1)).equals("1")) {
                                                        weather = "맑음";
                                                    }else if((rList.get(1).get(3).substring(1,rList.get(1).get(3).length()-1)).equals("3")){
                                                        weather = "구름많음";
                                                    }else if((rList.get(1).get(3).substring(1,rList.get(1).get(3).length()-1)).equals("4")) {
                                                        weather = "흐림";
                                                    }
                                                %>
                                                <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                <p class="card__weather__temp">강수확률 :<%=rList.get(1).get(5).substring(1,rList.get(1).get(5).length()-1)%>%</p>
                                                <p class="card__weather__temp">강수량 : <%=rList.get(1).get(6).substring(1,rList.get(1).get(6).length()-1)%></p>

                                            </div>

                                        </div>
                                    </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(2).get(7).substring(1,rList.get(2).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(2).get(0).substring(1,rList.get(2).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(2).get(1).substring(1,rList.get(2).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(2).get(3).substring(1,rList.get(2).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(2).get(3).substring(1,rList.get(2).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(2).get(3).substring(1,rList.get(2).get(3).length()-1)).equals("4")){
                                                            weather = "흐림"; }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(2).get(5).substring(1,rList.get(2).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(2).get(6).substring(1,rList.get(2).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(3).get(7).substring(1,rList.get(3).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(3).get(0).substring(1,rList.get(3).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(3).get(1).substring(1,rList.get(3).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(3).get(3).substring(1,rList.get(3).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(3).get(3).substring(1,rList.get(3).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(3).get(3).substring(1,rList.get(3).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>
                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(3).get(5).substring(1,rList.get(3).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(3).get(6).substring(1,rList.get(3).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(4).get(7).substring(1,rList.get(4).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(4).get(0).substring(1,rList.get(4).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>
                                                    <p class="card__weather__temp">온도 :<%=rList.get(4).get(1).substring(1,rList.get(4).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(4).get(3).substring(1,rList.get(4).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(4).get(3).substring(1,rList.get(4).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(4).get(3).substring(1,rList.get(4).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>
                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(4).get(5).substring(1,rList.get(4).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(4).get(6).substring(1,rList.get(4).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(5).get(7).substring(1,rList.get(5).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(5).get(0).substring(1,rList.get(5).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(5).get(1).substring(1,rList.get(5).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(5).get(3).substring(1,rList.get(5).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(5).get(3).substring(1,rList.get(5).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(5).get(3).substring(1,rList.get(5).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(5).get(5).substring(1,rList.get(5).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(5).get(6).substring(1,rList.get(5).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(6).get(7).substring(1,rList.get(6).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(6).get(0).substring(1,rList.get(6).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(6).get(1).substring(1,rList.get(6).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(6).get(3).substring(1,rList.get(6).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(6).get(3).substring(1,rList.get(6).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(6).get(3).substring(1,rList.get(6).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(6).get(5).substring(1,rList.get(6).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(6).get(6).substring(1,rList.get(6).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(7).get(7).substring(1,rList.get(7).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(7).get(0).substring(1,rList.get(7).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(7).get(1).substring(1,rList.get(7).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(7).get(3).substring(1,rList.get(7).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(7).get(3).substring(1,rList.get(7).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(7).get(3).substring(1,rList.get(7).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(7).get(5).substring(1,rList.get(7).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(7).get(6).substring(1,rList.get(7).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(8).get(7).substring(1,rList.get(8).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(8).get(0).substring(1,rList.get(8).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(8).get(1).substring(1,rList.get(8).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(8).get(3).substring(1,rList.get(8).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(8).get(3).substring(1,rList.get(8).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(8).get(3).substring(1,rList.get(8).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>

                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(8).get(5).substring(1,rList.get(8).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(8).get(6).substring(1,rList.get(8).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(9).get(7).substring(1,rList.get(9).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(9).get(0).substring(1,rList.get(9).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(9).get(1).substring(1,rList.get(9).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(9).get(3).substring(1,rList.get(9).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(9).get(3).substring(1,rList.get(9).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(9).get(3).substring(1,rList.get(9).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>
                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(9).get(5).substring(1,rList.get(9).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(9).get(6).substring(1,rList.get(9).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(10).get(7).substring(1,rList.get(10).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(10).get(0).substring(1,rList.get(10).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(10).get(1).substring(1,rList.get(10).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(10).get(3).substring(1,rList.get(10).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(10).get(3).substring(1,rList.get(10).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(10).get(3).substring(1,rList.get(10).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 :<%=weather%></p>
                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(10).get(5).substring(1,rList.get(10).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(10).get(6).substring(1,rList.get(10).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                    <div style="width: 15%; float: left; margin: 5px;">
                                        <form style="border: 1px solid black;border-radius: 10px; ; padding:10px;">
                                            <div class="card">
                                                <div class="card__info">
                                                    <div style="float:inside; width: 100%; height: 100%;">
                                                        <h4><%=rList.get(11).get(7).substring(1,rList.get(11).get(7).length()-1)%></h4>
                                                    </div>
                                                    <p class="card__info__date">시간 :<%=rList.get(11).get(0).substring(1,rList.get(11).get(0).length()-3)%>시</p>
                                                </div>
                                                <div class="card__weather">
                                                    <svg width="34" class="card__weather__icon" height="24" viewBox="0 0 34 24" fill="none"
                                                         xmlns="http://www.w3.org/2000/svg">
                                                        <path
                                                                d="M31.7764 13.3718C30.8073 12.1841 29.5779 11.4201 28.0897 11.0793C28.5632 10.3633 28.7992 9.57921 28.7992 8.72709C28.7992 7.52249 28.3664 6.49418 27.5014 5.64182C26.6361 4.78976 25.592 4.36354 24.3688 4.36354C23.2612 4.36354 22.3034 4.71584 21.496 5.42044C20.8155 3.80682 19.7334 2.50001 18.251 1.50001C16.7682 0.500241 15.1152 0 13.2921 0C10.8461 0 8.75757 0.852482 7.02679 2.55703C5.29589 4.26116 4.43071 6.31818 4.43071 8.72727C4.43071 8.89777 4.44229 9.1419 4.46532 9.46011C3.12694 10.0738 2.04801 11.0027 1.22884 12.2473C0.409735 13.4913 0 14.8637 0 16.3637C0 18.4659 0.758789 20.2642 2.27594 21.7583C3.79316 23.2528 5.61918 24 7.75375 24H26.5847C28.4191 24 29.9853 23.3603 31.2836 22.0823C32.5816 20.804 33.2308 19.2615 33.2308 17.4545C33.2306 15.9206 32.7457 14.5591 31.7764 13.3718Z"
                                                                fill="#567DF4" />
                                                    </svg>

                                                    <p class="card__weather__temp">온도 :<%=rList.get(11).get(1).substring(1,rList.get(11).get(1).length()-1)%>C</p>
                                                    <%
                                                        if((rList.get(11).get(3).substring(1,rList.get(11).get(3).length()-1)) .equals("1")) {
                                                            weather = "맑음";
                                                        }else if((rList.get(11).get(3).substring(1,rList.get(11).get(3).length()-1)).equals("3")){
                                                            weather = "구름많음";
                                                        }else if((rList.get(11).get(3).substring(1,rList.get(11).get(3).length()-1)).equals("4")) {
                                                            weather = "흐림";
                                                        }
                                                    %>
                                                    <p class="card__weather__temp">날씨상태 : <%=weather%></p>
                                                    <p class="card__weather__temp">강수확률 :<%=rList.get(11).get(5).substring(1,rList.get(11).get(5).length()-1)%>%</p>
                                                    <p class="card__weather__temp">강수량 : <%=rList.get(11).get(6).substring(1,rList.get(11).get(6).length()-1)%></p>

                                                </div>

                                            </div>
                                        </form>
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