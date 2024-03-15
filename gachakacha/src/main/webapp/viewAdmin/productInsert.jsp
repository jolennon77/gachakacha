<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<!-- CSS 파일 링크 -->


<link href="./css/admin/reset.css" rel="stylesheet" />
<link href="./css/admin/layout.css" rel="stylesheet" />
<link href="./css/admin/product.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style>
/* 추가할 CSS 스타일이 있다면 여기에 추가. */
</style>
<script>
function copyOptionTable() {
	var originalTable = document.querySelector(".optionTable");
	var cloneTable = originalTable.cloneNode(true);
	cloneTable.querySelector(".type-delete").style.display = "inline-block";
	cloneTable.querySelector(".type-delete").setAttribute("onclick", "deleteOptionTable(this);");

	var inputs = cloneTable.querySelectorAll('input[type="text"]');
	inputs.forEach(function(input) {
		input.value = '';
	});

	document.querySelector(".option").appendChild(cloneTable);
}

function deleteOptionTable(button) {
	var row = button.closest('table');
	row.parentNode.removeChild(row);
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
							<h1>상품 등록</h1>
						</div>
						<!-- start of 부모 제품 등록 폼 -->
						<form action="pInsert.admin" method="post">
							<div class="main_product">
								<table class="main_productTable" border="1">
									<colgroup>
										<col width="10%">
										<col>
										<col width="10%">
										<col>
									</colgroup>
									<tbody>
										<!-- 제품 등록 폼 -->
										<tr>
											<th>제품 종류</th>
											<!-- 제품 종류 선택 라디오 버튼 -->
											<td data-td="product_td" style="text-align: left"><input
												type="radio" name="p_Type" id="p_Type" value="K"> 쿠지
												<input type="radio" name="p_Type" id="p_Type" value="G">
												가챠</td>
											<th style="width: 10%">제품<br>카테고리
											</th>
											<td data-td="product_td" style="text-align: left;"><select
												class="option-select" style="width: 50%; text-align: left; padding: 7px 8px; "
												name="p_Cat" id="p_Cat">
													<option value="동물 피규어">동물 피규어</option>
													<option value="미니어쳐 소품">미니어쳐 소품</option>
													<option value="인형 / 인형소품">인형 / 인형소품</option>
													<option value="디즈니">디즈니</option>
													<option value="산리오">산리오</option>
													<option value="치이카와">치이카와</option>
													<option value="오빤쮸우사기">오빤쮸우사기</option>
													<option value="명탐정 코난">명탐정 코난</option>
													<option value="귀멸의 칼날">귀멸의 칼날</option>
													<option value="주술회전">주술회전</option>
													<option value="도쿄 리벤저스">도쿄 리벤저스</option>
													<option value="하이큐">하이큐</option>
													<option value="포켓몬스터">포켓몬스터</option>
													<option value="별의 커비">별의 커비</option>
													<option value="스누피">스누피</option>
													<option value="짱구는못말려">짱구는못말려</option>
													<option value="세일러문">세일러문</option>
													<option value="카드캡터 체리">카드캡터 체리</option>
													<option value="꼬마마법사 레미">꼬마마법사 레미</option>
													<option value="프리큐어">프리큐어</option>
													<option value="그 외">그 외</option>
											</select></td>

										</tr>
										<tr>
										</tr>
										<tr>
											<th>제품명</th>
											<!-- 대표 제품명 입력 필드 -->
											<td data-td="product_td"><input type="text"
												name="p_Name" id="p_Name" placeholder="예) 치이카와 천사 악마 쿠지!"></td>
											<th>제품가격</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Price" id="p_Price" placeholder="예) 15000"></td>
										</tr>
										<tr>
											<th>제품 이미지URL</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Img" id="p_Img" placeholder="예) www.img.jpg"></td>
										</tr>
										<tr>
											<th>제품 설명</th>
											<!-- 제품 이미지 URL 입력 필드 -->
											<td colspan="4" data-td="product_td"><input type="text"
												name="p_Con" id="p_Con" placeholder="제품설명"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="product_insert_submit" style="padding-left: 10px;">
								<input class="btn" type="submit" value="등록">
							</div>
							
							<div class="option">
									<table class="optionTable" border="1">
										<colgroup>
											<col width="45%">
											<col width="10%">
											<col width="10%">
											<col width="25%">
											<col width="10%">
										</colgroup>
										<tbody>
											<!-- 옵션 테이블 행 -->
											<tr>
												<td colspan="5" class="unit-btns">
													<!-- 버튼 영역 --> <!-- 복사 버튼 -->
													<div>
														<a href="javascript:;" onclick="copyOptionTable();"
															class="btn btn-xs type-copy copy-button"> <span
															style="vertical-align: middle; text-align: center;">
																<i class="fa-solid fa-plus"></i>
														</span>
														</a> <a href="javascript:;" style="display: none;"
															class="btn btn-xs type-delete delete-button"> <span
															style="vertical-align: middle; text-align: center;">
																<i class="fa-solid fa-minus"></i>
														</span>
														</a>
													</div>
												</td>
											</tr>

											<!-- 옵션 테이블 헤더 -->
											<tr>
												<th>옵션 명</th>
												<th>옵션 ID</th>
												<th>옵션 등급</th>
												<th>옵션이미지URL</th>
												<th>옵션 수량</th>
											</tr>

											<!-- 옵션 테이블 데이터 -->
											<tr>
												<td data-td="option_td"><input type="text"
													class="option_input" name="o_Name[]" id="o_Name[]" value=""
													placeholder="예) 치이카와 피규어"></td>
												<td data-td="option_td"><input type="text"
													class="option_input" name="o_ID[]" id="o_ID[]" value=""
													placeholder="자동생성" readonly="readonly"></td>
												<td data-td="option_td"><select class="option-select"
													name="o_Grade[]" id="o_Grade[]">
														<option value="A">A</option>
														<option value="B">B</option>
														<option value="C">C</option>
														<option value="D">D</option>
														<option value="E">E</option>
														<option value="F">F</option>
														<option value="null">없음</option>
												</select></td>
												<td data-td="option_td"><input type="text"
													class="option_input" name="o_Img[]" id="o_Img[]"
													placeholder="img"></td>
												<td data-td="option_td"><input type="text"
													class="option_input" name="o_Qty[]" id="o_Qty[]" placeholder="예) 1"></td>
											</tr>
										</tbody>
									</table>
								</div>
						</form>
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html>