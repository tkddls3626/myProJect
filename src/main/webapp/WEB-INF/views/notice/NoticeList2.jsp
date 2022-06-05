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
    <style>
        div.blueTable {
            border: 1px solid #1C6EA4;
            background-color: #EEEEEE;
            width: 100%;
            text-align: left;
            border-collapse: collapse;

        }
        .divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
            border: 1px solid #AAAAAA;
            padding: 3px 2px;

        }
        .divTable.blueTable .divTableBody .divTableCell {
            margin: 0 0 0.5em 0;
            font-size: 13px;
        }
        .divTable.blueTable .divTableRow:nth-child(even) {
            background: #000000;
        }
        .divTable.blueTable .divTableHeading {
            background: #1C6EA4;
            background: -moz-linear-gradient(top, #333333 0%, #0a0a0a  66%, #000000 100%);
            background: -webkit-linear-gradient(top, #333333 0%, #333333 66%, #333333 100%);
            background: linear-gradient(to bottom, #333333 0%, #333333 66%, #333333 100%);
            border-bottom: 2px solid #444444;
        }
        .divTable.blueTable .divTableHeading .divTableHead {
            font-size: 15px;
            font-weight: bold;
            color: #FFFFFF;
            border-left: 2px solid #333333;
        }
        .divTable.blueTable .divTableHeading .divTableHead:first-child {
            border-left: none;
        }

        .blueTable .tableFootStyle {
            font-size: 14px;
            font-weight: bold;
            color: #333333;
            background: #D0E4F5;
            background: -moz-linear-gradient(top, #333333 0%, #333333 66%, #333333 100%);
            background: -webkit-linear-gradient(top, #333333 0%, #333333 66%, #333333 100%);
            background: linear-gradient(to bottom, #333333 0%, #f3f3f3 66%, #333333 100%);
            border-top: 2px solid #444444;
        }
        .blueTable .tableFootStyle {
            font-size: 14px;
        }
        .blueTable .tableFootStyle .links {
            text-align: right;
        }
        .blueTable .tableFootStyle .links a{
            display: inline-block;
            background: #333333;
            color: #FFFFFF;
            padding: 2px 8px;
            border-radius: 5px;
        }
        .blueTable.outerTableFooter {
            border-top: none;
        }
        .blueTable.outerTableFooter .tableFootStyle {
            padding: 3px 5px;
        }
        /* DivTable.com */
        .divTable{ display: table; }
        .divTableRow { display: table-row; }
        .divTableHeading { display: table-header-group;}
        .divTableCell, .divTableHead { display: table-cell;}
        .divTableHeading { display: table-header-group;}
        .divTableFoot { display: table-footer-group;}
        .divTableBody { display: table-row-group;}
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
                                    <li><a href="#">채팅내역</a></li>
                                    <li><a href="#">카카오톡 알림 신청</a></li>
                                    <li><a href="#">내 정보 수정</a></li>
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
                                            <h2 style="margin: 0 0 0.5em 0;">공지사항 및 자유게시판</h2>
                                        </header>
                                    </div>
                                    <div>
                                        <button type="button" style="background-color: #333333; float: right;">글삭제</button>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                        <div class="col-12">
                                        </div>
                                        <div class="col-4 col-12-medium">
                                            <section>
                                                <div class="divTable blueTable">
                                                    <div class="divTableHeading">
                                                        <div class="divTableRow">
                                                            <div class="divTableHead" id="" style="width: 10%;">번호</div>
                                                            <div class="divTableHead" style="width: 40%;">제목</div>
                                                            <div class="divTableHead" style="width: 10%;">작성자</div>
                                                            <div class="divTableHead" style="width: 20%;">작성일</div>
                                                            <div class="divTableHead" style="width: 10%;">조회</div>
                                                            <div class="divTableHead" style="width: 10%;">좋아요</div>
                                                        </div>
                                                    </div>
                                                    <div class="divTableBody">
                                                        <div class="divTableRow">
                                                            <div class="divTableCell">cell1_1</div>
                                                            <div class="divTableCell">cell2_1</div>
                                                            <div class="divTableCell">cell3_1</div>
                                                            <div class="divTableCell">cell4_1</div>
                                                            <div class="divTableCell">cell5_1</div>
                                                            <div class="divTableCell">cell6_1</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="blueTable outerTableFooter">
                                                    <div class="tableFootStyle">
                                                        <div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
                                                    </div>
                                                </div>
                                                <button type="button"  onclick="location.href='NoticeReg'" style="background-color: #333333; float: right;">글쓰기</button>
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