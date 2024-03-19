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
						<h1 class="h3 mb-0 text-gray-800">상품 등록</h1>
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

									<form action="saleInsert.admin?" method="post">
										<input type="hidden" name="pId"
											value="${product.getProduct_Id()}">
										<div class="mainProduct input__block">
											<table
												class="table table-bordered mainProductTable table-input"
												id="dataTable" width="100%" cellspacing="0">
												<colgroup>
													<col width="20%">
													<col width="14%">
													<col>
													<col width="14%">
													<col>
												</colgroup>
												<tbody>
													<!-- 제품 등록 폼 -->

													<tr>
														<th rowspan="5" style="padding: 0;">
															<div class="thumnail">
																<img src="${product.getProduct_Img()}">
															</div>
														</th>
														<th>제품 종류</th>
														<!-- 제품 종류 선택 라디오 버튼 -->
														<td>
															<div class="radio__block">
																<input type="radio" name="p_Type" id="p_Type" value="K"
																	onclick="return false;"
																	${product.getProduct_Type() eq 'K' ? 'checked' : ''}>&nbsp;쿠지&nbsp;
																<input type="radio" name="p_Type" id="p_Type" value="G"
																	onclick="return false;"
																	${product.getProduct_Type() eq 'G' ? 'checked' : ''}>&nbsp;가챠&nbsp;
															</div>
														</td>

														<th>제품 카테고리</th>

														<td><input class="text__block" type="text"
															name="p_Cat" id="p_Cat" readonly="readonly"
															value="${product.getProduct_Cat()}"></td>

													</tr>
													<tr>
													</tr>
													<tr>
														<th>제품명</th>
														<!-- 대표 제품명 입력 필드 -->
														<td><input class="text__block" type="text"
															name="p_Name" id="p_Name" readonly="readonly"
															value="${product.getProduct_Name()}"></td>
														<th>제품가격</th>
														<!-- 제품 이미지 URL 입력 필드 -->
														<td><input class="text__block" type="text"
															name="p_Price" id="p_Price" readonly="readonly"
															value="${product.getProduct_Price()}"></td>
													</tr>
													<tr>
														<th>제품 이미지URL</th>
														<!-- 제품 이미지 URL 입력 필드 -->
														<td colspan="4"><input class="text__block"
															type="text" name="p_Img" id="p_Img" readonly="readonly"
															value="${product.getProduct_Img()}"></td>
													</tr>
													<tr>
														<th>제품 설명</th>
														<!-- 제품 이미지 URL 입력 필드 -->

														<td colspan="4"><input class="text__block"
															type="text" name="p_Con" id="p_Con" readonly="readonly"
															value="${product.getProduct_Con()}"></td>
													</tr>


												</tbody>
											</table>
										</div>
										<div class="product_insert_submit">
											<input class="btn submitbtn" type="submit" value="등록">
											<button class="btn submitbtn" type="button"
												onclick="window.location.href='productDetail.admin?pId=${product.getProduct_Id()}';">수정</button>
											<button class="btn submitbtn" type="button"
												onclick="window.location.href='productList.admin';">목록</button>
										</div>
									
									<br> <br> <br>


									<!-- 판매등록 폼 -->
									<div class="mainProduct input__block">
										<table
											class="table table-bordered mainProductTable table-input"
											id="dataTable" width="100%" cellspacing="0">
											<colgroup>
												<col width="10%">
												<col width="10%">
												<col width="14%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th>정가</th>
													<td><input class="text__block" type="text"
														name="s_RegPrice" id="s_RegPrice"></td>
													<th rowspan="3">판매페이지<br>내용
													</th>
													<th rowspan="3">
														<div class="s_Cont">
															<textarea class="text__block" rows="4" cols="50"
																name="s_Description" id="s_Description"></textarea>
															<!-- <input class="text__block" type="text" name="s_Cont" id="s_Cont"> -->
														</div>
													</th>
												</tr>
												<tr>
													<th>판매가</th>
													<td><input class="text__block" type="text"
														name="s_Price" id="s_Price"></td>
												</tr>
												<tr>
													<th>할인율(%)</th>
													<td><input class="text__block" type="text"
														name="s_DiscontRate" id="s_DiscontRate"></td>
												</tr>
											</tbody>
										</table>
									</div>
									</form>
								
								</div>
								<!-- /.container-fluid -->

							</div>
						</div>
					</div>


				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<%@ include file="./layout/footer.jsp"%>
				<!-- End of Footer -->
			</div>
		</div>

	</div>
	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	   <script src="js/insertSale.js"></script>
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