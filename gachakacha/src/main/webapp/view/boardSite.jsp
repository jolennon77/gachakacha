<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                     <h1>게시판</h1>
                  </div>
   <table border="1">
      <tr>
         <th class="headth">Info_Id</th>
         <th class="headth">회 원 아 이 디</th>
         <th class="headth">전화번호</th>
         <th class="headth">타 이 틀</th>
         <th class="headth">날 짜</th>
         <th class="headth">내 용</th>
         <th class="headth">이 미 지</th>
      
      </tr>
      <%-- 자료 넣기 --%>
      <c:forEach items="${InfoAll}" var="i">
         <tr>
            <td>${i.getInfo_Id()}</td>
            <td>${i.getMember_ID()}</td>
            <td>${i.getInfo_Title()}</td>
            <td>${i.getInfo_Date()}</td>
            <td>${i.getInfo_Con()}</td>
            <td>${i.getInfo_Image()}</td>
            
            <td>
            <span class="update_AButton" style="margin:3px 0">
            <a href="getUDetail.admin?uId=${u.getId()}">상세보기</a>
            </span>
            
            </td>
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