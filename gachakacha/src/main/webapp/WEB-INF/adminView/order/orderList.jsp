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

<title>주문 조회</title>

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
						<h1 class="h3 mb-0 text-gray-800">주문 조회</h1>
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
										<thead>
											<tr>

												<th class="headth">주문 번호</th>
												<th class="headth">이미지</th>
												<th class="headth">주문 고객명</th>
												<th class="headth">상품 번호</th>
												<th class="headth">주문 일자</th>
												<th class="headth">결제 상태</th>
												<th class="headth">운송 번호</th>
												<th class="headth">송장 입력</th>
											</tr>
										</thead>
										<tbody>
										<%-- 자료 넣기 --%>
										<c:forEach items="${orderAll}" var="order">
											<tr>
												<td><a
													href="detail.order?odId=${order.getOrders_ID()}">${order.getOrders_ID()}</a></td>
												<td style="padding: 0;">
													<div class="thumnail">
														<img src="${order.getProduct_Img()}">
													</div>
												</td>
												<td>${order.getUser_ID()}</td>
												<td>${order.getProduct_ID()}</td>
												<td>${order.getOrders_Date()}</td>
												<td>${order.getOrders_Status()}</td>
												<td>${order.getShip_Number()}</td>
												<td><button class="btn submitbtn updatebtn" id="minibtn" type="button" onclick="openShipPage(${order.getOrders_ID()});">운송장번호입력</button></td>
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
	<script>
    function openShipPage(orderId) {
        var url = "insertShipForm.order?odId=" + orderId;
        var shipWindow = window.open(url, "_blank", "width=1000,height=400");
        shipWindow.focus();
    }
</script>
</body>

</html>