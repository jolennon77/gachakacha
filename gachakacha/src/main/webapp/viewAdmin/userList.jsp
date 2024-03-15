<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
         <%@ include file="sidebar.jsp"%>
         <!-- sidebar.jsp 파일을 include 합니다. -->
         <article>
            <%@ include file="title.jsp"%>
            <!-- title.jsp 파일을 include 합니다. -->
            <div class="content">
               <section class="subtitle">
                  <div class=subtitlebox>
                     <h1>회원 목록</h1>
                  </div>
   <table border="1">
      <tr>
         <th class="headth">이메일</th>
         <th class="headth">이름</th>
         <th class="headth">전화번호</th>
         <th class="headth">성별</th>
         <th class="headth">생일</th>
         <th class="headth">가입일자</th>
         <th class="headth">권한</th>
         <th class="headth">수정/삭제</th>
      </tr>
      <%-- 자료 넣기 --%>
      <c:forEach items="${userAll}" var="u">
         <tr>
            <td>${u.getEmail()}</td>
            <td>${u.getName()}</td>
            <td>${u.getPhone()}</td>
            <td>${u.getGender()}</td>
            <td>${u.getBirth()}</td>
            <%-- <td>${u.getZonecode()}</td>
            <td>${u.getAddress()}</td> --%>
            <td>${u.getsingupDate()}</td>
            <td>${u.getAut()}</td>
            
            <td>
            <span class="update_AButton" style="margin:3px 0">
            <a href="getUDetail.admin?uId=${u.getId()}">상세보기</a>
            </span>
            
<%--             <span class="del_AButton">
               <a href="userDelete.admin?uId=${u.getId()}">삭제</a>
            </span>
 --%>            </td>
         </tr>
      </c:forEach>
      <%-- =for문 --%>
   </table>
</section>
            </div>
         </article>
      </div>
   </section>
</body>
</html>
