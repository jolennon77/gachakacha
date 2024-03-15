<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<!-- CSS 파일 링크 -->

<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css" />
<link href="./css/admin/reset.css" rel="stylesheet" />
<link href="./css/admin/layout.css" rel="stylesheet" />
<link href="./css/admin/product.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style>
/* 추가할 CSS 스타일이 있다면 여기에 추가. */
</style>

</head>
<body>

	<section class="container">
		<div class="layout">
			<%@ include file="sidebar.jsp"%>
			<article>
				<%@ include file="title.jsp"%>

				<div class="content">
					<section class="subtitle">
						<div class=subtitlebox>
							<h1>회원 상세정보</h1>
						</div>
						<!-- start of 부모 제품 등록 폼 -->

						<form action="updateUser.admin?uId=${user.getId()}"
							method="post">
							<div class="main_product">
								<table class="main_productTable" border="1">
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tbody>
										<!-- 제품 등록 폼 -->

										<tr>
											<th>E-mail (ID)</th>
											<!-- 제품 종류 선택 라디오 버튼 -->
											<td data-td="product_td"><input type="text"
												name="u_Email" id="u_Email" 
												value="${user.getEmail()}"></td>

											<th>성 명</th>
											<td data-td="product_td"><input type="text"
												name="u_Name" id="u_Name" 
												value="${user.getName()}"></td>
										</tr>
										<!-- <tr>
										</tr> -->
										<tr>
											<th>비 밀 번 호</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td"><input type="text" name="u_Pwd"
												id="u_Pwd" 
												value="${user.getPassword()}"></td>
											<th>전 화 번 호</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="u_Phone" id="u_Phone" 
												value="${user.getPhone()}"></td>
										</tr>
										<tr>
											<th>우 편 번 호</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td"><input type="text"
												name="u_Zonecode" id="u_Zonecode"
												value="${user.getZonecode()}"></td>
											<th>주 소</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="u_Address" id="u_Address" 
												value="${user.getAddress()}"></td>
										</tr>
										<tr>
											<th>가 입 일</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td"><input type="text"
												name="u_signupDate" id="u_signupDate"
												placeholder="예) 치이카와 천사 악마 쿠지!"
												value="${user.getsingupDate()}"></td>
											<th>생 년 월 일</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="u_Birth" id="u_Birth" placeholder="예) 15000"
												value="${user.getBirth()}"></td>
										</tr>

										<tr>
											<th>성 별</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td" style="text-align: left">
											<input type="radio" name="u_Gender" id="u_Gender" 
											value="M" ${user.getGender() eq 'M' ? 'checked' : ''}>남성 
											<input type="radio" name="u_Gender" id="u_Gender" 
											value="F" ${user.getGender() eq 'F' ? 'checked' : ''}>여성
											</td>

											<th>권 한</th>
											<td data-td="product_td" style="text-align: left;padding-top: 15px;padding-bottom: 15px;">
											<input type="radio" name="u_Aut" id="u_Aut" 
											value="user" ${user.getAut() eq 'user' ? 'checked' : ''}>일반회원 
											<input type="radio" name="u_Aut" id="u_Aut" 
											value="admin" ${user.getAut() eq 'admin' ? 'checked' : ''}>관리자
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="product_insert_submit">
								<span class="backList_Button"><a href="getPList.admin">목록</a></span>
								<div>
								<input class="btn" type="submit" value="수정"> 
									<span class="del_Button">
										<a href="updateUser.admin?uId=${user.getId()}">삭제</a></span> 
								</div>
							</div>
						</form>
						
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html>