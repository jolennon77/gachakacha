<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style>
/* 추가할 CSS 스타일이 있다면 여기에 추가. */
</style>
<script>
	
</script>

</head>
<body>

	<section class="container">
		<div class="layout">
			<article>

				<div class="content">
					<section class="subtitle">
						<div class=subtitlebox>
							<h1>옵션 정보</h1>
						</div>
						<div class="option_table">



							<!-- 옵션 수정 폼의 form 태그 시작 -->
							<form action="updateOption.admin?pId=${product.getProduct_Id()}"
								method="post" name="option_update_form">
								<table class="option_table" border="1">
									<colgroup>
										<col width="5%">
										<col width="10%">
										<col>
										<col width="25%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th>옵션ID</th>
											<th>옵션 이미지</th>
											<th>옵션명</th>
											<th>옵션이미지 URL</th>
											<th>옵션 등급</th>
											<th>재고</th>
											<th>수정 / 삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${OptionList}" var="o">
											<tr>
												<td></td>
												<td><div class="thumnail">
														<img src="#">
													</div></td>
												<td data-td="option_td"><input type="text"
													name="option_name" id="option_name" value=""></td>
												<td data-td="option_td"><input type="text"
													name="option_Img" id="option_Img" value=""></td>
												<td><select name="option_Grade">
														<option value="A">A</option>
														<option value="B">B</option>
														<option value="C">C</option>
														<option value="D">D</option>
														<option value="E">E</option>
														<option value="F">F</option>
												</select></td>
												<td data-td="option_Qty"><input type="text"
													name="option_Qty" id="option_Qty" value=""></td>
												<td><input class="btn" type="submit" value="수정">
													<span class="del_Button"> <a
														href="deleteOption.admin?pId=${product.getProduct_Id()}">삭제</a></span>


												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html> --%>