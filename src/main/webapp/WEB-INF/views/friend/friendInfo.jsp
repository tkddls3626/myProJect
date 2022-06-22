<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.dto.FriendDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String user_email = CmmUtil.nvl((String) session.getAttribute("SS_USER_EMAIL"));
    UserInfoDTO rDTO = (UserInfoDTO)request.getAttribute("rDTO");
    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");


System.out.println("rDTO : " + rDTO.getTlv_int());
%>
<!DOCTYPE HTML>

<html>

<head>
    <title>친구목록</title>
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
                                            <h2 style="margin: 0 0 0.5em 0;"><%=rDTO.getUser_name()%>님 의 내 정보 페이지 입니다.</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div class="register m-auto f-de">
                                        <form id="fregisterform2" method="post">
                                            <ul class="list-group mb-4">
                                                <li class="list-group-item pt-5">
                                                    <h5>개인정보 확인</h5>
                                                    <hr>
                                                </li>
                                                <li class="list-group-item pt-3 pt-sm-4">
                                                    <div class="form-group row">
                                                        <label class="col-sm-2">E-MAIL<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="hidden" value="<%=rDTO.getUser_email()%>">
                                                            <input type="text" value="<%=rDTO.getUser_email()%>" id="reg_mb_nick" required="" class="form-control nospace required" maxlength="20">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <a onclick="evalFriend()" class="btn btn-primary nofocus" role="button" style="width:30%;" data-toggle="modal" data-target="#exampleModalCenter">
                                                                <i class="fa fa-address-card" aria-hidden="true"></i>
                                                                평가하기
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-sm-2" >이름<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="text" id="reg_mb_name" value="<%=rDTO.getUser_name()%>" readonly="" class="form-control ">
                                                        </div>
                                                    </div>


                                                    <div class="form-group row">
                                                        <label class="col-sm-2">age<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="hidden"  value="<%=rDTO.getAge()%>">
                                                            <input type="text"  value="<%=rDTO.getAge()%>" id="reg_mb_email" required="" class="form-control nospace required" maxlength="20">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-sm-2" >성별<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="text" id="sex" value="<%=rDTO.getSex()%>" readonly="" class="form-control ">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-2" >차량<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="text" id="car" value="<%=rDTO.getCar_yn()%>" readonly="" class="form-control ">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-sm-2" for="reg_mb_nick">E-관심카테고리리<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="hidden" name="mb_nick_default" value="<%=rDTO.getTlv_int()%>">
                                                            <input type="text" name="mb_nick" value="<%=rDTO.getTlv_int()%>" id="reg_mb_sex" required="" class="form-control nospace required" maxlength="20">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <p class="form-control-plaintext f-de text-muted pb-0">
                                                                매너지수 : <%=Math.round((Double.parseDouble(rDTO.getManner_index()))*100)/100.0%>
                                                            <ul class="display-container">
                                                                <li class="note-display">
                                                                    <figure class="CircleStrokeMeter" data-score="7.5">
                                                                    </figure>
                                                                </li>
                                                            </ul>
                                                            </p>
                                                        </div>

                                                    </div>

                                                </li>

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
</body>

</html>