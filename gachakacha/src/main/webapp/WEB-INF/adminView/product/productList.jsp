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

    <title>상품 목록</title>

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
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/adminView/layout/sidebar.jsp"%>

		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/WEB-INF/adminView/layout/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">상품 목록</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;데이터베이스 내려받기</a>
					</div>
					<div class="container-fluid">
						<div class="card shadow mb-4">
							<!-- <div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">DataTables
									Example</h6>
							</div> -->
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<colgroup>
											<col width="9%">
											<col width="8%">
											<col width="7%">
											<col width="10%">
											<col width="15%">
											<col>
											<col width="8%">
											<col width="8%">
											<col width="8%">
										</colgroup>
										<thead>
											<tr>
												<th>제품ID</th>
												<th>이미지</th>
												<th>종류</th>
												<th>카테고리</th>
												<th>제품명</th>
												<th>제품설명</th>
												<th>입고가</th>
												<th>판매</th>
												<th>리뷰</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${productList}" var="p">
												<tr>
													<td>${p.getProduct_Id()}</td>
													<td style="padding: 0;">
														<div class="thumnail">
															<img src="${p.getProduct_Img()}">
														</div>
													</td>
													<td><c:choose>
												<c:when test="${p.getProduct_Type() eq 'G'}">가챠</c:when>
												<c:when test="${p.getProduct_Type() eq 'K'}">쿠지</c:when>
												<c:otherwise></c:otherwise>
												<%-- 아무것도 표시하지 않음 --%>
											</c:choose></td>
													
													<td>${p.getProduct_Cat()}</td>
													<td><a href="detail.product?pId=${p.getProduct_Id()}">${p.getProduct_Name()}</a></td>
													<td>${p.getProduct_Con()}</td>
													<td>${p.getProduct_Price()}</td>
													<td><button class="btn submitbtn updatebtn" id="minibtn" type="button" onclick="window.location.href='insertForm.sale?pId=${p.getProduct_Id()}';">판매등록</button></td>
													<td><button class="btn submitbtn listbtn" id="minibtn" type="button" onclick="window.location.href='saleInsertForm.admin?pId=${p.getProduct_Id()}';">리뷰목록</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div> 
						
						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->

					<!-- Footer -->
					<%@ include file="/WEB-INF/adminView/layout/footer.jsp"%>
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
	<%@ include file="/WEB-INF/adminView/layout/logoutModel.jsp"%>

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


