<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
		<section class="contents d-flex justify-content-center">
			<div class="join-box my-5">
				<h2 class="text-center">회원가입</h2>
				<input type="text" id="inputLoginId" placeholder="아이디" class="form-control mt-2">
				<input type="password" id="inputPassword" placeholder="비밀번호" class="form-control mt-2">
				<input type="password" id="inputConfirmPassword" placeholder="비밀번호 확인" class="form-control mt-2">
				<input type="text" id="inputName" placeholder="이름" class="form-control mt-2">
				<input type="text" id="inputEmail" placeholder="이메일" class="form-control mt-2">
				<button type="button" id="joinBtn" class="btn btn-primary btn-block mt-2">가입</button>				
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	
	
	<script>
		$(document).ready(function(){
			$("#joinBtn").on("click", function(){
				let loginId = $("#inputLoginId").val();
				let password = $("#inputPassword").val();
				let confirmPassword = $("#inputConfirmPassword").val();
				let name = $("#inputName").val();
				let email = $("#inputEmail").val();
				
				if(loginId == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				if(confirmPassword == ""){
					alert("비밀번호 확인해주세요");
					return;
				}
				
				if(name == ""){
					alert("이름을 입력해주세요");
					return;
				}
				
				if(email == ""){
					alert("이메일을 입력해주세요");
					return;
				}
				
				if(password != confirmPassword){
					alert("비밀번호가 맞지않습니다.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId" :loginId, "password":password, "name":name, "email":email}
					, success:function(data){
							if(data.result == "success"){
									location.href = "/user/signin/view";
							}else{
								alert("회원가입 실패");
							}
					}
					, error:function(){
						alert("회원가입 에러");
					}
				})
			})
		})
		
	</script>
</body>
</html>