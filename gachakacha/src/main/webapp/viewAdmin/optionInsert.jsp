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

<body>
    <div class="container-fluid">
        <form action="optinInsert.admin" method="post">
            <div class="d-sm-flex align-items-center justify-content-between optionPopUp"> <!-- mb-4 삭제-->
                <h1 class="h3 mb-0 text-gray-800">옵션 추가</h1>
                <div class="optionAddBtn">
                    <input class="btn submitbtn" type="submit" value="추가">
                    <input type="hidden" name="pId" value="${product.getProduct_Id()}">
                    <!-- <input class="btn submitbtn" type="submit" value="추가"> -->
                </div>
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
                                        <input class="text__block" type="text" name="o_Name[]" id="o_Name[]"
                                            placeholder="예) 치이카와 피규어" required>
                                    </td>
                                    <td>
                                        <input class="text__block" type="text" name="o_ID[]" id="o_ID[]"
                                            placeholder="자동생성" readonly="readonly">
                                    </td>
                                    <td>
                                        <div class="select__block">
                                            <select class="option-select" name="o_Grade[]" id="o_Grade[]"
                                                style="width: 100%" required>
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
                                        <input class="text__block" type="text" name="o_Img[]" id="o_Img[]"
                                            placeholder="예) www.img.jpg">
                                    </td>
                                    <td>
                                        <input class="text__block" type="text" name="o_Qty[]" id="o_Qty[]"
                                            placeholder="예) 1" required>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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

</body>

</html>

