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

    <title>공지사항</title>

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
						<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"style="margin-left: auto;"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;데이터베이스 내려받기</a>
							
							<div style="padding-left: 1.5rem; padding-right: 1.5rem;">
							<a href="insertForm.board?bcat=${boardcat1}"
							
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm updatebtn">게시글 등록</a>
							</div>
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
											<col width="8%">
											<col width="12%">
											<col class="bcat2" width="12%">
											<col>
											<col width="12%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>게시판</th>
												<th class="bcat2">게시글구분</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${boardList}" var="b">
												<tr>
													<td>${b.getBoard_ID()}</td>
													<td>${b.getBoard_Cat1()}</td>
													<td class="bcat2">${b.getBoard_Cat2()}</td>
													<td><a href="detail.board?bId=${b.getBoard_ID()}">${b.getBoard_Title()}</a></td>
													<td>${b.getUser_Name()}</td>
													<td>${b.getBoard_CreateDate()}</td>
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
        $(document).ready(function() {
            // boardcat1 값이 "secondHand"가 아닌 경우에는 해당 요소를 숨김
            var boardcat1 = "${boardcat1}";
            if (boardcat1 !== "secondHand") {
                $(".bcat2").hide();
            }
        });
    </script>
</body>

</html>


