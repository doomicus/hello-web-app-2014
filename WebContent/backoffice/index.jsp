<%@page import="com.ipartek.formacion.helloweb.constantes.Constantes"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Backoffice</title>
</head>
<body>
	<%
		Persona p = (Persona) session.getAttribute(Constantes.USER_SESSION);
		if (p == null || p.getNombre()!=Constantes.USER) {
			p = new Persona("anonimo", 99);
			String root = request.getSession().getServletContext().getRealPath("/");
			response.sendRedirect(root + Constantes.JSP_LOGIN);
		}
	%>

	<h1>Backoffice</h1>
</body>
</html>