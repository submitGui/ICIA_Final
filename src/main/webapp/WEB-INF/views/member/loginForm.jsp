<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- views/member/login.jsp -->
<!DOCTYPE html>
<html>
<head>

<title>login Form</title>
<%@ include file = "../include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- 로그인 버튼 클릭시 처리 -->
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var userid = $("#userid").val(); //태그의 value 속성값
			var passwd = $("#password").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus(); //입력 포커스 이동
				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			//폼 데이터를 서버로 제출
			document.form1.action = "${path}/member/login.do";
			document.form1.submit();
			self.close();
		});
	});
</script>

<!-- 아이디/비밀번호 찾기 관련 ajax -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 입력 폼 미입력시 처리 및 제출  -->
<script>
/* 아이디 찾기 버튼 클릭시  */
	$(function() {
		$("#find_id_btn").click(function() {
			location.href = '../member/find_id_form.do';
		})
	});
</script>
<!-- 비밀번호 찾기 ajax -->
<script>
	$(function() {
		$("#find_pw_btn").click(function() {
			location.href = '../member/find_pw_form.do';
		})
	});
</script>
<script>
	$(function() {
		$("#member").click(function() {
			location.href = '../member/memberJoinForm.do';
		})
	});
</script>
<script>
	$(function() {
		$("#business").click(function() {
			location.href = '../member/businessJoinForm.do';
		})
	});
</script>
<script type="text/javascript">

   function LoginSubmit()
   {
      
       var Main= document.forms.login;
       opener.name = "login";
       Main.target = opener.name;
       Main.submit();
       self.close();
   }
      
</script>
</head>

<body>
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
			
			<!-- top 메뉴바 import -->
				<h2>로그인</h2>
				<form action="../member/login.do" method="post" id="login">
					<p>
						<label>ID</label> <span class="w3-right w3-button w3-hover-white"
							title="아이디 찾기" id="find_id_btn"> <i
							class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
						</span> 
						<input class="w3-input" id="userid" name="userid" type="text" required>
					</p>
					<p>
						<label>Password</label> <span
							class="w3-right w3-button w3-hover-white" title="비밀번호 찾기"
							id="find_pw_btn"> <i
							class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
						</span> <input class="w3-input" id="password" name="password" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" onclick="LoginSubmit();">Login</button>
					<p class="w3-center">
						<button type="button" id="member"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join Member</button>
					<p class="w3-center">
						<button type="button" id="business"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join Business</button>
						<button type="button"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round"
							onclick="javascript:window.close()">Cancel</button>
					</p>
					
			<c:if test="${param.message == 'nologin' }">
				<div style="color:red;">
					로그인 하신 후 사용가능합니다.
				</div>				
			</c:if>
			<c:if test="${message == 'error' }">
				<div style="color:red;">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${message == 'logout' }">
				<div style="color:blue;">
					로그아웃 처리되었습니다. 안녕히 가세요.
				</div>
			</c:if>
				</form>
			</div>
		</div>
</body>
</html>