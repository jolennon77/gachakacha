
// 회원가입 폼 유효성 검사 함수
function validateSignupForm() {
    let email = $("#email").val().trim();
    let password = $("#password").val().trim();
    let password_check = $("#password_check").val().trim();
    let name = $("#name").val().trim();
    let phone_2 = $("#phone_2").val().trim();
    let phone_3 = $("#phone_3").val().trim();
    let address1 = $("#address1").val().trim();
    let address2 = $("#address2").val().trim();
    
    // 입력값이 빈 값인지 확인
    if (email === "" || password === "" || password_check === "" || name === "" || phone_2 === "" || phone_3 === "" || address1 === "" || address2 === "") {
        // 빈 값이면 알림 팝업 창 표시
        alert("모든 항목을 입력해주세요.");
        return false; // 빈 값이므로 유효성 검사 실패
    }
    return true; // 유효성 검사 성공
}
