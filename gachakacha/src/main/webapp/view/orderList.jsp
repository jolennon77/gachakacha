<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<!-- CSS 파일 링크 -->
<link href="./css/admin/reset.css" rel="stylesheet" />
<link href="./css/admin/layout.css" rel="stylesheet" />
<link href="./css/admin/product.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<style>
.update {
    width: 80px;
}

.del_AButton {
    padding: 3px 10px;
}

.update_AButton {
    padding: 3px 10px;
}
</style>

</head>
<body>
<section class="container">
<div class="layout">
	 <%@ include file="/viewAdmin/sidebar.jsp"%>
    <!-- sidebar.jsp 파일을 include 합니다. -->
    <article>
             <%@ include file="/viewAdmin/title.jsp"%>
            <!-- title.jsp 파일을 include 합니다. -->
            <div class="content">
               <section class="subtitle">
                  <div class=subtitlebox>
    <h1>주문 관리</h1>
    </div>
    <table border="1">
    <tr>
    	
    	<th class="headth">주문 번호</th>
    	<th class="headth">User_ID</th>
    	<th class="headth">상품 번호</th>
    	<th class="headth">주문 일자</th>  
    	<th class="headth">결제 상태</th>  
    	<th class="headth">운송 번호</th>  
    	<th class="headth">수정/삭제</th>  
    </tr>
    
    <%-- 자료 넣기 --%>
    <c:forEach items="${orderAll}" var="od">
    <tr>
    <td>${od.getOrder_Id()}</td>
    <td>${od.getUser_Id()}</td>
    <td>${od.getProduct_ID()}</td>
    <td>${od.getOrder_Date()}</td>
    <td>${od.getOrders_Status()}</td>
    <td>${od.getShip_Number()}</td>
    
    <td>
	<a href="getODetail.admin?odId=${od.getOrder_Id()}">상세 페이지</a>
     	  </td>
     	 </tr>
    	</c:forEach>        
       </table>
      </section>
	 </div>
	</article>
   </div> 
  </section>
 </body>
</html>