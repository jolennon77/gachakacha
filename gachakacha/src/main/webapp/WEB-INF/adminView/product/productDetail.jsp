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

    <title>재고 정보</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	
    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/addOption2.js"></script>
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
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">상품 등록</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
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

                                <form action="update.product" method="post">
                                    <input type="hidden" name="pId" value="${product.getProduct_Id()}">
                                    <div class="mainProduct input__block">
                                        <table class="table table-bordered mainProductTable table-input" id="dataTable"
                                               width="100%" cellspacing="0">
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
                                                               ${product.getProduct_Type() eq 'K' ? 'checked' : ''}>&nbsp;쿠지&nbsp;
                                                        <input type="radio" name="p_Type" id="p_Type" value="G"
                                                               ${product.getProduct_Type() eq 'G' ? 'checked' : ''}>&nbsp;가챠&nbsp;
                                                    </div>
                                                </td>

                                                <th>제품 카테고리</th>

                                                <td>
                                                    <div class="select__block">
                                                        <select class="select__block" name="p_Cat" id="p_Cat" required>
                                                            <option value="동물 피규어" ${product.getProduct_Cat() eq
                                                            '동물 피규어' ? 'selected' : ''}>동물 피규어</option>
                                                            <option value="미니어쳐 소품" ${product.getProduct_Cat() eq
                                                            '미니어쳐 소품' ? 'selected' : ''}>미니어쳐 소품</option>
                                                            <option value="인형 / 인형소품" ${product.getProduct_Cat() eq
                                                            '인형 / 인형소품' ? 'selected' : ''}>인형 / 인형소품</option>
                                                            <option value="디즈니"
                                                                    ${product.getProduct_Cat() eq
                                                            '디즈니' ? 'selected' : ''}>디즈니</option>
                                                            <option value="산리오"
                                                                    ${product.getProduct_Cat() eq
                                                            '산리오' ? 'selected' : ''}>산리오</option>
                                                            <option value="치이카와"
                                                                    ${product.getProduct_Cat() eq
                                                            '치이카와' ? 'selected' : ''}>치이카와</option>
                                                            <option value="오빤쮸우사기"
                                                                    ${product.getProduct_Cat() eq
                                                            '오빤쮸우사기' ? 'selected' : ''}>오빤쮸우사기</option>
                                                            <option value="명탐정 코난"
                                                                    ${product.getProduct_Cat() eq
                                                            '명탐정 코난' ? 'selected' : ''}>명탐정
                                                            코난</option>
                                                            <option value="귀멸의 칼날"
                                                                    ${product.getProduct_Cat() eq
                                                            '귀멸의 칼날' ? 'selected' : ''}>귀멸의
                                                            칼날</option>
                                                            <option value="주술회전"
                                                                    ${product.getProduct_Cat() eq
                                                            '주술회전' ? 'selected' : ''}>주술회전</option>
                                                            <option value="체인소맨"
                                                                    ${product.getProduct_Cat() eq
                                                            '주술회전' ? 'selected' : ''}>체인소맨</option>
                                                            <option value="도쿄 리벤저스"
                                                                    ${product.getProduct_Cat() eq
                                                            '도쿄 리벤저스' ? 'selected' : ''}>도쿄
                                                            리벤저스</option>
                                                            <option value="하이큐"
                                                                    ${product.getProduct_Cat() eq
                                                            '하이큐' ? 'selected' : ''}>하이큐</option>
                                                            <option value="포켓몬스터"
                                                                    ${product.getProduct_Cat() eq
                                                            '포켓몬스터' ? 'selected' : ''}>포켓몬스터</option>
                                                            <option value="별의 커비"
                                                                    ${product.getProduct_Cat() eq
                                                            '별의 커비' ? 'selected' : ''}>별의
                                                            커비</option>
                                                            <option value="스누피"
                                                                    ${product.getProduct_Cat() eq
                                                            '스누피' ? 'selected' : ''}>스누피</option>
                                                            <option value="짱구는못말려"
                                                                    ${product.getProduct_Cat() eq
                                                            '짱구는못말려' ? 'selected' : ''}>짱구는못말려</option>
                                                            <option value="세일러문"
                                                                    ${product.getProduct_Cat() eq
                                                            '세일러문' ? 'selected' : ''}>세일러문</option>
                                                            <option value="카드캡터 체리"
                                                                    ${product.getProduct_Cat() eq
                                                            '카드캡터 체리' ? 'selected' : ''}>카드캡터
                                                            체리</option>
                                                            <option value="꼬마마법사 레미"
                                                                    ${product.getProduct_Cat() eq
                                                            '꼬마마법사 레미' ? 'selected' : ''}>꼬마마법사
                                                            레미</option>
                                                            <option value="프리큐어"
                                                                    ${product.getProduct_Cat() eq
                                                            '프리큐어' ? 'selected' : ''}>프리큐어</option>
                                                            <option value="그 외"
                                                                    ${product.getProduct_Cat() eq
                                                            '그 외' ? 'selected' : ''}>그
                                                            외</option>

                                                        </select></div>
                                                </td>

                                            </tr>
                                            <tr>
                                            </tr>
                                            <tr>
                                                <th>제품명</th>
                                                <!-- 대표 제품명 입력 필드 -->
                                                <td><input class="text__block" type="text" name="p_Name" id="p_Name"
                                                           placeholder="예) 치이카와 천사 악마 쿠지!" required
                                                           value="${product.getProduct_Name()}"></td>
                                                <th>제품가격</th>
                                                <!-- 제품 이미지 URL 입력 필드 -->
                                                <td><input class="text__block" type="text" name="p_Price" id="p_Price"
                                                           placeholder="예) 15000" required
                                                           value="${product.getProduct_Price()}"></td>
                                            </tr>
                                            <tr>
                                                <th>제품 이미지URL</th>
                                                <!-- 제품 이미지 URL 입력 필드 -->
                                                <td colspan="4">
                                                    <input class="text__block" type="text" name="p_Img" id="p_Img"
                                                           placeholder="예) www.img.jpg"
                                                           value="${product.getProduct_Img()}">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>제품 설명</th>
                                                <!-- 제품 이미지 URL 입력 필드 -->

                                                <td colspan="4">
                                                    <input class="text__block" type="text" name="p_Con" id="p_Con"
                                                           placeholder="제품설명" value="${product.getProduct_Con()}">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="basic_submit_zone" >
                                    <input class="btn submitbtn updatebtn" type="submit" value="수정">
                                    <button class="btn submitbtn deletebtn" type="button" onclick="window.location.href='delete.product?pId=${product.getProduct_Id()}';">삭제</button>
                                    <button class="btn submitbtn listbtn" type="button" onclick="window.location.href='list.product';">목록</button>
                                    </div>
                                </form>
                                <br>


                                <!-- 옵션 정보를 표시하는 테이블 -->
                                <div class="option_table">
                                    <div class="subtitlebox">
                                        <div class="basic_submit_zone" >
                                          <h1 class="h3 mb-0 text-gray-800 subtitle" >옵션 정보</h1>
                                            <button class="btn submitbtn updatebtn" id="minibtnOp" type="button" onclick="openOptionPage(${product.getProduct_Id()});">옵션 추가</button>
                                        </div>
                                    </div>
                                    <div class="option input__block">
                                        <!-- 옵션 수정 폼의 form 태그 시작 -->
                                        <table class="table optionTable" id="dataTable" width="100%" cellspacing="0">
                                            <colgroup>
                                                <col width="7%">
                                                <col width="8%">
                                                <col>
                                                <col width="30%">
                                                <col width="5%">
                                                <col width="7%">
                                                <col width="7%">
                                            </colgroup>
                                            <tr>
                                                <th class="headth">제품ID</th>
                                                <th class="headth">이미지</th>
                                                <th class="headth">옵션명</th>
                                                <th class="headth">이미지 URL</th>
                                                <th class="headth">등급</th>
                                                <th class="headth">재고</th>
                                                <th class="headth">수정 / 삭제</th>
                                            </tr>
                                            <tbody>
                                            <c:forEach items="${optionList}" var="option">
                                                <form action="update.option" method="post" name="option_update_form">

                                                    <tr>
                                                        <td>${option.getOption_ID()}</td>
                                                        <td style="padding: 0;">
                                                            <div class="thumnail">
                                                                <img src="${option.getOption_Img()}">
                                                            </div>
                                                        </td>
                                                        <td><input class="text__block" type="text" name="option_name"
                                                                   id="option_name" value="${option.getOption_Name()}">
                                                        </td>
                                                        <td><input class="text__block" type="text" name="option_Img"
                                                                   id="option_Img" value="${option.getOption_Img()}">
                                                        </td>
                                                        <td>
                                                            <div class="select__block">
                                                                <select class="option-select" name="option_Grade" id="option_Grade">
                                                                    <option value="A" ${option.getOption_Grade() eq 'A' ? 'selected' : ''}>A</option>
                                                                    
                                                                    
                                                                    <option value="B" ${option.getOption_Grade() eq
                                                                    'B' ? 'selected' : ''}>B</option>
                                                                    <option value="C" ${option.getOption_Grade() eq
                                                                    'C' ? 'selected' : ''}>C</option>
                                                                    <option value="D" ${option.getOption_Grade() eq
                                                                    'D' ? 'selected' : ''}>D</option>
                                                                    <option value="E" ${option.getOption_Grade() eq
                                                                    'E' ? 'selected' : ''}>E</option>
                                                                    <option value="F" ${option.getOption_Grade() eq
                                                                    'F' ? 'selected' : ''}>F</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td><input class="text__block" type="text" name="option_Qty"
                                                                   id="option_Qty" value="${option.getOption_Qty()}">
                                                        </td>
                                                        <td>
                                                      <div class="btn_wrap">
                                                            <!-- 수정 폼 -->
						                                    <input class="btn submitbtn updatebtn" id="minibtn" type="submit" value="수정" style="background-color: #1c597f;">
						                                    <input type="hidden" name="pId" value="${option.getProduct_ID()}">
						                                    <input type="hidden" name="oId" value="${option.getOption_ID()}">
						                                    
						                                    
						                                    <button class="btn submitbtn deletebtn" id="minibtn" type="button" onclick="window.location.href='delete.option?oId=${option.getOption_ID()}&pId=${option.getProduct_ID()}';" >삭제</button>
                                                        </div>
                                                        </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.container-fluid -->

                            </div>
                        </div>
                    </div>


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