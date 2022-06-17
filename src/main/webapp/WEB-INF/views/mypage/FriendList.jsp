<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.dto.FriendDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<%
    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");
%>
<html>

<head>
    <title>Right Sidebar - ZeroFour by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/car.css" />
    <link rel="canonical" href="http://stocad.kr/bbs/register_form.php">
    <link rel="stylesheet" href="http://stocad.kr/nariya/app/bs4/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/nariya/css/nariya.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/theme.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/font/NEXON-Gothic-14px.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/color/Blue.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/widget/data-keyword/widget.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/skin/member/BS4-Basic/style.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/widget/sidebar/widget.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/skin/social/style.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/js/font-awesome/css/font-awesome.min.css" type="text/css">
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
                                            <h2 style="margin: 0 0 0.5em 0;">친구 목록</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div class="register m-auto f-de">
                                        <form id="fregisterform">
                                            <ul class="list-group mb-4">

                                            </ul>
                                            <ul class="list-group" style="text-align: left;">
                                                    <!-- for문 써서 벨류값 담아놓기 -->
                                                <%for(int i=0; i<uList.size(); i++) { %>
                                                <li class="list-group-item" style="width: 70%;"><%=uList.get(i).getUser_name()%>
                                                    <a onclick="evalFriend()" class="btn btn-primary nofocus" role="button" style="width:15%; float: right;" data-toggle="modal" data-target="#exampleModalCenter">
                                                        <i class="fa fa-address-card" aria-hidden="true"></i>
                                                        평가하기
                                                    </a>
                                                </li>
                                                <% } %>

                                            </ul>
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

<%--model 창--%>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">친구 매너지수 평가하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%@include file="../elt/evaluate.jsp"%>
            </div>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--            </div>--%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
    function evalFriend() {

    }

</script>
</body>

</html>