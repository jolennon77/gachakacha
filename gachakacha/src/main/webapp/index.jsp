<%@page import="dto.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인덱스</title>

<link rel="stylesheet" type="text/css" href="./css/header.css" />

<style>
/* 기본 스타일 */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	padding: 0;
	margin: 0; /* body와 구역 사이 간격 제거 */
}

/* 세로 3구역 레이아웃 스타일 */
.container {
	display: flex;
	flex-direction: column;
	max-width: 1200px;
	margin: 0 auto;
}

.header, .footer {
	background-color: #333;
	color: #fff;
	padding: 15px 0;
}

.content {
	background-color: #fff;
	padding: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	flex-grow: 1; /* 중간 구역을 확장 */
}

.mySlides {
	display: none;
}

body {
	margin: 0px;
	padding: 0px;
}

.header {
	background-color: #f4eae2;
}

.subMenu {
	border-bottom: 1px solid #e5e5e5;
	height: 38px;
	align-items: center;
}

.subMenuUi {
	list-style: none;
	margin: 0px;
	padding: 0px;
	float: right;
	height: 38px;
	padding-top: 5px;
}

.subMenuUi li {
	display: inline;
	margin: 0px;
	padding: 10px 30px;
	border-left: 1px solid #e5e5e5;
}

.subMenuUi li a {
	text-decoration: none;
	font-size: 12px;
	color: #8d8d8d;
}

.subMenuUi li a:hover {
	color: black;
}

.logo a img {
	width: 100%;
	height: 100%;
}

.menu {
	height: 100px;
	border-bottom: 1px solid #e5e5e5;
	width: 100%;
	margin: 0 auto;
	padding: 0 32px 0 30px;
	position: relative;
	display: flex;
	align-items: center;
	justify-items: center;
	background-color: #f8f2ed;
}

.logo {
	display: flex;
	width: 194px;
	height: 70px;
	padding: 15px 0;
	text-align: left;
	box-sizing: border-box;
	vertical-align: middle;
	font-size: 28.05px;
	align-items: center;
	float: left;
}

.mainMenu {
	width: 100%;
}

.mainMenuUi {
	padding: 0px;
	margin-top: 15px;
	text-align: center;
	vertical-align: middle;
}

.mainMenuUi li {
	display: inline;
	margin: 0px auto;
	padding: 10px 30px;
}

.mainMenuUi li a {
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: black;
	padding-bottom: 25px;
}

.mainMenuUi li a:hover {
	border-bottom: 1.5px solid black;
}

.searchBar {
	width: 30%;
	border: 1px solid #e5e5e5;
	outline: none;
}

.searchDiv {
	width: 100%;
	text-align: right;
}

