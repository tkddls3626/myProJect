<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>

<head>
    <title>차박 여행지 조회</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/car.css" />
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
                                            <h2 style="margin: 0 0 0.5em 0;">차박여행지 조회하기</h2>
                                            <input type="text" list="carServiceList" id="carServiceArea" value="" placeholder="Search for..." name="carlist">
                                            <datalist id="carServiceList">
                                                <option value="서울시">
                                                <option value="강원도">
                                                <option value="경기도">
                                                <option value="충청북도">
                                                <option value="충청남도">
                                                <option value="전라북도">
                                                <option value="전라남도">
                                                <option value="경상북도">
                                                <option value="경상남도">
                                                <option value="제주도">

                                            </datalist>
                                            <input type="button" value="go" id="carServiceApi">
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div class="check-box-table-cell">
                                        <div class="col-12">
                                        </div>
                                        <div class="col-4 col-12-medium">
                                            <section>
                                                <div class="carSearchAPI" id="carSearchAPI">

                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer Wrapper -->
    <div id="footer-wrapper">
        <footer id="footer" class="container">
            <div class="row">
                <div class="col-12">
                    <div id="copyright">
                        <ul class="menu">
                            <li>&copy; Untitled. All rights reserved</li>
                            <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</div>
<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/browser.min.js"></script>
<script src="/js/breakpoints.min.js"></script>
<script src="/js/util.js"></script>
<script src="/js/main.js"></script>
<script>
    $("#carServiceApi").click(() => {
        let area = document.getElementById("carServiceArea").value;
        console.log("area : " + area);
        $.ajax({
            type: "GET", // get방식
            url: "http://localhost:5002/carSearchAPI", // 파이썬으로 통신
            data: {
                "area": area
            }, // area 데이터 값
            contentType: "application/json; charset=utf-8", // json 인코딩
            dataType: "json", //json타입
            success(result) {
                console.table(result)
                $("#carSearchAPI div").empty();
                for(i=0; i<result.length; i++){

                    let new_div = '<div class="col-8 col-12-medium" style="width:45%; height: auto; margin-left: 10px; margin-right: 10px; float: left;"> <section>' +
                        '<a href="/carInfo?carName=' + result[i][1] + '" class="image featured"><img src="' + result[i][1] + '" style="width:100%; height: 400px;" alt="" /></a>' +
                        '<header class="second icon solid fa-user"><h3>"' + result[i][0] + '"</h3></header></section> </div>';
                    console.log(new_div);
                    $(".carSearchAPI").append(new_div);

                }
            },
            error: (log) => {
                alert("실패" + log)
            }

        })
    })
</script>
</body>

</html>