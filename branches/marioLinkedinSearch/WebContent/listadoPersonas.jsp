<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1> LISTADO DE LAS PERSONAS EN LA BD</h1>
	${requestScope.personas}
	<br>
	<br>
	<a href="index.jsp">Volver a la búsqueda</a>
 
</body>
</html>