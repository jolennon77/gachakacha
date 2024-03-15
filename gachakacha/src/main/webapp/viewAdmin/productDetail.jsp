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

<script>
    function openOptionPage(productId) {
        var url = "oAddPage.admin?pId=" + productId;
        var optionWindow = window.open(url, "_blank", "width=1000,height=400");
        optionWindow.focus();
    }
</script>
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
							<h1>상품 상세정보</h1>
						</div>
						<!-- start of 부모 제품 등록 폼 -->

						<form action="updateProduct.admin?pId=${product.getProduct_Id()}"
							method="post">
							<div class="main_product">
								<table class="main_productTable" border="1">
									<colgroup>
										<col width="18%">
										<col width="10%">
										<col>
										<col width="10%">
										<col>
									</colgroup>
									<tbody>
										<!-- 제품 등록 폼 -->

										<tr>
											<th rowspan="5" class="thumnailtdth">
												<div class="thumnail">
													<img src="${product.getProduct_Img()}">
												</div>
											</th>
											<th>제품 종류</th>
											<!-- 제품 종류 선택 라디오 버튼 -->
											<td data-td="product_td" style="text-align: left"><input
												type="radio" name="p_Type" id="p_Type" value="K"
												${product.getProduct_Type() eq 'K' ? 'checked' : ''}>
												쿠지 <input type="radio" name="p_Type" id="p_Type" value="G"
												${product.getProduct_Type() eq 'G' ? 'checked' : ''}>
												가챠</td>

											<th style="width: 10%">제품<br>카테고리
											</th>
											<td data-td="product_td" style="text-align: left;"><select
												class="option-select"
												style="width: 50%; text-align: left; padding: 7px 8px;"
												name="p_Cat" id="p_Cat">
													<option value="동물 피규어"
														${product.getProduct_Cat() eq '동물 피규어' ? 'selected' : ''}>동물
														피규어</option>
													<option value="미니어쳐 소품"
														${product.getProduct_Cat() eq '미니어쳐 소품' ? 'selected' : ''}>미니어쳐
														소품</option>
													<option value="인형 / 인형소품"
														${product.getProduct_Cat() eq '인형 / 인형소품' ? 'selected' : ''}>인형
														/ 인형소품</option>
													<option value="디즈니"
														${product.getProduct_Cat() eq '디즈니' ? 'selected' : ''}>디즈니</option>
													<option value="산리오"
														${product.getProduct_Cat() eq '산리오' ? 'selected' : ''}>산리오</option>
													<option value="치이카와"
														${product.getProduct_Cat() eq '치이카와' ? 'selected' : ''}>치이카와</option>
													<option value="오빤쮸우사기"
														${product.getProduct_Cat() eq '오빤쮸우사기' ? 'selected' : ''}>오빤쮸우사기</option>
													<option value="명탐정 코난"
														${product.getProduct_Cat() eq '명탐정 코난' ? 'selected' : ''}>명탐정
														코난</option>
													<option value="귀멸의 칼날"
														${product.getProduct_Cat() eq '귀멸의 칼날' ? 'selected' : ''}>귀멸의
														칼날</option>
													<option value="주술회전"
														${product.getProduct_Cat() eq '주술회전' ? 'selected' : ''}>주술회전</option>
													<option value="도쿄 리벤저스"
														${product.getProduct_Cat() eq '도쿄 리벤저스' ? 'selected' : ''}>도쿄
														리벤저스</option>
													<option value="하이큐"
														${product.getProduct_Cat() eq '하이큐' ? 'selected' : ''}>하이큐</option>
													<option value="포켓몬스터"
														${product.getProduct_Cat() eq '포켓몬스터' ? 'selected' : ''}>포켓몬스터</option>
													<option value="별의 커비"
														${product.getProduct_Cat() eq '별의 커비' ? 'selected' : ''}>별의
														커비</option>
													<option value="스누피"
														${product.getProduct_Cat() eq '스누피' ? 'selected' : ''}>스누피</option>
													<option value="짱구는못말려"
														${product.getProduct_Cat() eq '짱구는못말려' ? 'selected' : ''}>짱구는못말려</option>
													<option value="세일러문"
														${product.getProduct_Cat() eq '세일러문' ? 'selected' : ''}>세일러문</option>
													<option value="카드캡터 체리"
														${product.getProduct_Cat() eq '카드캡터 체리' ? 'selected' : ''}>카드캡터
														체리</option>
													<option value="꼬마마법사 레미"
														${product.getProduct_Cat() eq '꼬마마법사 레미' ? 'selected' : ''}>꼬마마법사
														레미</option>
													<option value="프리큐어"
														${product.getProduct_Cat() eq '프리큐어' ? 'selected' : ''}>프리큐어</option>
													<option value="그 외"
														${product.getProduct_Cat() eq '그 외' ? 'selected' : ''}>그
														외</option>

											</select></td>

										</tr>
										<tr>
										</tr>
										<tr>
											<th>제품명</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td"><input type="text"
												name="p_Name" id="p_Name" placeholder="예) 치이카와 천사 악마 쿠지!"
												value="${product.getProduct_Name()}"></td>
											<th>제품가격</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Price" id="p_Price" placeholder="예) 15000"
												value="${product.getProduct_Price()}"></td>
										</tr>
										<tr>
											<th>제품 이미지URL</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Img" id="p_Img" placeholder="예) www.img.jpg"
												value="${product.getProduct_Img()}"></td>
										</tr>
										<tr>
											<th>제품 설명</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Con" id="p_Con" placeholder="제품설명"
												value="${product.getProduct_Con()}"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="product_insert_submit">
								<span class="backList_Button"><a href="getPList.admin">목록</a></span>
								<div>
									<input class="btn" type="submit" value="수정"> 
									<span class="del_Button"><a href="deleteProduct.admin?pId=${product.getProduct_Id()}">삭제</a></span>
								</div>
							</div>
						</form>
						<br> <br> <br>


						<!-- 옵션 정보를 표시하는 테이블 -->
						<div class="option_table">
							<div class=subtitlebox>
								<div style="display: flex; justify-content: flex-start;">
									<h1>옵션 정보</h1>
									<div class="optionAdd">
										<a href="#"
											onclick="openOptionPage(${product.getProduct_Id()});">옵션
											추가</a>
									</div>
								</div>
							</div>

							<!-- 옵션 수정 폼의 form 태그 시작 -->
							<table class="option_table" border="1">
								<colgroup>
									<col width="5%">
									<col width="8%">
									<col>
									<col width="25%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th class="headth">옵션<br>ID</th>
										<th class="headth">옵션<br>이미지</th>
										<th class="headth">옵션명</th>
										<th class="headth">옵션이미지 URL</th>
										<th class="headth">옵션 등급</th>
										<th class="headth">재고</th>
										<th class="headth">수정 / 삭제</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${optionList}" var="option">
										<form
											action="updateOption.admin?oId=${option.getOption_ID()}&pId=${option.getProduct_ID()}"
											method="post" name="option_update_form">
											<tr>
												<td>${option.getOption_ID()}</td>
												<td style="padding-left: 0px; padding-right: 0px;"><div
														class="thumnail">
														<img src="${option.getOption_Img()}">
													</div></td>
												<td data-td="option_td"><input type="text"
													name="option_name" id="option_name"
													value="${option.getOption_Name()}"></td>
												<td data-td="option_td"><input type="text"
													name="option_Img" id="option_Img"
													value="${option.getOption_Img()}"></td>
												<td><select name="option_Grade">
														<option value="A" ${optionGrade eq 'A' ? 'selected' : ''}>A</option>
														<option value="B" ${optionGrade eq 'B' ? 'selected' : ''}>B</option>
														<option value="C" ${optionGrade eq 'C' ? 'selected' : ''}>C</option>
														<option value="D" ${optionGrade eq 'D' ? 'selected' : ''}>D</option>
														<option value="E" ${optionGrade eq 'E' ? 'selected' : ''}>E</option>
														<option value="F" ${optionGrade eq 'F' ? 'selected' : ''}>F</option>
												</select></td>
												<td data-td="option_Qty"><input type="text"
													name="option_Qty" id="option_Qty"
													value="${option.getOption_Qty()}"></td>
												<td>
													<!-- 수정 버튼 --> 
													<input type="hidden" name="option_ID" value="${option.getOption_ID()}"> 
													<input id="update_iButton" type="submit" value="수정"> 
													<span class="del_AButton">
													<a href="deleteOption.admin?oId=${option.getOption_ID()}&pId=${option.getProduct_ID()}">삭제</a>
													</span>

												</td>
											</tr>
										</form>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html>