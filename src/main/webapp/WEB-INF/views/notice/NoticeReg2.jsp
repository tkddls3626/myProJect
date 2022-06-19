<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
    String admin = CmmUtil.nvl((String)session.getAttribute("SS_USER_TYPE"));

%>
<!DOCTYPE HTML>

<html>

<head>
    <title>게시판 작성</title>
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
                                            <h2 style="margin: 0 0 0.5em 0;">게시판 글 작성</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">

                                    <h2><%=user_name%>님 환영합니다 게시글을 작성해주세요!</h2>
                                    <div class="col-4 col-12-medium">
                                        <section>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <form action="/notice/NoticeInsert" >
                                                            <div class="form-wrapper">
                                                                <div class="row">
                                                                    <label for="content"><h2>제목</h2></label>
                                                                </div>
                                                                <input type="text" placeholder="제목을 작성해주세요" id="title" name="title" class="form-control">
                                                            </div>
                                                            <div class="form-wrapper">
                                                                <div class="row">
                                                                    <label for="content"><h2>공지글여부</h2></label>
                                                                </div>
                                                                <select name="notice_yn" id="notice_yn" class="form-control" >
                                                                    <option value="" disabled selected>공지글여부</option>
                                                                    <option value="Y">예</option>
                                                                    <option value="N">아니요</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-wrapper">
                                                                <div class="row">
                                                                    <label for="content"><h2>작성자</h2></label>
                                                                </div>
                                                                    <input type="text" value="<%=user_name%>"  id="reg_id" name="reg_id" class="form-control" readonly>
                                                            </div>
                                                            <div class="form-wrapper">
                                                                <div class="row">
                                                                <label for="content"><h2>내용</h2></label>
                                                                </div>
                                                                <textarea class="form-control" id="notice_contents" name="notice_contents" placeholder="내용을 입력하세요"></textarea>
                                                            </div>
                                                        <button type ="button" onclick="location.href='/notice/NoticeList2'" id="back">취소</button>
                                                        <button type="submit" class="btn btn-primary" id="insert">등록</button>
                                                        </form>
                                                    </div>
                                                </div>
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
<!--
TODO 회원정보 수정 삭제 하기
!-->