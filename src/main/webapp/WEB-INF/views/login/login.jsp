<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page import="java.util.ArrayList" %>
<%
	String SS_USER_EMAIL = CmmUtil.nvl((String)session.getAttribute("SS_USER_EMAIL"));
	String SS_USER_NAME = CmmUtil.nvl((String)session.getAttribute("SS_USER_NAME"));
	String SS_USER_ID = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));
	String user_seq = CmmUtil.nvl((String)session.getAttribute("SS_USER_SEQ"));

	List<NoticeDTO> rList = (List<NoticeDTO>) request.getAttribute("rList");

	//게시판 조회 결과 보여주기
	if (rList == null) {
		rList = new ArrayList<NoticeDTO>();

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Aerial by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/css/main2.css" />
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

</style>

</head>
<body class="is-preload">
<div id="wrapper">
	<div id="bg"></div>
	<div id="overlay"></div>
	<div id="main">

		<!-- Header -->
		<header id="header">
			<h1>Weather telling</h1>
			<p>반갑습니다. &nbsp;&bull;&nbsp; 날씨 알림 서비스 &nbsp;&bull;&nbsp; 차박 여형지 확인 서비스</p>
			<div class="row w-100 m-0">
				<div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
					<div class="card col-lg-4 mx-auto">
						<div class="card-body px-5 py-5">
							<br>
							<form>
								<div class="form-group">
									<label>Email & ID</label>
									<input type="text" class="form-control p_input" id="user_email" name="user_email" style="background-color: #0a0a0a">
								<%--TODO user_id도  id값을 받아서 email or id가 둘중 하나가 되었을때 로그인 --%>
								</div>
								<div class="form-group">
									<label>Pass word</label>
									<input type="password" class="form-control p_input" id="password" name="password" style="background-color: #0a0a0a">
								</div>
								<div class="form-group d-flex align-items-center justify-content-between">
									<a href="/forget_id" class="forgot-pass">Forgot Email</a><br>
									<a href="/forget_passwd" class="forgot-pass">Forgot password</a>
								</div>
								<div class="text-center">
									<button type="button" class="form-control" onclick="moveUrl()">Login
										<i class="zmdi zmdi-arrow-right">
										</i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
			</div>
			<nav>
				<ul>
					<li><a href="#" class="icon brands fa-facebook-f"><span class="label">페이스북</span></a></li>
					<li><a href="#" class="icon brands fa-discourse"><span class="label">카카오</span></a></li>
					<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon solid fa-envelope"><span class="label">로그인</span></a></li>
				</ul>
			</nav>

		</header>

		<!-- Footer -->
		<footer id="footer">
			<span class="copyright">회원가입 <a href="/register"> Sign UP</a>.</span>
		</footer>

	</div>
</div>
<script>
	window.onload = function() { document.body.classList.remove('is-preload'); }
	window.ontouchmove = function() { return false; }
	window.onorientationchange = function() { document.body.scrollTop = 0; }
</script>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/js/jquery.min.js"></script>
<script>
	function doSwal(title, content, type = "info") {
		swal(title, content, type, {
			timer : 4000,
			button : "확인"
		});
	}
</script>
<script>
	function moveUrl() {

		let user_email = document.getElementById("user_email").value;
		let password = document.getElementById("password").value;
		console.log("user_email : " + user_email);
		console.log("passswod : " + password);

		let param = {"user_email" : user_email,"password" : password};
		/*유효성 검사*/
		if (user_email===""){
			alert("이메일을 입력하세요");
			document.getElementsByName("user_email")[0].focus();
			return false;
		}
		if (password===""){
			alert("비빌번호를 입력하세요");
			document.getElementsByName("password")[0].focus();
			return false;
		}

		$.ajax({
			type: "GET", // get방식
			url: "/getUserLoginCheck", //
			data: param, // area 데이터 값
			contentType: "application/json; charset=utf-8", // json 인코딩
			dataType: "text", //json타입
			success:function (result){
				console.log(result);
				if(result==="success") {
					swal({
						title : "로그인 성공!!",
						text : "확인 버튼을 눌러주세요.",
						icon : "success"
					}).then(function() {
						window.location.href = '/index';
					});
				} else {
					swal({
						title : "로그인 실패 실패 !!",
						text : "확인 버튼을 눌러주세요.",
						icon : "error"
					});
				}
			},
			error: (log) => {
				console.log("위에꺼 안먹었음");
				alert("실패" + log);
			}
		});
	}
</script>

</html>