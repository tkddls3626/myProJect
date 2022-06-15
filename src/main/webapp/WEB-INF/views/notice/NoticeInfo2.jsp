<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String user_email = CmmUtil.nvl((String)session.getAttribute("SS_USER_EMAIL"));
    String admin = CmmUtil.nvl((String)session.getAttribute("SS_USER_TYPE"));
    String user_name = CmmUtil.nvl((String) session.getAttribute("SS_USER_NAME"));
    NoticeDTO rDTO = (NoticeDTO) request.getAttribute("rDTO");
    String reg_id = (String) session.getAttribute("reg_id");
    List<NoticeDTO > rList = (List<NoticeDTO>) request.getAttribute("rList");
    String user_seq = CmmUtil.nvl((String)session.getAttribute("SS_USER_SEQ"));


//공지글 정보를 못불러왔다면, 객체 생성
    if (rDTO == null) {
        rDTO = new NoticeDTO();
    }

//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
    int edit = 1;

//로그인 안했다면....
    if (user_name.equals("")) {
        edit = 3;

//본인이 작성한 글이면 2가 되도록 변경
    }else if(user_email.equals("admin")) {
        edit = 4;

    }else if (user_name.equals(rDTO.getReg_id())) {
        edit = 2;
    }
    System.out.println(("user_email : " + user_email));
    System.out.println("admin : " + admin);
    System.out.println("user_name : " + user_name);
    System.out.println("reg_id : " + rDTO.getReg_id());
    System.out.println("reg_id : " + reg_id);
    System.out.println("rList : " + rList.size());
%>
<!DOCTYPE HTML>

<html>

