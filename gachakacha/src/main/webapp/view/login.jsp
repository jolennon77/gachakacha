<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>

<link rel="stylesheet" type="text/css" href="./css/login.css" />
<script src="./js/loginValidate.js"></script>
<script>
if (${not empty errorMessage}) {
    // errorMessage의 내용을 알림으로 표시
    alert("${errorMessage}");
}

function showWelcomeMessage(userName) {
    alert(userName + "님, 환영합니다!");
}
</script>
</head>
<body>

    <div class="container">
        <div class="logindiv">
            <!-- Heading -->
            <div class="loginimg" >
    <div>
        <img src="./img/finallogo.png" />
    </div>
</div>
            <h1>로그인</h1>

            <!-- Links -->
            <ul class="links">
                <li><a href="#" id="signin">로그인</a></li>
                <li><a href="#" id="signup">회원가입</a></li>
                <li><a href="main.do" id="reset">이전페이지</a></li>
            </ul>

            <!-- Form -->
            <form action="login" method="post">
                <!-- email input -->
                <div class="first-input input__block first-input__block">
                    <input type="text" placeholder="이메일을 입력해주세요" class="input" id="email" name="email" /> 
                    <span id="emailMessage" class="error-message"></span>
                    <!-- 중복 확인 결과를 표시할 곳 -->
                </div>
                <!-- password input -->
              <div class="input__block">
					<input type="password" placeholder="비밀번호를 입력해주세요" class="input"
						id="password" name="password" /> <span id="passwordMessage"
						class="error-message"></span>
				</div>
				<!-- Additional inputs for 회원가입 -->
				<div id="additionalInputs" style="display: none;">
					<div class="input__block">
						<input type="password" placeholder="비밀번호 확인" class="input"
							id="password_check" name="password_check" /> <span
							id="passwordCheckMessage" class="error-message"></span>
					</div>
					<div class="input__block">
						<input type="text" placeholder="이름을 입력해주세요" class="input"
							id="name" name="name" />
					</div>
					<!-- phone number input -->
					<div class="select__block">
						<label for="phone">전화번호</label><br>&nbsp;&nbsp; <select
							class="input phone" id="phone_1" name="phone_1">
							<option value="010">010</option>
							<option value="011">011</option>
							<!-- 다른 국가 코드 또는 지역 코드를 추가할 수 있습니다 -->
						</select> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="tel" class="input phone"
							id="phone_2" name="phone_2" maxlength="4">
						&nbsp;&nbsp;-&nbsp;&nbsp; <input type="tel" class="input phone"
							id="phone_3" name="phone_3" maxlength="4">
					</div>

					<div class="address__block">
						<input type="text" placeholder="우편번호를 검색해주세요" class="input" id="address1"
							name="address1" value="" readonly /> 
						<button type="button" id="zonezodebtn" onclick="openPostcode()">우편번호</button>
					</div>

					<!-- <div class="input__block">-->
					<div class="input__block">
						<input type="text" placeholder="상세주소를 입력하세요" class="input"
							id="address2" name="address2" value="" />
					</div>


					<!-- gender input -->
					<div class="radio__block">
						<label>성별</label> <input type="radio" name="gender" value="M">
						남 <input type="radio" name="gender" value="F"> 여
					</div>
					<!-- birthday input -->
					<div class="select__block">
						생일&nbsp; <select id="year" name="year"></select>&nbsp;년 &nbsp; <select
							id="month" name="month"></select>&nbsp;월 &nbsp; <select id="date"
							name="date"></select>&nbsp;일
					</div>
				</div>
				<!-- 로그인 button -->
				<button class="signin__btn" id="signin-btn">로그인</button>
			</form>

		</div>
	</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./js/login.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/loginDaumAddress.js"></script>

</html>