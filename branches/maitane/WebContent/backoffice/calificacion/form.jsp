<%@page import="com.ipartek.formacion.helloweb.bean.Calificacion"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Persona.Rol"%>
<%@include file="/includes/head.jsp" %>
<%@include file="/includes/nav.jsp" %>

<%@ taglib prefix="util" uri="http://www.formacion.ipartek.com/tag/util"%>

<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@page import="com.ipartek.formacion.helloweb.Constantes"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	//recoger atributo persona
	Calificacion c=(Calificacion)request.getAttribute(Constantes.ATT_CALIFICACION);
    
    //inicializar variables para el formulario
    
    String buttonValue="Crear";
    String op=Constantes.OP_UPDATE;
    boolean isNew=false;
    
  //nueva persona
    if(c==null){
		//si la persona esta vacia, se crea una nueva
		c=new Calificacion();
		isNew=true;
		op=Constantes.OP_CREATE;
	}
	//modificar persona
	else{
		
		buttonValue="Modificar";
	}
	%>


	
	

		
	<form action="<%=request.getContextPath()+"/"+Constantes.CONTROLLER_CALIFICACION%>" method="post">
	
		
		<div class="form-group">
		<label>Id</label>
		<input type="text" name="id" readonly value="<%=c.getId()%>" class="form-control"> 
		</div>
		
		<div class="form-group">
		<label>Nota</label>
		<input type="text" name="nota" value="<%=c.getValor()%>"class="form-control">
		</div> 
		<div class="form-group">
		<label>Descripcion</label>
		<input type="numeric" name="descripcion" value="<%=c.getDescripcion()%>"class="form-control">
		</div>
		
	
		
		<input type="hidden" name="<%=Constantes.OP_KEY %>" value="<%=op%>">
		<input type="submit" class="btn btn-primary" value="<%= buttonValue%>"> 
		
	</form>
	
	<% if(!isNew){ %>
	
	
	<form action="<%=request.getContextPath()+"/"+Constantes.CONTROLLER_CALIFICACION%>" method="post">
		<input type="hidden" name="id" disabled value="<%=c.getId()%>"> 		
		<input type="hidden" name="<%=Constantes.OP_KEY %>" value="<%=Constantes.OP_DELETE%>">
		<input type="submit" class="btn btn-danger" value="borrar"> 
	</form>
	<%}%>
<%@include file="/includes/footer.jsp" %>