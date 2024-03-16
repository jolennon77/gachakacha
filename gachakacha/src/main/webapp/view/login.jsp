<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css" />
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> --> 
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
        $(document).ready(
            function() {
                let signup = $(".links").find("li").find("#signup");
                let signin = $(".links").find("li").find("#signin");
                let reset = $(".links").find("li").find("#reset");
                let first_input = $("form").find(".first-input");
                let hidden_input = $("form").find(".input__block").find(
                        "#repeat__password");
                let signin_btn = $("form").find(".signin__btn");
                let form = $("form");

                //----------- 회원가입 ---------------------
                signup.on("click", function(e) {
                    e.preventDefault();
                    $(this).parent().parent().siblings("h1").text("회원가입");
                    $(this).parent().css("opacity", "1");
                    $(this).parent().siblings().css("opacity", ".6");
                    first_input.removeClass("first-input__block").addClass(
                            "signup-input__block");
                    hidden_input.css({
                        "opacity" : "1",
                        "display" : "block"
                    });
                    // Show additional inputs for 회원가입
                    $("#additionalInputs").show();
                    form.attr("action", "signup");
                    signin_btn.text("회원가입");
                    // 유효성 검사 함수 변경
                    signin_btn.attr("onclick", "return validateSignupForm()");
                });

                //----------- 로그인 ---------------------
                signin.on("click", function(e) {
                    e.preventDefault();
                    $(this).parent().parent().siblings("h1").text("로그인");
                    $(this).parent().css("opacity", "1");
                    $(this).parent().siblings().css("opacity", ".6");
                    first_input.addClass("first-input__block").removeClass(
                            "signup-input__block");
                    hidden_input.css({
                        "opacity" : "0",
                        "display" : "none"
                    });
                    // Hide additional inputs for 회원가입
                    $("#additionalInputs").hide();
                    form.attr("action", "login");
                    signin_btn.text("로그인");
                    // 유효성 검사 함수 변경
                    signin_btn.attr("onclick", "return validateLoginForm()");
                });

            });	
        
        $(document).ready(function() {
            // Populate year select in reverse order
            let currentYear = new Date().getFullYear();
            let htmlYear = '';
            for (let i = currentYear - 15; i >= currentYear - 70; i--) {
                htmlYear += '<option value="' + i + '">' + i + '</option>';
            }
            $('#year').html(htmlYear);

            // Populate month select
            let htmlMonth = '';
            for (let i = 1; i <= 12; i++) {
                htmlMonth += '<option value="' + i + '">' + i + '</option>';
            }
            $('#month').html(htmlMonth);

            // Populate day select based on the selected month and year
            $('#month, #year').change(function() {
                let selectedMonth = $('#month').val();
                let selectedYear = $('#year').val();
                let daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
                let htmlDay = '';
                for (let i = 1; i <= daysInMonth; i++) {
                    htmlDay += '<option value="' + i + '">' + i + '</option>';
                }
                $('#date').html(htmlDay); // 수정된 부분
            });
        });
        
        function openPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var zonecode = data.zonecode; // 사용자가 선택한 우편번호 변수에 저장
                    var address = data.address; // 사용자가 선택한 주소 변수에 저장
                    document.getElementById('zonecode').value = zonecode; // 주소 입력 필드에 선택한 우편번호 표시
                    document.getElementById('address').value = address; // 주소 입력 필드에 선택한 주소 표시
                }
            }).open();
        }
        
        // 회원가입 폼 유효성 검사
        function validateSignupForm() {
        	let email = $("#email").val();
            let password = $("#password").val();
            let password_check = $("#password_check").val();
            let name = $("#name").val();
            let phone_1 = $("#phone_1").val();
            let phone_2 = $("#phone_2").val();
            let phone_3 = $("#phone_3").val();
            let zonecode = $("#zonecode").val();
            let address = $("#address").val();
            let address_detail = $("#address_detail").val();
            let gender = $("input[name='gender']:checked").val();
            let year = $("#year").val();
            let month = $("#month").val();
            let date = $("#date").val();

            if (email === "" || password === "" || password_check === "" || name === "" ||
                    phone_1 === "" || phone_2 === "" || phone_3 === "" || zonecode === "" ||
                    address === "" || address_detail === "" || gender === undefined ||
                    year === "" || month === "" || date === "") {
                    alert("모든 항목을 입력해주세요.");
                    return false;
                }
            
            // 비밀번호 일치 확인
            if (password !== password_check) {
                alert("비밀번호가 일치하지 않습니다.");
                return false;
            }
            return true;
        }

        // 로그인 폼 유효성 검사
        function validateLoginForm() {
            let email = $("#email").val();
            let password = $("#password").val();
            // 이메일, 비밀번호 등 로그인 필드 유효성 검사를 수행합니다.
            // 필요한 경우 추가 유효성 검사를 수행할 수 있습니다.
            if (email === "") {
                alert("이메일을 입력해주세요.");
                return false;
            }
            if (password === "") {
                alert("비밀번호를 입력해주세요.");
                return false;
            }
            // 추가적인 유효성 검사를 수행할 수 있습니다.
            return true;
        }
    </script>

