<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<%@ include file = "../include/header.jsp" %>
<script>
$(function(){
	
	if(${msg ne null}){
		alert('${msg}');
		self.close();
	};
	
	if($("#pwForm").submit(function(){
		if($("#password").val() !== $("#pw2").val()){
			alert("비밀번호가 다릅니다.");
			$("#password").val("").focus();
			$("#pw2").val("");
			return false;
		}else if ($("#password").val().length < 4) {
			alert("비밀번호는 4자 이상으로 설정해야 합니다.");
			$("#password").val("").focus();
			return false;
		}else if($.trim($("#password").val()) !== $("#password").val()){
			alert("공백은 입력이 불가능합니다.");
			return false;
		}
	}));

		$('#password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup
		$('#pw2').keyup(function() {
			if ($('#password').val() != $('#pw2').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");
			} else if ($("#old_pw").val().length < 4) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호는4글자 이상이여야 합니다.");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			}
		});
		if($('#wdForm').submit(function(){
			if(!confirm("정말 탈퇴할까요?")){
				return false;
			}
		}));
	})
</script>
<script type="text/javascript">

   function DeleteSubmit()
   {
      
       var Main= document.forms.wdForm;
       opener.name = "wdForm";
       Main.target = opener.name;
       Main.submit();
       self.close();
   }
      
</script>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="myForm" action="../member/update_mypage.do" method="post">
					<p>
						<label>ID</label> <input class="w3-input" type="text" id="userid"
							name="userid" readonly value="${member.userid}">
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="email" value="${member.email}" required>
					</p>
					<p class="w3-center">
						<button type="submit" onclick="MypageSubmit()"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
							변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="../member/update_pw.do" method="post">
					<input type="hidden" name="userid" value="${member.userid}">
					<p>
						<label>Password</label> <input class="w3-input" id="old_pw"
							name="old_pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> <input class="w3-input" id="password"
							name="password" type="password" required>
					</p>
					<p>
						<label>Confirm</label> <input class="w3-input" type="password"
							id="pw2" name="pw2" required> <font name="check" size="2"
							color="red"></font>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" onclick="MypagePWSubmit();"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호
							변경</button>
					</p>
				</form>
				<form id="wdForm" action="../member/withdrawal.do" method="post">
					<input type="hidden" name="userid" readonly
						value="${member.userid}">
					<p>
						<label>Password</label> <input class="w3-input" type="password"
							name="password">
					</p>
					<p class="w3-center">
						<button type="submit" id="withdrawalBtn" onclick="DeleteSubmit();"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">
							회원탈퇴</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>