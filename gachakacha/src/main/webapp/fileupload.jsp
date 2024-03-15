<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="fileuploadProcess.jsp" method="post" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br>
	제목 : <input type="text" name="subject"><br>
	파일 : <input type="file" name="filename"><br>
	
	이름 : <input type="submit" value="파일 업로드"><br>
	



</form>



</body>
</html>