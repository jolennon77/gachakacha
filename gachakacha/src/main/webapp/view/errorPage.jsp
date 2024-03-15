<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
<script>
    // 10초 후에 이전 페이지로 이동하는 함수
    function goBack() {
        window.history.back();
    }

    // 10초 카운트 다운을 표시하는 함수
    function countdown() {
        var count = 10; // 10초로 설정
        var timer = setInterval(function() {
            count--;
            document.getElementById("countdown").innerText = count + "초 뒤에 이전 페이지로 이동합니다.";
            if (count === 0) {
                clearInterval(timer);
                goBack(); // 10초가 지나면 이전 페이지로 이동
            }
        }, 1000); // 1초마다 카운트 감소
    }

    // 페이지 로드 후 countdown 함수 호출
    window.onload = function() {
        countdown();
    };
</script>
</head>
<body>
<div>
    <h1 style="color: red;">잘못된 접근입니다.</h1>
    <div id="countdown"></div> <!-- 카운트 다운을 표시할 곳 -->
    <div>
        <img src="https://i.namu.wiki/i/WkPZlLjf0g5i_o4r5j08iC9l29cT-RDp6jc1oQsheTjeVW_hJ31K2Qt_JV6PzSqR0DhsCWkWm8IxM7e-HNKBdQ.webp">
    </div>
</div>
</body>
</html>
