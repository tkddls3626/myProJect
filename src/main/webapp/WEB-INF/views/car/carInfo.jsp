<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<String> rList = (List<String>) request.getAttribute("rList");
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
                                            <h2 style="margin: 0 0 0.5em 0;">차박지 정보</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div class="row">
                                        <div class="col-12">
                                            <img src="<%=rList.get(5)%>">
                                            <%for(int i=0; i<rList.size()-3; i++) {%>
                                            <h2><%=rList.get(i)%></h2>
                                            <%}%>
                                            <div id="map" style="width:50%;height:400px; margin-left: auto; margin-right: auto;"></div>
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
</div>
<!-- Scripts -->
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dropotron.min.js"></script>
<script src="/js/browser.min.js"></script>
<script src="/js/breakpoints.min.js"></script>
<script src="/js/util.js"></script>
<script src="/js/main.js"></script>
<script>
    // 지도를 표시할 div
    let mapContainer = document.getElementById('map'),
        mapOption = {
            // 지도의 중심좌표
            center: new kakao.maps.LatLng(<%=rList.get(7)%>, <%=rList.get(6)%>),
            // 지도의 확대 레벨(1~14) 값이 클 수록 지도가 축소 되어 보임.
            level: 5
        };

    // 지도를 표시할 div와 지도 옵션으로 지도를 생성.
    let map = new kakao.maps.Map(mapContainer, mapOption);


    // 마커가 표시될 위치.
    let markerPosition  = new kakao.maps.LatLng(<%=rList.get(7)%>, <%=rList.get(6)%>);

    // 마커를 생성.
    let marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커를 해당 위치에 설정
    marker.setMap(map);
</script>
</body>

</html>