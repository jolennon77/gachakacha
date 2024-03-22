
$(document).ready(function() {
	let signup = $(".links").find("li").find("#signup");
	let signin = $(".links").find("li").find("#signin");
	//let reset = $(".links").find("li").find("#reset");
	let first_input = $("form").find(".first-input");
	let hidden_input = $("form").find(".input__block").find("#repeat__password");
	let signin_btn = $("form").find(".signin__btn");
	let form = $("form");

	//----------- 회원가입 ---------------------
	signup.on("click", function(e) {
		e.preventDefault();
		$(this).parent().parent().siblings("h1").text("회원가입");
		$(this).parent().css("opacity", "1");
		$(this).parent().siblings().css("opacity", ".6");
		first_input.removeClass("first-input__block").addClass("signup-input__block");
		hidden_input.css({
			"opacity": "1",
			"display": "block"
		});
		// Show additional inputs for 회원가입
		$("#additionalInputs").show();

		form.attr("action", "signup");
		signin_btn.off("click").on("click", function() {
			return validateSignupForm();
		});
	});

	//----------- 로그인 ---------------------
	signin.on("click", function(e) {
		e.preventDefault();
		$(this).parent().parent().siblings("h1").text("로그인");
		$(this).parent().css("opacity", "1");
		$(this).parent().siblings().css("opacity", ".6");
		first_input.addClass("first-input__block").removeClass("signup-input__block");
		hidden_input.css({
			"opacity": "0",
			"display": "none"
		});
		// Hide additional inputs for 회원가입
		$("#additionalInputs").hide();
		form.attr("action", "login");
		signin_btn.off("click").on("click", function() {
			return validateLoginForm();
		});
	});


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

	// 사용자가 이메일 입력란을 벗어날 때마다 이메일 중복 확인
	$("#email").blur(function() {
		// 회원가입 폼인지 확인
		let isSignupForm = $("#signup").parent().css("opacity") == "1";

		// 회원가입 폼인 경우에만 중복 검사를 수행하도록 처리
		if (isSignupForm) {
			// 이메일 입력란의 값 가져오기
			let email = $(this).val();

			// 입력한 이메일이 비어있지 않은 경우에만 유효성 검사 수행
			if (email.trim() !== "") {
				// 이메일 형식을 검사하는 정규식
				let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

				// 입력한 이메일이 유효한지 검사
				if (!emailPattern.test(email)) {
					// 이메일이 유효하지 않은 경우 메시지 표시
					$("#emailMessage").text("올바른 이메일 형식이 아닙니다.");
					// 회원가입 버튼 비활성화
					$(".signin__btn").prop("disabled", true).css("background-color", "#ccc").css("box-shadow", "0 15px 30px rgba(0, 0, 0, 0.36)");
					return; // 유효성 검사 실패 시 함수 종료
				}
			}
			// 입력한 이메일이 비어있지 않은 경우에만 중복 확인
			if (email.trim() !== "") {
				// 서버에 AJAX 요청을 보내서 이메일 중복 확인
				$.ajax({
					type: "POST",
					url: "checkEmail",
					data: {
						User_Email: email
					},
					success: function(response) {
						// 중복 여부에 따라 메시지를 표시
						if (response === "true") {
							$("#emailMessage").text("사용 중인 이메일입니다.");
							// 이메일이 사용 중인 경우 회원가입 버튼 비활성화
							$(".signin__btn").prop("disabled", true).css("background-color", "#ccc").css("box-shadow", "0 15px 30px rgba(0, 0, 0, 0.36)");
						} else {
							$("#emailMessage").text("");
							// 이메일이 사용 가능한 경우 회원가입 버튼 활성화
							checkEnableButton();
						}
					}
				});
			}
		}
	});

	// 사용자가 비밀번호 입력란을 벗어날 때마다 비밀번호 확인
	$("#password, #password_check").blur(function() {
		// 회원가입 폼인지 확인
		let isSignupForm = $("#signup").parent().css("opacity") == "1";

		// 회원가입 폼인 경우에만 비밀번호 확인을 수행하도록 처리
		if (isSignupForm) {
			let password = $("#password").val();
			let password_check = $("#password_check").val();

			// 비밀번호와 비밀번호 확인이 일치하는지 확인
			let isPasswordMatch = password === password_check;
			$("#passwordCheckMessage").text(isPasswordMatch ? "" : "비밀번호가 일치하지 않습니다.");

			// 비밀번호가 정규식에 맞는지 확인
			let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,20}$/;
			let isPasswordValid = regex.test(password);
			$("#passwordMessage").text(isPasswordValid ? "" : "비밀번호는 영문 대소문자, 숫자, 특수문자를 포함하여 8~20자리로 입력해주세요.");

			// 모든 조건을 만족하는 경우 회원가입 버튼 활성화
			if (isPasswordMatch && isPasswordValid) {
				checkEnableButton();
			} else {
				$(".signin__btn").prop("disabled", true).css("background-color", "#ccc").css("box-shadow", "0 15px 30px rgba(0, 0, 0, 0.36)");
			}
		}
	});

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

		if (email === "" || password === "" || password_check === "" ||
			name === "" || phone_1 === "" || phone_2 === "" ||
			phone_3 === "" || zonecode === "" || address === "" ||
			address_detail === "" || gender === undefined || year === "" ||
			month === "" || date === "") {
			alert("모든 항목을 입력해주세요.");
			return false;
		}
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



	// 이전 폼으로 이동할 때 입력값 초기화
	$(".links li").on("click", function() {
		// 입력값 초기화
		$("form")[0].reset();
		$("#emailMessage").text("");
		$("#passwordCheckMessage").text("");
		$("#passwordMessage").text("");

		// 폼이 바뀌면 버튼 활성화
		checkEnableButton();
	});
});

// 회원가입 버튼 활성화 함수
function checkEnableButton() {
	$(".signin__btn").prop("disabled", false).css("background-color", "#e91e63").css("box-shadow", "0 15px 30px rgba(233, 30, 99, 0.36)");
}
