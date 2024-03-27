
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

<title>글쓰기</title>

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous"> -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/adminView/layout/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/adminView/layout/topbar.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">게시글 수정</h1>
					</div>
					<div class="container-fluid">
						<div class="card shadow mb-4">
							<!-- <div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">DataTables
									Example</h6>
							</div> -->
							<div class="card-body">
								<div class="table-responsive">
									<form id="boardForm" action="update.board" method="post">
										<input type="hidden" name="uId" value="${user.getId()}">
										<input type="hidden" name="bcat1" value="${board.getBoard_Cat1()}">
										<input type="hidden" name="bId" value="${board.getBoard_ID()}">
										<table
											class="table table-bordered mainProductTable table-input"
											id="secondhandTable" width="100%" cellspacing="0" style="width: 33.4%">
											<colgroup>
												<col width="42%">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th>게시판종류</th>
													<td>
														<div class="select__block">
															<select class="select__block" name="Board_Cat2"
																id="Board_Cat2" required>
																<option value="buy">사요</option>
																<option value="sell">팔아요</option>
																<option value="trade">교환해요</option>
																<option value="end">완료</option>
															</select>
														</div>
													</td>
												</tr>
											</tbody>
										</table>

										<div class="mainProduct input__block">
											<table
												class="table table-bordered mainProductTable table-input"
												id="dataTable" width="100%" cellspacing="0">
												<colgroup>
													<col width="14%">
													<col>
													<col width="14%">
													<col>
													<col width="14%">
													<col>
												</colgroup>
												<tbody>

													<tr>
														<th>작성자</th>
														<td><input class="text__block" type="text" value="${user.getName()}" readonly="readonly"></td>
														<th>작성일</th>
														<td><input class="text__block" type="text" value="${board.getBoard_CreateDate()}" readonly="readonly"></td>
														<th>비밀번호</th>
														<td><input class="text__block" type="text"
															name="Board_Pwd" id="Board_Pwd" placeholder="" required></td>
													</tr>
													<tr>
														<th>제목</th>
														<td colspan="6"><input class="text__block"
															type="text" name="Board_Title" id="Board_Title"
															value="${board.getBoard_Title()}"></td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- 	<div id="summernote">
											<textarea id="Board_Content" name="Board_Content" style="display: none;"></textarea>
										</div> -->
										<textarea rows="5" id="summernote" name="Board_Content">${board.getBoard_Content()}</textarea>
										<br>
										 <div class="basic_submit_zone" >
                                    	<input class="btn submitbtn updatebtn" id="submitButton" type="submit" value="수정">
                                     <button class="btn submitbtn deletebtn" id="deletebtn" type="button" onclick="confirmDeleteBoard('${board.getBoard_ID()}', '${board.getBoard_Cat1()}');">삭제</button>
                                    <button class="btn submitbtn listbtn" type="button" onclick="window.location.href='list.board?bcat=${board.getBoard_Cat1()}';">목록</button>
                                    
										</div>
									</form>


								</div>
							</div>
						</div>

						<!-- /.container-fluid -->

					</div>
					<!-- End of Main Content -->

					<!-- Footer -->
					<jsp:include page="/WEB-INF/adminView/layout/footer.jsp" />
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
	<jsp:include page="/WEB-INF/adminView/layout/logoutModel.jsp" />

	<script>
		$('#summernote').summernote({
			placeholder : '글 내용을 입력해 주세요',
			tabsize : 2,
			height : 400
		});
	</script>
<script>
$(document).ready(function() {
    // boardcat1 값이 "secondhand"가 아닌 경우에는 해당 테이블을 숨김
    var boardcat1 = "${board.getBoard_Cat1()}";
    if (boardcat1 !== "secondHand") {
        $("#secondhandTable").hide();
    }

    $("#submitButton").click(function() {
            // 기존 비밀번호와 새로 입력한 비밀번호 비교
            var oldPassword = "${board.getBoard_Pwd()}"; // 기존 비밀번호
            var newPassword = $("#Board_Pwd").val(); // 새로 입력한 비밀번호

            if (oldPassword !== newPassword) {
                alert("비밀번호가 일치하지 않습니다.");
                return false; // 함수 종료
            } else{
      	    		  // 폼 전송
          		   alert("수정이 완료 되었습니다.");
      	    		  $("#boardForm").submit();
      	    		  
      	    		  }
    });
});


</script>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/js/demo/datatables-demo.js"></script>
		<script src="/js/board.js"></script>
<script>
		$(document).ready(function() {
		    // 삭제 버튼 클릭 시
		    $("#deletebtn").click(function() {
		        // 기존 비밀번호와 입력한 비밀번호 비교
		        var oldPassword = "${board.getBoard_Pwd()}"; // 기존 비밀번호
		        var newPassword = $("#Board_Pwd").val(); // 입력한 비밀번호

		        if (oldPassword !== newPassword) {
		            alert("비밀번호가 일치하지 않습니다. 삭제할 수 없습니다.");
		            return false; // 삭제 중지
		        } else {
		            // 비밀번호가 일치하면 삭제 확인 대화상자 표시
		            var result = confirm("정말로 삭제하시겠습니까?");
		            if (result) {
		                // 확인을 누르면 삭제 요청을 서버로 전송
		                var boardId = "${board.getBoard_ID()}";
		                var bcat1 = "${board.getBoard_Cat1()}";
		                window.location.href = 'delete.board?bId=' + boardId + '&bcat1=' + bcat1;
		            }
		        }
		    });
		});
		</script>
</body>

</html>