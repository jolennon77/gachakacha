<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
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
					<form action="updateOrder.admin?odId${orderDetail.getOdersDetail_ID()}">
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
									<th>주 문</th>
								<!-- 제품 종류 선택 라디오 버튼 -->
									<td data-td="Orders_td"><input type="text"
									 name="OdersDetail_ID" id="OdersDetail_ID"
     								value="${OrdersDetail.getOdersDetail_ID()}"></td>
     							
									<th>날 짜</th>
									<td data-td="Orders_td"><input type="text" 
									name="Order_Date" id="Order_Date" 
    								value="${Orders.getOrder_Date()}"></td>
								</tr>
								<tr>
									<th>배 송 상 태</th>
									<td data-td="Orders_td"><input type="text" 
									name="Orders_Status" id="Orders_Status" 
    								value="${Orders.getOrders_Status()}"></td>
							
									<th>연 락 처</th>
									<td data-td="product_td"><input type="text" 
									name="Phone" id="Phone" 
    								value="${User.getPhone()}"></td>
								</tr>
								<tr>
									<th>주 소</th>
									<td colspan="4" data-td="product_td"><input type="text" 
									name="u_Address" id="u_Address" 
    								value="${user.getAddress()}"></td>
								</tr>
									<tr>
									<th>송 장</th>
									<td colspan="4" data-td="Orders_td"><input type="text" 
									name="Order_Qty" id="Order_Qty" 
    								value="${OrdersDetail.getOrder_Qty()}"></td>
								</tr>
										
							</tbody>
						</table>
					</div>
				
				<div class="product_insert_submit">
				<span class="backList_Button"><a href="orderPage.admin">목록</a></span>
			<div>
				<input class="btn" type="submit" value="수정"> 
					<span class="del_Button">
					<a href="orderDelete.admin?odId=${OrdersDetail.getOdersDetail_ID()}">삭제</a></span >
								</div>
							</div>
				<!-- 오더 정보를 표시하는 테이블 -->
						<div class="order_table">
							<div class=subtitlebox>
								<div style="display: flex; justify-content: flex-start;">
									<h1>주문 정보</h1>
									<div class="optionAdd">
										<a href="#"
											onclick="openOptionPage(${product.getProduct_Id()});">주문 수정</a>
									</div>
								</div>
							</div>
						</div>
							<!-- 옵션 수정 폼의 form 태그 시작 -->
							<table class="order_table" border="1">
								<colgroup>
									<col width="5%">
									<col width="8%">
									<col width="8%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th class="headth">제 품 사 진</th>
										<th class="headth">옵 션 이 름</th>
										<th class="headth">등 급</th>
										<th class="headth">구 매 수 량</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${orderList}" var="order">
										<form
											action="updateOrder.admin?odId=${order.getOrder_Id()}&pId=${order.getProduct_ID()}"
											method="post" name="order_update_form">
											<tr>
												<td>${option.getOption_ID()}</td>
												<td style="padding-left: 0px; padding-right: 0px;">
												<div class="thumnail">
														<img src="${order.getOption_Img()}">
													</div></td>
												<td data-td="option_td"><input type="text"
													name="option_name" id="option_name"
													value="${order.getOption_Name()}"></td>
												<td data-td="option_td"><input type="text"
													name="option_Img" id="option_Img"
													value="${order.getOption_Img()}"></td>
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
													value="${order.getOption_Qty()}"></td>
												<td>
													<!-- 수정 버튼 --> 
													<input type="hidden" name="option_ID" value="${option.getOption_ID()}"> 
													<input id="update_iButton" type="submit" value="수정"> 
													<span class="del_AButton">
													<a href="deleteOption.admin?oId=${order.getOption_ID()}&pId=${option.getProduct_ID()}">삭제</a>
													</span>

												</td>
											</tr>
										</form>
									</c:forEach>
								</tbody>
				</table>
			</form>
						
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html>