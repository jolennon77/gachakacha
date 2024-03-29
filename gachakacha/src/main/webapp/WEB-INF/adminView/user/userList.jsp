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

    <title>유저 리스트</title>

    <!-- Custom fonts for this template -->
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

	 <!-- Sidebar -->
   <jsp:include page="/WEB-INF/adminView/layout/sidebar.jsp"/>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
           <jsp:include page="/WEB-INF/adminView/layout/topbar.jsp"/>
		<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">회원 목록</h1>
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
											<col>
											<col width="9%">
											<col width="14%">
											<col width="7%">
											<col width="12%">
											<col width="12%">
											<col width="8%">
											<col width="8%">
										</colgroup>
										<thead>
											<tr>
												<th>이메일</th>
	                                            <th>이름</th>
	                                            <th>전화번호</th>
	                                            <th>성별</th>
	                                            <th>생일</th>
	                                            <th>가입일자</th>
	                                            <th>권한</th>
	                                            <th>작성글</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${userList}" var="u">
												<tr>
													<td><a href="detail.user?uId=${u.getId()}">${u.getEmail()}</a></td>
                                                    <td><a href="detail.user?uId=${u.getId()}">${u.getName()}</a></td>
                                                    <td>${u.getPhone()}</td>
                                                    <td>
														<c:choose>
														<c:when test="${u.getGender() eq 'M'}">남</c:when>
														<c:when test="${u.getGender() eq 'F'}">여</c:when>
														<c:otherwise></c:otherwise>
														<%-- 아무것도 표시하지 않음 --%>
														</c:choose>
													</td>
                                                    <td>${u.getBirth()}</td>
													<td>${u.getsingupDate()}</td>
													<td>${u.getAut()}</td>
													<td><button class="btn submitbtn updatebtn" id="minibtn" type="button" onclick="openBoardPage(${u.getId()});">작성글</button></td>
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
			   <jsp:include page="/WEB-INF/adminView/layout/footer.jsp"/>
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
 <jsp:include page="/WEB-INF/adminView/layout/logoutModel.jsp"/>

	<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
	<script>
    function openBoardPage(userId) {
        var url = "detailByUser.board?uId=" + userId;
        var shipWindow = window.open(url, "_blank", "width=1000,height=400");
        shipWindow.focus();
    }
</script>
</body>

</html>