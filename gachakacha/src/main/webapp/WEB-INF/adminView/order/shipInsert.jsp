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

    <title>운송장입력</title>

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

<body>
    <div class="container-fluid">
        <form action=updateShip.order method="post">
            <div class="d-sm-flex align-items-center justify-content-between optionPopUp"> <!-- mb-4 삭제-->
                <h1 class="h3 mb-0 text-gray-800">주문번호 : ${order.getOrders_ID()}</h1>
                
            </div>
            <div class="container-fluid">
                <div class="card shadow mb-4">
                    <!-- <div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">DataTables
									Example</h6>
							</div> -->
                    <div class="card-body">
                    <div class="option input__block">
                        <!-- <table class="optionTable" border="1"> -->
                        <table class="table optionTable" id="dataTable" style="width: 100%;" cellspacing="0">
                            <!-- <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"> -->
                            <colgroup>
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>운송장 번호 입력</th>
                                </tr>

                                <!-- 옵션 테이블 데이터 -->
                                <tr>
                                    <td>
                                        <input class="text__block" type="text" name="Ship_Number" id="Ship_Number"
                                            placeholder="예) 123456789" required>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </div>
                              <div class="basic_submit_zone" >
                    <input class="btn submitbtn updatebtn" type="submit" value="등록">
                    <input type="hidden" name="odId" value="${order.getOrders_ID()}">
                    <button class="btn submitbtn listbtn" type="button" onclick="closeWindow()">닫기</button>
                </div>
    </form>
    </div>

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
        function closeWindow() {
            window.close();
        }
    </script>
</body>

</html>
	