.searchDiv input {
	width: 30%;
	height: 32px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

.buttons {
	margin: 10%;
	text-align: center;
}

.search-button {
	width: 80px;
	font-size: 12px;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
	margin-left: 0px;
	height: 33px;
	text-align: center;
	border: none;
	background-size: 300% 100%;
	border-radius: 50px;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
	background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a, #FBB03B);
	box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
}

.search-button:hover {
	background-position: 100% 0;
	moz-transition: all .4s ease-in-out;
	-o-transition: all .4s ease-in-out;
	-webkit-transition: all .4s ease-in-out;
	transition: all .4s ease-in-out;
}

.search-button:focus {
	outline: none;
}

.content {
	text-align: center;
}
</style>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}
</style>
</head>
<body>

	<!-- 전체영역 -->
	<div class="container">


		<!-- 헤더영역 -->
		<div class="header">


			<div class="subMenu">
				<ul class="subMenuUi">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li><a href="index.jsp">메인페이지</a></li>
							<li><a href="infoBord.do">공지사항</a></li>
							<li><a href="loginView.do">로그인/회원가입</a></li>
						</c:when>
						<c:otherwise>
							<%-- 로그인된 사용자가 관리자인지 여부 확인 --%>
							<c:choose>
								<c:when test="${sessionScope.user.aut == 'admin'}">
									<li><a href="index.jsp">메인페이지</a></li>
									<li><a href="infoBord.do">공지사항</a></li>
									<li><a href="adminPage.do">관리자 페이지</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="index.jsp">메인페이지</a></li>
									<li><a href="infoBord.do">공지사항</a></li>
									<li><a href="#">마이 페이지</a></li>
									<li><a href="logout.do">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="menu">
				<span class="logo"> <a href="#"> <img
						src="./img/finallogo.png" /></a></span>
				<div class="searchDiv">
					<div class="serchDiv2">
						<form action="" method="post">
							<input type="text" class="search-input"
								placeholder="검색어를 입력하세요...">
							<button type="submit" class="search-button">검색</button>
						</form>
					</div>

				</div>
			</div>
			<div class="mainMenu">
				<ul class="mainMenuUi">
					<li><a href="#">발매 예정</a></li>
					<li><a href="#">신상품</a></li>
					<li><a href="#">가챠</a></li>
					<li><a href="#">쿠지</a></li>
				</ul>
			</div>
		</div>
		<!-- 헤더영역끝 -->

		<!-- 콘텐츠영역 -->
		<div class="content">
			<h2>상품 슬라이드쇼</h2>
			<div class="slideshow-container">

				<div class="mySlides fade">
					<div class="numbertext">1 / 3</div>
					<div style="display: flex; justify-content: flex-start; ">
					<img
						src="https://gw.alicdn.com/imgextra/i4/2200742982579/O1CN01Jjt5Lg1UvELw9Yoj0_!!0-item_pic.jpg_Q75.jpg_.webp"
						style="width: 50%">
						<img
							src="https://gw.alicdn.com/imgextra/i3/2200742982579/O1CN010xlb5Z1UvELtvHIv2_!!0-item_pic.jpg_Q75.jpg_.webp"
							style="width: 50%">
					<!-- <div class="text">Caption Text</div> -->
				</div>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">2 / 3</div>
					<div style="display: flex; justify-content: flex-start; ">
					<img
						src="https://gw.alicdn.com/imgextra/i3/2200742982579/O1CN01HdjZHR1UvENW4JZfK_!!0-item_pic.jpg_Q75.jpg_.webp"
						style="width: 50%">
					<img
						src="https://gw.alicdn.com/imgextra/i4/2200742982579/O1CN01ELBgh41UvEJ0Vz7bT_!!0-item_pic.jpg_Q75.jpg_.webp"
						style="width: 50%">
				</div>
					<!-- <div class="text">Caption Two</div> -->
				</div>

				<div class="mySlides fade">
					<div class="numbertext">3 / 3</div>
					<div style="display: flex; justify-content: flex-start; ">	
					<img
						src="https://gw.alicdn.com/imgextra/i1/2200742982579/O1CN016Z3R5Q1UvEMFBJFGP_!!0-item_pic.jpg_Q75.jpg_.webp"
						style="width: 50%">
					<img
						src="https://gw.alicdn.com/bao/uploaded/i1/2200742982579/O1CN01OP4YKj1UvEK80iCMi_!!0-item_pic.jpg"
						style="width: 50%">
					</div>	
					<!-- <div class="text">Caption Three</div> -->
				</div>
				<br>

				<div style="text-align: center">
					<span class="dot"></span> <span class="dot"></span> <span
						class="dot"></span>
				</div>

			</div>
			<div>
				<h2>상품판매 목록</h2>
				<%@ include file="./view/mainProductGrid.jsp"%>
			</div>
		</div>
		<!-- 콘텐츠영역 -->

		<!-- 풋터영역 -->
		<div class="footer">
			<h2>푸터</h2>
			<p>이 곳에 푸터 내용을 넣으세요.</p>
		</div>
		<!-- 풋터영역끝 -->
	</div>

	<!-- 전체영역 끝-->
</body>

<script>
	let slideIndex = 0;
	showSlides();

	function showSlides() {
		let i;
		let slides = document.getElementsByClassName("mySlides");
		let dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 2000); // Change image every 2 seconds
	}
</script>


</html>
