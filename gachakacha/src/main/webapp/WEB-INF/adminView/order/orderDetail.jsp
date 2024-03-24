<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>주문 상세보기</title>

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


<script>
    // 페이지가 로드될 때 초기 상태 설정
    window.onload = function() {
        updateOrderStatus();
    };

    // 운송장 번호 입력 칸에서 벗어났을 때 주문 상태 업데이트
    document.getElementById('Ship_Number').addEventListener('blur', function() {
        updateOrderStatus();
    });

    function updateOrderStatus() {
        var shipNumber = document.getElementById('Ship_Number').value;
        var orderStatusInput = document.getElementById('Orders_Status');
        var orderStatus = '';

        // 운송장 번호가 있으면 배송 완료로 설정
        if (shipNumber.trim() !== '') {
            orderStatus = '배송완료';
        } else {
            orderStatus = '주문접수';
        }

        // 주문 상태 필드에 값 설정
        orderStatusInput.value = orderStatus;
    }
</script>





            
        </head>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <%@ include file="/WEB-INF/adminView/layout/sidebar.jsp" %>
                    <!-- End of Sidebar -->

                    <!-- Content Wrapper -->
                    <div id="content-wrapper" class="d-flex flex-column">

                        <!-- Main Content -->
                        <div id="content">

                            <!-- Topbar -->
                            <%@ include file="/WEB-INF/adminView/layout/topbar.jsp" %>
                                <!-- End of Topbar -->

                                <!-- Begin Page Content -->
                                <div class="container-fluid">

                                    <!-- Page Heading -->
                                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                        <h1 class="h3 mb-0 text-gray-800">주문 상세보기</h1>
                                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                                    </div>
                                    <div class="container-fluid">
                                        <div class="card shadow mb-4">

                                            <div class="card-body">
                                                <div class="table-responsive">

                                                    <div class="table-responsive">
                                                        <!-- start of 부모 제품 등록 폼 -->

                                                        <form action="update.order" method="post">
                                                            <input type="hidden" name="odId"
                                                                value="${order.getOrders_ID()}">

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
                                                                            <th>주 문 번 호</th>
                                                                            <!-- 제품 종류 선택 라디오 버튼 -->
                                                                            <td>
                                                                            	<input class="text__block" type="text" value="${order.getOrders_ID()}" readonly>
                                                                            </td>

                                                                            <th>주 문 날 짜</th>
                                                                            <td>
                                                                            	<input class="text__block" type="text" value="${order.getOrders_Date()}" readonly>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>


                                                                            <th>주 문 자 명</th>
                                                                            <td>
                                                                            	<input class="text__block" type="text" value="${user.getName()}" readonly>
                                                                            </td>

                                                                            <th>연 락 처</th>
                                                                            <td>
                                                                            	<input class="text__block" type="text" value="${user.getPhone()}" readonly>
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <th>송 장 번 호</th>
                                                                            <td>
                                                                            	<input class="text__block" type="text" name="Ship_Number" id="Ship_Number" value="${order.getShip_Number()}">
                                                                            </td>
                                                                            <th>주 문 상 태</th>
                                                                            <td>
                                                                            	<input class="text__block" type="text" name="Orders_Status" id="Orders_Status" value="" readonly> <%-- ${order.getOrders_Status()} --%>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>주 소</th>
                                                                            <td colspan="4">
                                                                            	<input class="text__block" type="text" value="${user.getAddress()}" readonly>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>메 모</th>
                                                                            <td colspan="4">
                                                                                <div class="s_Cont">
                                                                                    <textarea class="text__block" rows="3" cols="50" name="Orders_Memo" id="Orders_Memo">${order.getOrders_Memo()}</textarea>
                                                                                    <!-- <input class="text__block" type="text" name="s_Cont" id="s_Cont"> -->
                                                                                </div>

                                                                        </tr>

                                                                    </tbody>



                                                                </table>
                                                            </div>

                                                            <div class="basic_submit_zone">
                                                                <input class="btn submitbtn updatebtn" type="submit"
                                                                    value="수정">
                                                                <button class="btn submitbtn deletebtn" type="button"
                                                                    onclick="window.location.href='orderDelete.admin?odId=${order.getOrders_ID()}';">삭제</button>
                                                                <button class="btn submitbtn listbtn" type="button"
                                                                    onclick="window.location.href='list.order';">목록</button>
                                                            </div>
                                                        </form>
                                                        <br>
                                                        <br>



                                                        <!-- 옵션 정보를 표시하는 테이블 -->


                                                        <div class="option_table">
                                                            <div class="option input__block">
                                                                <!-- 옵션 수정 폼의 form 태그 시작 -->
                                                                <table class="table optionTable" id="dataTable"
                                                                    width="100%" cellspacing="0">
                                                                    <colgroup>
                                                                        <col width="12%">
                                                                        <col>
                                                                        <col width="12%">
                                                                        <col width="12%">
                                                                    </colgroup>
                                                                    <tr>
                                                                        <th class="headth">제 품 사 진</th>
                                                                        <th class="headth">옵 션 이 름</th>
                                                                        <th class="headth">등 급</th>
                                                                        <th class="headth">구 매 수 량</th>
                                                                    </tr>
                                                                    <tbody>
                                                                        <c:forEach items="${options}" var="option">
                                                                            <tr>
                                                                                <td style="padding: 0;">
                                                                                    <div class="thumnail">
                                                                                        <img
                                                                                            src="${option.getOption_Img()}">
                                                                                    </div>
                                                                                </td>

                                                                                <td><input class="text__block"
                                                                                        type="text" name="option_name"
                                                                                        id="option_name"
                                                                                        value="${option.getOption_Name()}">
                                                                                </td>
                                                                                <td><input class="text__block"
                                                                                        type="text" name="option_Img"
                                                                                        id="option_Img"
                                                                                        value="${option.getOption_Grade()}">
                                                                                <td><input class="text__block"
                                                                                        type="text" name="option_Qty"
                                                                                        id="option_Qty"
                                                                                        value="${option.getOrder_Qty()}">
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.container-fluid -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End of Main Content -->
                                <!-- Footer -->
                                <%@ include file="/WEB-INF/adminView/layout/footer.jsp" %>
                                    <!-- End of Footer -->
                        </div>
                    </div>

            </div>
            <!-- End of Content Wrapper -->

            <!-- End of Page Wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
            <script src="js/insertSale.js"></script>
            <%@ include file="/WEB-INF/adminView/layout/logoutModel.jsp" %>

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