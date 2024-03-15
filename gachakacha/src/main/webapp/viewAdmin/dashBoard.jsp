
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 메인</title>
<link href="./css/admin/reset.css" rel="stylesheet" />
<link href="./css/admin/layout.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.content{
width:100%;
padding:0;
/* background-image: url("./img/fakedash.jpg");} */
}
.content img{
width: 100%;}
</style>
</head>
<body>
	<section class="container">
		<div class="layout">
			<%@ include file="sidebar.jsp"%>
			<article>
				<%@ include file="title.jsp"%>
				<div class="content" >
				
				 <img src="./img/fakedash.jpg" alt="">
				</div>
			</article>
		</div>
	</section>
</body>
</html>