<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<String> rList = (List<String>) request.getAttribute("rList");
        %>
<!DOCTYPE HTML>

<html>
<head>
    <title>Left Sidebar - ZeroFour by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/css/main.css" />
    <style>
        table {
        width: 100%;
    }

    table, th, td {
        border: 1px solid #bcbcbc;
    }</style>
</head>
<body class="left-sidebar is-preload">
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
                        <div class="col-4 col-12-medium">
                            <div id="sidebar">

                                <!-- Sidebar -->

                                <section>
                                    <header class="major">
                                        <h2>Subheading</h2>
                                    </header>
                                    <p>Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus.
                                        Praesent semper mod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat.
                                        Aliquam luctus et mattis lectus sit amet pulvinar. Nam turpis nisi
                                        consequat etiam.</p>
                                    <footer>
                                        <a href="#" class="button icon solid fa-info-circle">Find out more</a>
                                    </footer>
                                </section>

                                <section>
                                    <header class="major">
                                        <h2>Subheading</h2>
                                    </header>
                                    <ul class="style2">
                                        <li><a href="#">Amet turpis, feugiat et sit amet</a></li>
                                        <li><a href="#">Ornare in hendrerit in lectus</a></li>
                                        <li><a href="#">Semper mod quis eget mi dolore</a></li>
                                        <li><a href="#">Quam turpis feugiat sit dolor</a></li>
                                        <li><a href="#">Amet ornare in hendrerit in lectus</a></li>
                                        <li><a href="#">Semper mod quisturpis nisi</a></li>
                                        <li><a href="#">Consequat etiam lorem phasellus</a></li>
                                        <li><a href="#">Amet turpis, feugiat et sit amet</a></li>
                                        <li><a href="#">Semper mod quisturpis nisi</a></li>
                                    </ul>
                                    <footer>
                                        <a href="#" class="button icon solid fa-arrow-circle-right">Do Something</a>
                                    </footer>
                                </section>

                            </div>
                        </div>
                        <div class="col-8 col-12-medium imp-medium">
                            <div id="content">

                                <!-- Content -->

                                <article>
                                    <header class="major">
                                        <h2>Left Sidebar</h2>
                                        <p>Which means the sidebar is on the left</p>
                                    </header>

                                    <span class="image featured">
                                        <table>
                                          <caption>현재 날씨 정보</caption>
                                          <thead>
                                            <tr>
                                              <th></th>
                                              <th>기온</th>
                                              <th>강수형태</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <th>현재기온</th>
                                              <td><%=rList.get(0)%>º</td>
                                              <td>Dolor</td>
                                            </tr>
                                            <tr>
                                              <th>강수량</th>
                                              <td>Dolor</td>
                                              <td> <%=rList.get(1)%></td>
                                            </tr>
                                            <tr>
                                              <th>최저기온</th>
                                              <td><%=rList.get(2)%>º</td>
                                              <td>Dolor</td>
                                            </tr>
                                           <tr>
                                              <th>최고기온</th>
                                              <td><%=rList.get(3)%>º</td>
                                              <td>Dolor</td>
                                            </tr>
                                          </tbody>
                                        </table>
                                    </span>

                                    <p>Phasellus quam turpis, feugiat sit amet ornare in, hendrerit in lectus.
                                        Praesent semper mod quis eget mi. Etiam eu ante risus. Aliquam erat volutpat.
                                        Aliquam luctus et mattis lectus sit amet pulvinar. Nam turpis nisi
                                        consequat etiam lorem ipsum dolor sit amet nullam.</p>

                                    <h3>More intriguing information</h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac quam risus, at tempus
                                        justo. Sed dictum rutrum massa eu volutpat. Quisque vitae hendrerit sem. Pellentesque lorem felis,
                                        ultricies a bibendum id, bibendum sit amet nisl. Mauris et lorem quam. Maecenas rutrum imperdiet
                                        vulputate. Nulla quis nibh ipsum, sed egestas justo. Morbi ut ante mattis orci convallis tempor.
                                        Etiam a lacus a lacus pharetra porttitor quis accumsan odio. Sed vel euismod nisi. Etiam convallis
                                        rhoncus dui quis euismod. Maecenas lorem tellus, congue et condimentum ac, ullamcorper non sapien.
                                        Donec sagittis massa et leo semper a scelerisque metus faucibus. Morbi congue mattis mi.
                                        Phasellus sed nisl vitae risus tristique volutpat. Cras rutrum commodo luctus.</p>

                                    <p>Phasellus odio risus, faucibus et viverra vitae, eleifend ac purus. Praesent mattis, enim
                                        quis hendrerit porttitor, sapien tortor viverra magna, sit amet rhoncus nisl lacus nec arcu.
                                        Suspendisse laoreet metus ut metus imperdiet interdum aliquam justo tincidunt. Mauris dolor urna,
                                        fringilla vel malesuada ac, dignissim eu mi. Praesent mollis massa ac nulla pretium pretium.
                                        Maecenas tortor mauris, consectetur pellentesque dapibus eget, tincidunt vitae arcu.
                                        Vestibulum purus augue, tincidunt sit amet iaculis id, porta eu purus.</p>
                                </article>

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
                <div class="col-3 col-6-medium col-12-small">

                    <!-- Links -->
                    <section>
                        <h2>Filler Links</h2>
                        <ul class="divided">
                            <li><a href="#">Quam turpis feugiat dolor</a></li>
                            <li><a href="#">Amet ornare in hendrerit </a></li>
                            <li><a href="#">Semper mod quisturpis nisi</a></li>
                            <li><a href="#">Consequat etiam phasellus</a></li>
                            <li><a href="#">Amet turpis, feugiat et</a></li>
                            <li><a href="#">Ornare hendrerit lectus</a></li>
                            <li><a href="#">Semper mod quis et dolore</a></li>
                            <li><a href="#">Amet ornare in hendrerit</a></li>
                            <li><a href="#">Consequat lorem phasellus</a></li>
                            <li><a href="#">Amet turpis, feugiat amet</a></li>
                            <li><a href="#">Semper mod quisturpis</a></li>
                        </ul>
                    </section>

                </div>
                <div class="col-3 col-6-medium col-12-small">

                    <!-- Links -->
                    <section>
                        <h2>More Filler</h2>
                        <ul class="divided">
                            <li><a href="#">Quam turpis feugiat dolor</a></li>
                            <li><a href="#">Amet ornare in in lectus</a></li>
                            <li><a href="#">Semper mod sed tempus nisi</a></li>
                            <li><a href="#">Consequat etiam phasellus</a></li>
                        </ul>
                    </section>

                    <!-- Links -->
                    <section>
                        <h2>Even More Filler</h2>
                        <ul class="divided">
                            <li><a href="#">Quam turpis feugiat dolor</a></li>
                            <li><a href="#">Amet ornare hendrerit lectus</a></li>
                            <li><a href="#">Semper quisturpis nisi</a></li>
                            <li><a href="#">Consequat lorem phasellus</a></li>
                        </ul>
                    </section>

                </div>
                <div class="col-6 col-12-medium imp-medium">

                    <!-- About -->
                    <section>
                        <h2><strong>ZeroFour</strong> by HTML5 UP</h2>
                        <p>Hi! This is <strong>ZeroFour</strong>, a free, fully responsive HTML5 site
                            template by <a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net/">HTML5 UP</a>.
                            It's <a href="http://html5up.net/license/">Creative Commons Attribution</a>
                            licensed so use it for any personal or commercial project (just credit us
                            for the design!).</p>
                        <a href="#" class="button alt icon solid fa-arrow-circle-right">Learn More</a>
                    </section>

                    <!-- Contact -->
                    <section>
                        <h2>Get in touch</h2>
                        <div>
                            <div class="row">
                                <div class="col-6 col-12-small">
                                    <dl class="contact">
                                        <dt>Twitter</dt>
                                        <dd><a href="#">@untitled-corp</a></dd>
                                        <dt>Facebook</dt>
                                        <dd><a href="#">facebook.com/untitled</a></dd>
                                        <dt>WWW</dt>
                                        <dd><a href="#">untitled.tld</a></dd>
                                        <dt>Email</dt>
                                        <dd><a href="#">user@untitled.tld</a></dd>
                                    </dl>
                                </div>
                                <div class="col-6 col-12-small">
                                    <dl class="contact">
                                        <dt>Address</dt>
                                        <dd>
                                            1234 Fictional Rd<br />
                                            Nashville, TN 00000-0000<br />
                                            USA
                                        </dd>
                                        <dt>Phone</dt>
                                        <dd>(000) 000-0000</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
                <div class="col-12">
                    <div id="copyright">
                        <ul class="menu">
                            <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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

</body>
</html>