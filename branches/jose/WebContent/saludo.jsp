<%@page import="java.util.Enumeration"%>
<%@page import="com.sun.jmx.snmp.Enumerated"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@page import="com.ipartek.formacion.helloweb.Constantes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Saludo</title>
</head>
<body>
	<%
		// recuperar usuario de session
		Persona p = (Persona)session.getAttribute(Constantes.USER_SESSION);
		if (p == null){
			p = new Persona("anonimo", 99);
			response.setStatus(response.SC_UNAUTHORIZED);
			//String root = request.getSession().getServletContext().getRealPath("/");
			//String root = request.getContextPath();
			String root = request.getHeader("referer");
			
			response.sendRedirect(root + Constantes.JSP_LOGIN);
		}
	%>
	
	<h1>Ongi Etorri <%=p.getNombre()%></h1>
	<a href="<%=Constantes.PATH_LOGOUT%>" title="Cierra tu session">[x] Cerrar Session</a>
	
	<h1>Request Info</h1>
	<ol>
		<li>Method: <b><%=request.getMethod()%></b></li>
		<li>Request URI: <b><%=request.getRequestURI()%></b></li>
		<li>Request URL: <b><%=request.getRequestURL()%></b></li>
		<li>Context Path: <b><%=request.getContextPath() %></b></li>
		<li>Protocol: <b><%=request.getProtocol()%></b></li>
		<li>ServerName: <b><%=request.getServerName() %></b></li>
		<li>ServerPort: <b><%=request.getServerPort() %></b></li>
	</ol>
	
	<h1>Request Header</h1>
	<ol>
		<%
		Enumeration e = request.getHeaderNames();
		while(e.hasMoreElements()){
			String key=(String)e.nextElement();
			String value = request.getHeader(key);
			out.println("<li>"+key+": <b>"+value+"</b></li>");
		}
		%>
	</ol>
	
	<h1>Request Parameters</h1>
	<ol>
		<%
		Enumeration ep = request.getParameterNames();
		while(ep.hasMoreElements()){
			String key=(String)ep.nextElement();
			String value = request.getParameter(key);
			out.println("<li>"+key+": <b>"+value+"</b></li>");
		}
		%>	
	</ol>

	<h1>Request Atributes</h1>
	<ol>
		<%
		Enumeration ea = request.getAttributeNames();
		while(ea.hasMoreElements()){
			String key=(String)ea.nextElement();
			String value = (String)request.getAttribute(key);
			out.println("<li>"+key+": <b>"+value+"</b></li>");
		}
		%>	
	</ol>

	<h1>Request Parameters</h1>
	<ol>
	
	</ol>
</body>
</html>