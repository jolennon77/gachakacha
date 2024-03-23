<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>상품 등록</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
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
									
									<form action="productInsert.admin" method="post">
										<div class="mainProduct input__block">
											<table class="table table-bordered mainProductTable table-input" id="dataTable" width="100%" cellspacing="0">
												<colgroup>
													<col width="14%">
													<col>
													<col width="14%">
													<col>
												</colgroup>
												<tbody>
													<!-- 제품 등록 폼 -->
													<tr>
														<th>제품 종류</th>
														<!-- 제품 종류 선택 라디오 버튼 -->
														<td>
															<div class="radio__block">
																<input type="radio" name="p_Type" id="p_Type" value="K">&nbsp;쿠지&nbsp;
																 <input type="radio" name="p_Type" id="p_Type" value="G" required>&nbsp;가챠&nbsp; 
															</div>
														</td>
														<th>제품 카테고리
														</th>
														
														<td>
														<div class="select__block">
														<select class="select__block" name="p_Cat" id="p_Cat" required>
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
																<option value="체인소맨">체인소맨</option>
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
															</select></div></td>

													</tr>
													<tr>
													</tr>
													<tr>
														<th>제품명</th>
														<td><input class="text__block" type="text" name="p_Name" id="p_Name" placeholder="예) 치이카와 천사 악마 쿠지!" required></td>
														<th>제품가격</th>
														<td colspan="4">
															<input class="text__block"  type="text" name="p_Price" id="p_Price" placeholder="예) 15000"required>
														</td>
													</tr>
													<tr>
														<th>제품 이미지 URL</th>
														<td colspan="4">
															<input class="text__block"  type="text" name="p_Img" id="p_Img" placeholder="예) www.img.jpg">
														</td>
													</tr>
													<tr>
														<th>제품 설명</th>
														<td colspan="4">
															<input class="text__block"  type="text" name="p_Con" id="p_Con" placeholder="제품설명">
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="basic_submit_zone" >
											<input class="btn submitbtn updatebtn" type="submit" value="등록">
										</div>
										
										<br>

										<div class="option input__block">
											<!-- <table class="optionTable" border="1"> -->
											<table class="table optionTable" id="dataTable" width="100%" cellspacing="0">
											<!-- <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> -->
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
														<td colspan="5" id="optionAddBtn">
															<!-- 버튼 영역 --> <!-- 복사 버튼 -->
															<div>
																<a href="javascript:;" onclick="copyOptionTable();"
																	class="btn btn-xs type-copy copy-button">
																		<i class="fa-solid fa-square-plus"></i>
																	
																</a> <a href="javascript:;" style="display: none;"
																	class="btn btn-xs type-delete delete-button">
																		<i class="fa-solid fa-square-minus"></i>
																	
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
														<td>
															<input class="text__block" type="text" name="o_Name[]" id="o_Name[]" placeholder="예) 치이카와 피규어" required>
														</td>
														<td>
															<input class="text__block" type="text" name="o_ID[]" id="o_ID[]" placeholder="자동생성" readonly="readonly">
														</td>
														<td>
														<div class="select__block">
															<select class="option-select" name="o_Grade[]" id="o_Grade[]" style="width: 100%" required>
																<option value="A">A</option>
																<option value="B">B</option>
																<option value="C">C</option>
																<option value="D">D</option>
																<option value="E">E</option>
																<option value="F">F</option>
															</select>
															</div>
														</td>
														<td>
															<input class="text__block" type="text" name="o_Img[]" id="o_Img[]" placeholder="예) www.img.jpg">
														</td>
														<td>
															<input class="text__block" type="text" name="o_Qty[]" id="o_Qty[]" placeholder="예) 1"required>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</form>



								</div>
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