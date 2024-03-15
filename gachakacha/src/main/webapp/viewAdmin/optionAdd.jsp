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
			<article>
				<div class="content">
					<section class="subtitle">
						<form action="oAdd.admin" method="post">
						<div class=subtitlebox style="display: flex; justify-content: flex-start;">
							<h1>옵션 추가</h1>
							<div style="padding-top: 15px;">
							<div class="product_insert_submit" style="padding-left: 10px;">
								<input class="btn" type="submit" value="추가">
								<input type="hidden" name="pId" value="${product.getProduct_Id()}">
							</div>
							</div>
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