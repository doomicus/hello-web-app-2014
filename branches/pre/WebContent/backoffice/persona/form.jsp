<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@page import="com.ipartek.formacion.helloweb.Constantes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
		//recoger attributo de Persona		
		Persona p = (Persona)request.getAttribute(Constantes.ATT_PERSONA);
		//inicializar variables para el formulario
		String cabecera = "Crear nueva Persona";
		String buttonValue = "Crear";
		String op = Constantes.OP_UPDATE;
		boolean isNew = false;
		
		//nueva persona				
		if ( p == null ){
			p = new Persona("");
			isNew = true;
			op = Constantes.OP_CREATE;
		//modificar persona	
		}else{
			cabecera = "Modificar " + p.getNombre();
			buttonValue = "Modificar";
		}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Persona</title>
</head>
<body>

	<%@include file="/includes/alerts.jsp" %>

	<h1><%=cabecera%></h1>
	<h2><a href="<%=request.getContextPath()+"/"+Constantes.CONTROLLER_PERSONA%>">volver</a></h2>
	
	<form action="<%=request.getContextPath()+"/"+Constantes.CONTROLLER_PERSONA%>" method="post">
	
		<input type="text"    name="id" disabled value="<%=p.getId()%>">
		<br>		
		<input type="text"    name="name" value="<%=p.getNombre()%>">
		<br>
		<input type="number" name="edad" value="<%=p.getEdad()%>">
		<br>
		<input type="text"    name="rol" disabled value="<%=p.getRol()%>">
		<br>		
		<input type="hidden" name="<%=Constantes.OP_KEY%>" value="<%=op%>">	
		
		<input type="submit" value="<%=buttonValue%>" >	
	
	</form>
	
	<% if ( !isNew) { %>	
		<form action="<%=request.getContextPath()+"/"+Constantes.CONTROLLER_PERSONA%>" method="delete">
			<input type="hidden"    name="id"  value="<%=p.getId()%>">
			<input type="hidden" name="<%=Constantes.OP_KEY%>" value="<%=Constantes.OP_DELETE%>">
			<input type="submit" value="Eliminar" >	
		</form>
	<% } %>	

</body>
</html>










