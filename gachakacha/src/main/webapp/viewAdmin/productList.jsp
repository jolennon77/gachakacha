<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 목록</title>
<!-- CSS 파일 링크 -->
<link href="./css/admin/reset.css" rel="stylesheet" />
<link href="./css/admin/layout.css" rel="stylesheet" />
<link href="./css/admin/product.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body>
	<section class="container">
		<div class="layout">
			<%@ include file="sidebar.jsp"%>
			<!-- sidebar.jsp 파일을 include 합니다. -->
			<article>
				<%@ include file="title.jsp"%>
				<!-- title.jsp 파일을 include 합니다. -->
				<div class="content">
					<section class="subtitle">
						<div class=subtitlebox>
							<h1>재고 목록</h1>
						</div>
						<table border="1">

								<colgroup>
								<col width="6%">
								<col width="10%">
								<col width="8%">
								<col width="10%">
								<col width="25%">
								<col>
								<col width="8%">
								<col width="10%">
							</colgroup>
							<tbody>
								<tr>
									<th class ="headth">제품ID</th>
									<th class ="headth">제품이미지</th>
									<th class ="headth">제품종류</th>
									<th class ="headth">제품카테고리</th>
									<th class ="headth">제품명</th>
									<th class ="headth">제품설명</th>
									<th class ="headth">가격</th>
									<th class ="headth">상세보기</th>

								</tr>
								<c:forEach items="${productList}" var="p">
									<tr>
										<%-- 제품ID--%>
										<td>${p.getProduct_Id()}</td>
										<%-- 제품이미지 --%>
										<td class="thumnailtdth">
											<div class="thumnail">
												<img src="${p.getProduct_Img()}">
											</div>
										</td>
										<%-- 제품종류 --%>
										<td><c:choose>
												<c:when test="${p.getProduct_Type() eq 'G'}">가챠</c:when>
												<c:when test="${p.getProduct_Type() eq 'K'}">쿠지</c:when>
												<c:otherwise></c:otherwise>
												<%-- 아무것도 표시하지 않음 --%>
											</c:choose></td>
										<%-- 제품카테고리 --%>
										<td>${p.getProduct_Cat()}</td>
										<%-- 제품명 --%>
										<td>${p.getProduct_Name()}</td>
										<%-- 제품설명 --%>
										<td>${p.getProduct_Con()}</td>
										<%-- 가격 --%>
										<td>${p.getProduct_Price()}</td>
										<td>
										<span class="update_AButton"><a href="getPDetail.admin?pId=${p.getProduct_Id()}">상세보기</a></span><br>
										<span class="del_AButton"><a href="boardReview.admin">리뷰목록</a></span>
										
										</td>
								</c:forEach>
						</table>
					</section>
				</div>
			</article>
		</div>
	</section>
</body>
</html>