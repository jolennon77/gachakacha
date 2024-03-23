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

<title>상품 등록</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="js/addOption.js"></script>

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
						<h1 class="h3 mb-0 text-gray-800">회원 정보</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>
					<div class="container-fluid">
						<div class="card shadow mb-4">
							<!-- <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables
                                Example</h6>
                        </div> -->
							<div class="card-body">
								<div class="table-responsive">
									<!-- start of 부모 제품 등록 폼 -->

									<form action="updateUser.admin" method="post">
										<input type="hidden" name="pId"
											value="${product.getProduct_Id()}">
										<div class="mainProduct input__block">
											<table
												class="table table-bordered mainProductTable table-input"
												id="dataTable" width="100%" cellspacing="0">
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
												<td data-td="product_td">
													<input class="text__block"  type="text" name="u_Email" id="u_Email" value="${user.getEmail()}">
												</td>

												<th>성 명</th>
												<td data-td="product_td">
													<input class="text__block"  type="text" name="u_Name" id="u_Name" value="${user.getName()}">
												</td>
											</tr>
											<!-- <tr>
										</tr> -->
											<tr>
												<th>비 밀 번 호</th>
												<!-- 대표 제품명 입력 필드 -->
												<td>
													<input class="text__block"  type="text" name="u_Pwd" id="u_Pwd" value="${user.getPassword()}">
												</td>
												<th>전 화 번 호</th>
												<!-- 제품 이미지 URL 입력 필드 -->
												<td>
													<input class="text__block"  type="text" name="u_Phone" id="u_Phone" value="${user.getPhone()}">
												</td>
											</tr>
											<tr>
												<th>주 소</th>
												<!-- 제품 이미지 URL 입력 필드 -->
												<td colspan="4">
													<input class="text__block"  type="text" name="u_Address" id="u_Address" value="${user.getAddress()}">
												</td>
											</tr>
											<tr>
												<th>가 입 일</th>
												<!-- 대표 제품명 입력 필드 -->
												<td>
													<input class="text__block" type="text" name="u_signupDate" id="u_signupDate" placeholder="예) 치이카와 천사 악마 쿠지!" value="${user.getsingupDate()}">
												</td>
												<th>생 년 월 일</th>
												<!-- 제품 이미지 URL 입력 필드 -->
												<td colspan="4">
													<input class="text__block"  type="text" name="u_Birth" id="u_Birth" placeholder="예) 15000" value="${user.getBirth()}">
												</td>
											</tr>

											<tr>
												<th>성 별</th>
												<!-- 대표 제품명 입력 필드 -->
												<td>
												<div class="radio__block">
												<input type="radio" name="u_Gender" id="u_Gender"
													value="M" ${user.getGender() eq 'M' ? 'checked' : ''}>&nbsp;남성&nbsp;
													<input type="radio" name="u_Gender" id="u_Gender" value="F"
													${user.getGender() eq 'F' ? 'checked' : ''}>&nbsp;여성&nbsp;
												</div>
												</td>
												<th>권 한</th>
												<td>
												<div class="radio__block">
												<input type="radio" name="u_Aut" id="u_Aut"
													value="user" ${user.getAut() eq 'user' ? 'checked' : ''}>&nbsp;일반회원&nbsp;
													<input type="radio" name="u_Aut" id="u_Aut" value="admin"
													${user.getAut() eq 'admin' ? 'checked' : ''}>&nbsp;관리자&nbsp;</div></td>
											</tr>
										</tbody>
									</table>
									
								</div>
								<div class="basic_submit_zone">
											<input class="btn submitbtn updatebtn" type="submit" value="수정">
											<input type="hidden" name="uId" value="${user.getId()}">
											<button class="btn submitbtn deletebtn" type="button"
												onclick="window.location.href='userDelete.admin?uId=${user.getId()}';">삭제</button>
											<button class="btn submitbtn listbtn" type="button"
												onclick="window.location.href='userList.admin';">목록</button>
										</div>
									</form>
							</div>
						</div>

						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->

					<!-- Footer -->
					<%@ include file="./layout/footer.jsp"%>
					<!-- End of Footer -->
				</div>
			</div>

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
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>