<script>
    $(document).ready(function() {
        // 로그인 실패 시 오류 메시지 표시
        var errorMessage = "<c:out value='${errorMessage}' />";
        if (errorMessage && errorMessage.trim() !== "") {
            $("#errorMessageContent").text(errorMessage);
            $("#errorMessage").dialog({
                modal: true,
                buttons: {
                    "확인": function() {
                        $(this).dialog("close");
                    }
                }
            });
        }
    });
</script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 주소 검색 api -->
</head>
<body>
      <div id="errorMessage" style="display: none; text-align: center; color: red;">
    <p id="errorMessageContent"></p>
</div>
    
	<div class="container">
		<div class="logindiv"
			style="background-color: #f8f2ed; border-radius: 30px; padding: 20px 0;">
			<!-- Heading -->
			<div style="text-align: center;">
				<img src="./img/finallogo.png" style="width: 400px;" />
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
					<input type="text" placeholder="이메일을 입력해주세요" class="input" id="email"
						name="email" />
				</div>
				<!-- password input -->
				<div class="input__block">
					<input type="password" placeholder="비밀번호를 입력해주세요" class="input"
						id="password" name="password" />
				</div>

				<!-- Additional inputs for 회원가입 -->
				
				<div id="additionalInputs" style="display: none;">
					<div class="input__block">
						<input type="password" placeholder="비밀번호 확인" class="input"
							id="password_check" name="password_check" />
					</div>
					
				
					<div class="input__block">
						<input type="text" placeholder="이름을 입력해주세요" class="input" id="name"
							name="name" />
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

 					<div class="select__block">
						<input type="text" placeholder="우편번호를" class="input"
							id="zonecode" name="zonecode"  value="" readonly/>
						<input type="text" placeholder="검색해주세요" class="input"
							id="address" name="address"  value="" readonly/>
							<!-- <div style="width: 50px;"></div> -->
						<button type="button" id="zonezodebtn" onclick="openPostcode()">우편번호</button>
					</div>
					
					<!-- <div class="input__block">
					</div> -->
						<div class="input__block">
						<input type="text" placeholder="상세주소를 입력하세요" class="input"
							id="address_detail" name="address_detail" value="" />
					</div>
					

					<!-- gender input -->
					<div class="radio__block">
						<label>성별</label>
						<input type="radio" name="gender" value="M"> 남
						<input type="radio" name="gender" value="F"> 여 
					</div>
					<!-- birthday input -->
					<div class="select__block">
						생일&nbsp; <select id="year" name="year"></select>&nbsp;년 &nbsp;
						<select id="month" name="month"></select>&nbsp;월 &nbsp; <select
							id="date" name="date"></select>&nbsp;일

					</div>
				</div>
				<!-- 로그인 button -->
				<button class="signin__btn" onclick="return validateLoginForm()">로그인</button>
			</form>
			<!-- separator -->
			<div class="separator">
				<p>OR</p>
			</div>
			<!-- google button -->
			<button class="google__btn">
				<i class="fa fa-google"></i> 로그인 with Google
			</button>
			<!-- google button -->
			<button class="github__btn">
				<i class="fa fa-github"></i> 로그인 with GitHub
			</button>
		</div>
	</div>
	
	

</body>
</html>