<head>
    <title>Right Sidebar - ZeroFour by HTML5 UP</title>
    <script type="text/javascript">
        //수정하기
        function doEdit() {
            if ("<%=edit%>" == 2) {
                location.href = "/notice/NoticeEditInfo2?nSeq=<%=rDTO.getNotice_seq()%>";

           } else if ("<%=edit%>" == 4) {
                location.href = "/notice/NoticeEditInfo2?nSeq=<%=rDTO.getNotice_seq()%>";

           }else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");
            }
        }


        //삭제하기
        function doDelete() {
            if ("<%=edit%>" == 2) {
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    location.href = "/notice/NoticeDelete?nSeq=<%=rDTO.getNotice_seq()%>";
                }

            } else if("<%=edit%>" == 4){
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    location.href = "/notice/NoticeDelete?nSeq=<%=rDTO.getNotice_seq()%>";
                }
                }else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");

            } else {
                alert("본인이 작성한 글만 삭제 가능합니다.");

            }
        }

        //목록으로 이동
        function doList() {
            location.href = "/notice/NoticeList2";

        }
    </script>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/css/main.css"/>
    <link rel="stylesheet" href="/css/car.css"/>
    <link rel="canonical" href="http://stocad.kr/chapark/3">
    <link rel="stylesheet" href="http://stocad.kr/nariya/app/bs4/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/nariya/css/nariya.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/theme.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/font/NEXON-Gothic-14px.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/css/color/Blue.css" type="text/css">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/widget/data-keyword/widget.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/skin/board/BS4-Basic-List/style.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/widget/sidebar/widget.css?ver=191202">
    <link rel="stylesheet" href="http://stocad.kr/theme/BS4-Basic/skin/social/style.css?ver=191202">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" type="text/css">
    <style type="text/css">
        @font-face {
            src: url("/fonts/poppins/BMJUA_ttf.ttf");
            font-family: "jua";
        }

        p {
            font-family: "jua";
        }

        label {
            font-family: "jua";
        }

        a {
            font-family: "jua";
        }

        h2 {
            font-family: "jua";
        }

        h3 {
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

                                <!-- Feature 1 -->

                                <section class="container box feature1">
                                    <!-- 게시물 읽기 시작 { -->
                                    <article id="bo_v" class="mb-4">

                                        <header class="font-weight-normal mb-2 px-3 px-sm-0">
                                            <h1 id="bo_v_title"><%=rDTO.getTitle()%></h1>
                                        </header>

                                        <section id="bo_v_info" class="f-sm font-weight-normal mb-3 mb-sm-4">
                                            <div class="clearfix bg-light border-top text-muted px-3 py-2">
                                                <h3 class="sr-only">작성자 정보</h3>
                                                <ul class="d-flex align-items-center">
                                                    <li class="pr-2">
                                                        <span class="sv_member"><%=rDTO.getReg_id()%></span>
                                                        <span class="sr-only">작성자</span>
                                                    </li>
                                                    <li class="flex-grow-1 text-right">
                                                        <span class="sr-only">작성일</span>
                                                        <time class="f-xs" ><%=rDTO.getReg_dt()%></time>
                                                    </li>
                                                </ul>
                                            </div>

                                            <div class="clearfix f-sm text-muted px-3 pt-2">
                                                <h3 class="sr-only">컨텐츠 정보</h3>
                                                <ul class="d-flex align-items-center">
                                                    <li class="pr-3">
                                                        <i class="fa fa-eye" aria-hidden="true"></i><%=rDTO.getNotice_cnt()%>
                                                        <span class="sr-only">조회</span>
                                                    </li>
                                                    <li class="pr-3">
                                                        <i class="fa fa-commenting-o" aria-hidden="true"></i><%=rDTO.getNotice_good()%>
                                                        <span class="sr-only">좋아요</span>
                                                    </li>
                                                    <li id="bo_v_btn" class="d-none d-sm-block flex-sm-grow-1 text-right">
                                                        <!-- 게시물 상단 버튼 시작 { -->


                                                        <a onclick="doList()" class="btn btn_b01 nofocus p-1 ml-2" role="button">
                                                            <i class="fa fa-bars" aria-hidden="true"></i>
                                                            목록
                                                        </a>
                                                        <a onclick="doDelete()" class="btn btn_b01 nofocus p-1 ml-2" role="button">
                                                            <i class="fa fa-reply" aria-hidden="true"></i>
                                                            삭제
                                                        </a>
                                                        <a onclick="doEdit()" class="btn btn-primary nofocus py-1 ml-2" role="button">
                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                            수정
                                                        </a>
                                                        <a onclick="window.open('/chat/noticeChat?reg_id=<%=rDTO.getReg_id()%>&notice_seq=<%=rDTO.getNotice_seq()%>')" class="btn btn-primary nofocus py-1 ml-2" role="button">
                                                            <i class="fa fa-comment" aria-hidden="true"></i>
                                                            채팅하기
                                                        </a>
                                                        <a onclick="addFriend(<%=user_seq%>)" class="btn btn-primary nofocus py-1 ml-2" role="button">
                                                            <i class="fa fa-user-friends" aria-hidden="true"></i>
                                                            친구추가
                                                        </a>
                                                        <!-- } 게시물 상단 버튼 끝 -->
                                                    </li>
                                                </ul>
                                            </div>
                                        </section>

                                        <section id="bo_v_atc">
                                            <h3 class="sr-only">본문</h3>
                                            <!-- 본문 내용 시작 { -->
                                            <div id="bo_v_con" class="mb-4 px-3">


                                                <div id="bo_v_img">
                                                </div>

                                                <div class="view-content">
                                                    <br/><%=rDTO.getNotice_contents()%></div>

                                            </div>
                                            <!-- } 본문 내용 끝 -->

                                            <div id="bo_v_btn_group" class="clearfix text-center py-4 px-3 en">
                                                <div class="btn-group btn-group-lg" role="group">


                                                </div>
                                            </div>

                                        </section>

                                        <section id="bo_v_data">
                                            <h3 class="sr-only">관련자료</h3>
                                            <ul class="na-table d-table w-100 text-muted f-de font-weight-normal">

                                                <!-- 다음글 시작 { -->
                                                <li class="d-table-row border-top border-bottom">
                                                    <div class="d-none d-sm-table-cell text-center px-3 py-2 nw-6">
                                                        다음
                                                    </div>
                                                    <div class="d-table-cell px-3 py-2">
                                                        <div class="d-flex my-1">
                                                            <div class="px-0">
                                                                <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                                            </div>
                                                            <div class="px-3 flex-grow-1 text-break-all">
                                                                <%
                                                                    if (Integer.parseInt(rDTO.getNotice_seq()) == rList.size()) {
                                                                %>
                                                                <a href="/notice/NoticeInfo2?nSeq=<%=Integer.parseInt(rDTO.getNotice_seq())%>">
                                                                    다음글이 없습니다.
                                                                </a>
                                                                <%  } else { %>

                                                                <a href="/notice/NoticeInfo2?nSeq=<%=Integer.parseInt(rDTO.getNotice_seq())+1%>">
                                                                    <%=rList.get(Integer.parseInt(rDTO.getNotice_seq())).getTitle()%>
                                                                </a>
                                                                 <% }  %>
                                                            </div>
                                                            <div class="d-none d-md-block px-0 f-sm text-nowrap font-weight-normal">
                                                                <span class="sr-only">작성일</span>
                                                                2021.07.22 14:12					</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- } 다음글 끝 -->

                                            </ul>
                                        </section>
                                    </article>
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
<script>
    function addFriend(user_seq){
        $.ajax({
            type: "GET", // get방식
            url: "/user/addFriend", // 파이썬으로 통신
            data: {
               "user_seq" : user_seq,
               "receive_user" : "<%=rDTO.getReg_id()%>"
            }, // area 데이터 값
            contentType: "application/json; charset=utf-8", // json 인코딩
            dataType: "text", //json타입
            success(result) {
                console.log("result")
            },
            error: (log) => {
                alert("실패" + log)
            }

        })
    }
</script>
</body>
</html>