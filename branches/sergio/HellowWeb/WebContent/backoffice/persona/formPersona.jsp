<%@page import="com.ipartek.formacion.helloweb.bean.CargasTemporales"%>
<%@page import="com.ipartek.formacion.helloweb.comun.Constantes.EModeloAccion"%>
<%@page import="com.ipartek.formacion.helloweb.temp.UtilsTemp"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Roles"%>
<%@page import="com.ipartek.formacion.helloweb.comun.Constantes"%>




<%@include file="/backoffice/includes/head.jsp" %>       
		<%@include file="/backoffice/includes/nav.jsp" %>





<% //*********************************************** Variables
	//default values
	String id = String.valueOf(Persona.ID_NULL);
	String nombre = "";
	String edad = String.valueOf(Persona.EDAD_NULL);
	String role = String.valueOf(Persona.ROL_NULL);	
	
	//por defecto, el tipo de acci�n es crear
	EModeloAccion accion = null;
	
%>

	<!-- breadcrum independiente de la entrada en la p�gina -->
	<nav>
		<!-- Insert breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="<%=Constantes.JSP_BACK_ADMIN%>">Administracion</a></li>
			<li><a href="<%=Constantes.JSP_BACK_PERSONA_LIST%>">Listado Personas</a></li>
			<li>Formulario Persona</li>
		</ol>
	</nav>


<%
	out.print(request.getRequestURL().toString());

	//*********************************************** Obtenci�n del path y creaci�n de session si no existe
	//obtenemos el actual path
	String path = request.getRequestURL().toString();
	
	//creamos una session an�nima
	if(session == null) {
		session = request.getSession(true);
	}
	
	//a�adimos el �ltimo path visitado
	session.setAttribute(Constantes.ATTR_SESSION_LAST_URL, path);
	//*********************************************** FIN Obtenci�n del path y creaci�n de session si no existe
%>


<%
	//********************************************** Logica de entrada
	
	//ORIGEN: nos ha llegado la persona por el servlet (en una lista)
	if (request.getAttribute(Constantes.ATTR_PERSONAS_LIST) != null) {
		
		//obtenemos la persona
		List<Persona> personas = (List<Persona>)request.getAttribute(Constantes.ATTR_PERSONAS_LIST);
		
		//si existe la cargamos
		if(personas != null && personas.size() > 0) {		
	//inicializamos los datos con los datos de la persona
	id = String.valueOf(personas.get(0).getId());		
	nombre = personas.get(0).getNombre();
	edad = String.valueOf(personas.get(0).getEdad());
	role = String.valueOf(personas.get(0).getRol());
	
	//se trata de una actualizaci�n
	accion = EModeloAccion.UPDATE;
		}
		
	} else	if (request.getParameter(Constantes.PARAM_PERSONAS_ID) != null) {
		//ORIGEN: nos ha llegado por post un par�metro de identificador
		//solicitamos al servlet que nos mande la informaci�n del usuario
		//llamamos para que nos cargue persona
		
		//TODO �Necesario?
%> 
			<!--  
				<form id="get_from_id" action="<%=Constantes.PATH_SITE +  Constantes.CONTROLLER_PERSONA%>" method="post">
						<input type='hidden' value='<%=request.getParameter(Constantes.PARAM_PERSONAS_ID)%>' name='<%=Constantes.PARAM_PERSONAS_ID%>' />						
				</form>
				<script>
				$( "#get_from_id" ).ready(function() {
					  $( "#get_from_id" ).submit();
				});
				</script>
			-->
			<%
				} else {
					//ORIGEN: ninguno. Para crear una nueva persona
					accion = EModeloAccion.INSERT;
				}
			%>
	
	<div class="container row-centered">		
		<div class="col-xs-4 col-centered">
			<div class="row">
				<div class="panel panel-primary sombra ">
			    	<div class="panel-heading">
			      		<h3 class="panel-title">
			      			<%
			      				if (accion == EModeloAccion.UPDATE) {
			      									out.print("Actualizar la persona");
			      								} else {
			      									out.print("Crear nueva persona");
			      								}
			      			%>
			      		</h3>
			    	</div>
			    	<div class="panel-body">		
			    	
						<form class="" role="form" method="post" id="frm_personas" action="<%=Constantes.PATH_SITE +  Constantes.CONTROLLER_PERSONA%>">
							<%
								if (accion.equals(EModeloAccion.UPDATE)) 
												{
							%>
								<div class="form-group form-group-install col-md-12">
								<label class="control-label" for="cont1">Id</label>
								<input class="form-control" type="text" name="<%=Constantes.PARAM_PERSONAS_ID%>" id="cont1" 
									value="<%=id%>" 
								 	placeholder="" readonly="readonly">
								</div>
							<%
								}
							%>
							
						
							<div class="form-group form-group-install col-md-12">
								<label class="control-label" for="cont2">Nombre</label>
								<input class="form-control" type="text" name="<%=Constantes.PARAM_PERSONAS_NOMBRE%>" id="cont2" 
								value="<%=nombre%>" 
								required="required" placeholder="Enter the username">
							</div>
							
							<div class="form-group form-group-install col-md-12">
								<label class="control-label" for="cont3">Edad</label>
								<input class="form-control" type="numeric" name="<%=Constantes.PARAM_PERSONAS_EDAD%>" id="cont3"
								value="<%=edad%>"
								required="required" placeholder="">
							</div>
							
							<div class="form-group form-group-install col-md-12">
							
								<label class="control-label" for="cont4">Rol</label>
								<%
									if (accion == EModeloAccion.UPDATE) {
																out.print(UtilsTemp.getComboRoles(CargasTemporales.getListRoles(), role));
															} else {
																out.print(UtilsTemp.getComboRoles(CargasTemporales.getListRoles(), role));
															}
								%>
								
								
							</div>
							
							<!-- Path de referencia para redirigir -->
							<input type="hidden" name="<%=Constantes.ATTR_SESSION_LAST_URL%>" value="<%=path%>">
							<!-- Acci�n a realizar -->
							<input type='hidden' value='<%=accion.getValue()%>' name='<%=Constantes.PARAM_ACTION%>' />
							
							<div class="col-xs-12 text-right">
									<input form="frm_personas" class="btn btn-success btn-lg" 
										type="submit" name="save" value="Guardar" 
										title="Guardar" />				  		
							</div>						
						</form>	
					</div> <!--  panel-body -->				
				</div>
			</div>
		</div>
	</div>
	
	
<%@include file="/backoffice/includes/footer.jsp" %>