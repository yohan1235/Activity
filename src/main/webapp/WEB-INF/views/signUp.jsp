<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<title>Bootstrap Sign up Form with Icons</title>
<style type="text/css">
	body {
		background: #19aa8d;
		font-family: 'Roboto', sans-serif;
	}
	.form-control, .form-control:focus, .input-group-addon {
		border-color: #e1e1e1;
	}
    .form-control, .btn {        
        border-radius: 3px;
    }
	.signup-form {
		width: 390px;
		margin: 0 auto;
		padding: 30px 0;
	}
    .signup-form form {
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .signup-form hr {
        margin: 0 -30px 20px;
    }
	.signup-form .form-group {
		margin-bottom: 20px;
	}
	.signup-form label {
		font-weight: normal;
		font-size: 13px;
	}
	.signup-form .form-control {
		min-height: 38px;
		box-shadow: none !important;
	}	
	.signup-form .input-group-addon {
		max-width: 42px;
		text-align: center;
	}
	.signup-form input[type="checkbox"] {
		margin-top: 2px;
	}   
    .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;
		background: #19aa8d;
		border: none;
		min-width: 140px;
    }
	.signup-form .btn:hover, .signup-form .btn:focus {
		background: #179b81;
        outline: none;
	}
	.signup-form a {
		color: #fff;	
		text-decoration: underline;
	}
	.signup-form a:hover {
		text-decoration: none;
	}
	.signup-form form a {
		color: #19aa8d;
		text-decoration: none;
	}	
	.signup-form form a:hover {
		text-decoration: underline;
	}
	.signup-form .fa {
		font-size: 21px;
	}
	.signup-form .fa-paper-plane {
		font-size: 18px;
	}
	.signup-form .fa-check {
		left: 17px;
		top: 18px;
		font-size: 7px;
		position: absolute;
	}
	.addrBtn {
	    font-size: 16px;
        font-weight: bold;
		background: #19aa8d;
		border: none;
		min-width: 140px;
	}	
</style>
<script type="text/javascript">
	function addrPopUp(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("addrPopUp.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");		
	}
	function addrCallBack(roadFullAddr) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.signUp.addr.value = roadFullAddr;
	}
	
	// 중복체크 체크
	function flagCheck(){
		var form = document.signUp;
		if(form.emailCheckFlag.value != "unCheck"){
			alert("이메일 중복체크 해주세요");
			return false;
		}else if(form.pwd.value != form.confirm_pwd.value){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}else{
			alert("환영합니다! 새로운 아이디로 로그인해주세요!");
			return true;
		}
	}	

	// email 중복체크
	function emailDuplication(){
		alert("ㅎㅇ")
		var email = $('#email').val();
		alert(email)
		$('#emailCheckFlag').val('unCheck');

		if(email == ""){
			alert("이메일을 입력해주세요")
			return;
		}
		
		$.ajax({
			type: 'post',
			url: 'emailCheck.do',
			data:{email : email},
			dataType: 'json',
			success:function(result){
		        if(result == 1){
					alert("사용할 수 없는 이메일입니다");
				}else{
					alert("사용할 수 있는 이메일입니다");
					$('#emailCheckFlag').val('Check');	
				}
			}
		})
	}

</script>
</head>
<body>

<div class="signup-form">
    <form name="signUp" action="insertMember.do" method="post" onsubmit="return flagCheck()"> <!-- onsubmit form 전송전에 입력된 데이터의 유효성을 체크하기 위해 사용하는 이벤트 return false 이면 진행안함 -->
		<h2>Sign Up</h2>
		<p>Please fill in this form to create an account!</p>
		<hr>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
				<input type="email" class="form-control" id="email" name="email" placeholder="Email Address" required="required">
			</div>
			<div align="Right"><input type="button" class="addrBtn btn-primary " name="emailCheck" value="check" onclick="emailDuplication()">
				<input type="hidden" id="emailCheckFlag" value="unCheck">
			</div>
        </div>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
				<input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password" required="required">
			</div>
        </div>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-lock"></i>
				</span>
				<input type="password" class="form-control" name="confirm_pwd" id="confirm_pwd" placeholder="Confirm Password" required="required">
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user"></i></span>
				<input type="text" class="form-control" name="nick" placeholder="UserName" required="required">
			</div>
        </div>
        <div class="form-group">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-phone"></i></span>
				<input type="text" class="form-control" name="phone" placeholder="phone(000-1234-5678)" required="required">
			</div>
        </div>                            
        <div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
        </div>
    </form>
	<div class="text-center" data-toggle="modal" data-target="#myModal">Already have an account? <a href="#">Login here</a></div>
</div>
</body>
</html>