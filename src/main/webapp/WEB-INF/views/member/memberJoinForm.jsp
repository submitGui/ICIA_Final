<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "../include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$("#joinForm").submit(
				function() {
					if ($("#password").val() !== $("#passwordRpt").val()) {
						alert("비밀번호가 다릅니다.");
						$("#password").val("").focus();
						$("#passwordRpt").val("");
						return false;
					} else if ($("#password").val().length < 4) {
						alert("비밀번호는 4자 이상으로 설정해야 합니다.");
						$("#password").val("").focus();
						return false;
					} else if ($.trim($("#password").val()) !== $("#password")
							.val()
							|| $.trim($("#email").val()) !== $("#email").val()
							|| $.trim($("#userid").val()) !== $("#userid")
									.val()) {
						alert("공백은 입력이 불가능합니다.");
						return false;
					}
				})

		$("#id_check").click(
				function() {
					$.ajax({
						url : "../member/check_id.do",
						type : "POST",
						data : {
							userid : $("#userid").val()
						},
						success : function(result) {
							if (result == 1) {
								alert("중복된 아이디가 있습니다.");
								/* 	$("#id_check").html("중복된 아이디가 있습니다."); */
								$("#joinBtn").attr("disabled", "disabled");
							} else {
								if ($("#userid").val().length == 0
										|| $("#userid").val() == " ") {
									alert("아이디를 입력해주세요");
								} else {
									alert("사용 가능합니다!!");
									/* 	$("#id_check").html(""); */
									$("#joinBtn").removeAttr("disabled");
								}
							}
						},

					})
				});

		$("#email").keyup(function() {
			$.ajax({
				url : "../member/check_email.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
					} else {
						$("#email_check").html("");
					}
				},
				error : function(xhr, option, error) {
					alert(xhr.status); //오류코드
					alert(error); //오류내용
				},
			})
		});

		$('#password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup
		$('#passwordRpt').keyup(function() {
			if ($('#password').val() != $('#passwordRpt').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호틀림");
			} else if($("#password").val().length < 4){
				$('font[name=check]').text('');
				$('font[name=check]').html("암호는4글자 이상이여야 합니다.");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호맞음");
			} 
	});
})
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open().self.close();
	}
</script>
<script type="text/javascript">
   function JoinSubmit()
   {
      
       var Main= document.forms.joinForm;
       opener.name = "joinForm";
       Main.target = opener.name;
       Main.submit();
       alert("이메일 인증후 사용해주세요");
       self.close();
   }
      
</script>
<title>회원가입 폼</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>Member Join Form</h3>
			</div>
			<div>
				<form id="joinForm" action="../member/join_member.do" method="post" >
					<p>
						<label>ID</label> <input class="w3-input" type="text" id="userid"
							name="userid" required>
						<!-- <span id="id_check"
							class="w3-text-red"></span> -->
						<button type="button" id="id_check" value="id_Check">아이디 중복 검사</button>
					</p>
					<p>
						<label>Password</label> <input class="w3-input" id="password"
							name="password" type="password" required>
					</p>
					<p>
						<label>Password Confirm</label> <input class="w3-input"
							id="passwordRpt" type="password" required> <font
							name="check" size="2" color="red"></font>
					</p>
					<p>
						<label>Name</label> <input class="w3-input" id="name" name="name"
							type="text" required>
					</p>

					<p>
						<label>Email</label> <input type="text" id="email" name="email"
							class="w3-input" required placeholder="이메일 인증 후 로그인이 가능합니다.">
						<span id="email_check" class="w3-text-red"></span>
					</p>
					<p>
						<label>Address</label><br /> <input type="text"
							id="sample6_postcode" name="address" class="w3-input" placeholder="우편번호">
						<input type="button" class="w3-input"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소"
							class="w3-input" name="address" required> 
						<input type="text" id="sample6_address2" placeholder="상세 주소"
							class="w3-input" name="address" required> 
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" onclick="JoinSubmit();"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Join</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>