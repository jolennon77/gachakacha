<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="./layout/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="./layout/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>


					<h1>본문내용</h1>
					<form action="updateUser.admin?uId=${user.getId()}" method="post">
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
											name="u_Email" id="u_Email" value="${user.getEmail()}"></td>

										<th>성 명</th>
										<td data-td="product_td"><input type="text" name="u_Name"
											id="u_Name" value="${user.getName()}"></td>
									</tr>
									<!-- <tr>
										</tr> -->
									<tr>
										<th>비 밀 번 호</th>
										<!-- 대표 제품명 입력 필드 -->
										<td data-td="product_td"><input type="text" name="u_Pwd"
											id="u_Pwd" value="${user.getPassword()}"></td>
										<th>전 화 번 호</th>
										<!-- 제품 이미지 URL 입력 필드 -->
										<td colspan="4" data-td="product_td"><input type="text"
											name="u_Phone" id="u_Phone" value="${user.getPhone()}"></td>
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
											name="u_Address" id="u_Address" value="${user.getAddress()}"></td>
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
										<td data-td="product_td" style="text-align: left"><input
											type="radio" name="u_Gender" id="u_Gender" value="M"
											${user.getGender() eq 'M' ? 'checked' : ''}>남성 <input
											type="radio" name="u_Gender" id="u_Gender" value="F"
											${user.getGender() eq 'F' ? 'checked' : ''}>여성</td>

										<th>권 한</th>
										<td data-td="product_td"
											style="text-align: left; padding-top: 15px; padding-bottom: 15px;">
											<input type="radio" name="u_Aut" id="u_Aut" value="user"
											${user.getAut() eq 'user' ? 'checked' : ''}>일반회원 <input
											type="radio" name="u_Aut" id="u_Aut" value="admin"
											${user.getAut() eq 'admin' ? 'checked' : ''}>관리자
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="product_insert_submit">
							<span class="backList_Button"><a href="userList.admin">목록</a></span>
							<div>
								<input class="btn" type="submit" value="수정"> <span
									class="del_Button"> <a
									href="userDelete.admin?uId=${user.getId()}">삭제</a></span>
							</div>
						</div>
					</form>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="./layout/footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@ include file="./layout/logoutModel.jsp"%>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>