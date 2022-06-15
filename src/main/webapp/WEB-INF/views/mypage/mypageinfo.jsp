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
                                            <h2 style="margin: 0 0 0.5em 0;"><%=rDTO.getUser_name()%>님 의 내 정보 페이지 입니다.</h2>
                                        </header>
                                    </div>
                                </article>
                                <!-- Feature 1 -->
                                <section class="container box feature1">
                                    <div class="register m-auto f-de">
                                        <form id="fregisterform">
                                            <ul class="list-group mb-4">
                                                <li class="list-group-item pt-5">
                                                    <h5>개인정보 확인</h5>
                                                    <hr>
                                                </li>
                                                <li class="list-group-item pt-3 pt-sm-4">
                                                    <div class="form-group row">
                                                        <label class="col-sm-2" for="reg_mb_nick">E-MAIL<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="hidden" name="mb_nick_default" value="<%=rDTO.getUser_email()%>">
                                                            <input type="text" name="mb_nick" value="<%=rDTO.getUser_email()%>" id="reg_mb_nick" required="" class="form-control nospace required" maxlength="20">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <p class="form-control-plaintext f-de text-muted pb-0">
                                                               관심카테고리 : <%=rDTO.getTlv_int()%>
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-sm-2" for="reg_mb_name">이름<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="text" id="reg_mb_name" name="mb_name" value="<%=rDTO.getUser_name()%>" readonly="" class="form-control ">
                                                        </div>
                                                    </div>


                                                    <div class="form-group row">
                                                        <label class="col-sm-2" for="reg_mb_email">age<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="hidden" name="old_email" value="<%=rDTO.getAge()%>">
                                                            <input type="text" name="mb_email" value="<%=rDTO.getAge()%>" id="reg_mb_email" required="" class="form-control nospace required" maxlength="20">
                                                        </div>
                                                    </div>

                                                    <div class="form-group row">
                                                        <label class="col-sm-2" for="reg_mb_name">성별<strong class="sr-only">필수</strong></label>
                                                        <div class="col-sm-4">
                                                            <input type="text" id="sex" name="mb_name" value="<%=rDTO.getSex()%>" readonly="" class="form-control ">
                                                        </div>
                                                    </div>

                                                </li>

                                                <li class="list-group-item pt-5">
                                                    <h5>친구승인 목록</h5>
                                                    <hr>
                                                </li>
                                            </ul>

                                                <ul class="list-group" style="text-align: left;">
                                                    <%for(int i=0; i<uList.size(); i++) {
                                                        if(uList.get(i).getValue().equals("0")) {
                                                    %>
                                                        <li class="list-group-item"><%=uList.get(i).getUser_name()%>의 친구요청이 있습니다!!!
                                                            <a onclick="friendCheck(<%=uList.get(i).getUser_seq()%>)" class="btn btn-primary nofocus" role="button" style="width:15%; float: right;">
                                                                <i class="fa fa-user-plus" aria-hidden="true"></i>
                                                                친구추가
                                                            </a>
                                                        </li>
                                                    <%
                                                        }
                                                    }
                                                    %>
                                                </ul>
                                                <ul class="list-group">
                                                    <li class="list-group-item pt-5">
                                                        <h5>친구 목록</h5>
                                                        <hr>
                                                    </li>
                                                </ul>
                                            <ul class="list-group" style="text-align: left;">
                                                <%for(int i=0; i<uList.size(); i++) {
                                                    if(uList.get(i).getValue().equals("1")) {
                                                %>
                                                <li class="list-group-item">이름: <%=uList.get(i).getUser_name()%>
                                                    <a onclick="location.href='/friendInfo?user_email=<%=uList.get(i).getUser_email()%>&user_email=<%=uList.get(i).getUser_name()%>'" class="btn btn-primary nofocus" role="button" style="width:15%; float: right;">
                                                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                                                        상세보기
                                                    </a>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    이메일: <%=uList.get(i).getUser_email()%>
                                                </li>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </ul>
                                        </form>
<%--                                        <section>--%>
<%--                                                <form style="width:100%; height: 100%; border: 1px solid black;border-radius: 10px; margin-left: auto; margin-right: auto; padding:10px;" action="/deleteUser">--%>
<%--                                                    <div style="float:inside; width: 100%; height: 100%;">--%>
<%--                                                        <br>--%>
<%--                                                        <h2>이메일</h2>--%>
<%--                                                        <div style="width:70%;height: 70%; border: 1px solid black;border-radius: 10px; margin-left: auto; margin-right: auto; font-size: 20px;">--%>
<%--                                                            <div>--%>
<%--                                                            <%=rDTO.getUser_email()%>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <hr>--%>
<%--                                                        <h2>이름</h2>--%>
<%--                                                        <div style="width:70%;height: 100%; border: 1px solid black;border-radius: 10px; margin-left: auto; margin-right: auto; font-size: 20px;">--%>
<%--                                                        <%=rDTO.getUser_name()%>--%>
<%--                                                        </div>--%>
<%--                                                        <hr>--%>
<%--                                                        <h2>나이</h2>--%>
<%--                                                        <div style="width:20%;height: 100%; border: 1px solid black;border-radius: 10px; margin-left: auto; margin-right: auto; font-size: 20px;">--%>
<%--                                                        <%=rDTO.getAge()%>--%>
<%--                                                        </div>--%>
<%--                                                        <hr>--%>
<%--                                                        <h2>성별</h2>--%>
<%--                                                        <div style="width:20%;height: 100%; border: 1px solid black;border-radius: 10px; margin-left: auto; margin-right: auto; font-size: 20px;">--%>
<%--                                                            <%=rDTO.getSex()%>--%>
<%--                                                        </div>--%>
<%--                                                        <hr>--%>
<%--                                                    </div>--%>
<%--                                                    <button type="submit">회원탈퇴</button>--%>
<%--                                                </form>--%>
<%--                                        </section>--%>
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
<script>
    function friendCheck(user_seq) {
        console.log("user_seq : " + user_seq);
        console.log("receive_user : " + "<%=rDTO.getUser_name()%>");
        /*user_seq가지고 UserInfo 테이블의 user_name 가져오기*/
        $.ajax({
            type: "GET", // get방식
            url: "/user/friendCheck", // 파이썬으로 통신
            data: {
                "user_seq" : user_seq,
                "receive_user" : '<%=rDTO.getUser_name()%>'
            }, // area 데이터 값
            contentType: "application/json; charset=utf-8", // json 인코딩
            dataType: "text", //json타입
            success(result) {
                console.log(result);
                swal({
                    title : "친구 추가 완료",
                    text : "확인 버튼을 눌러주세요.",
                    icon : "success"
                }).then(function() {
                    window.location.href = 'http://localhost:10000/mypageinfo';
                });
            },
            error: (log) => {
                alert("실패" + log)
            }

        })
    }

</script>
</body>

</html>