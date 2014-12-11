<!-- https://jstl.java.net/ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Includes -->
<%@page import="com.ipartek.formacion.helloweb.comun.Utils"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Message"%>
<%@page import="com.ipartek.formacion.helloweb.temp.UtilsTemp"%>
<%@page import="com.ipartek.formacion.helloweb.bean.Persona"%>
<%@page import="com.ipartek.formacion.helloweb.comun.Constantes"%>

<%@include file="frontoffice/includes/head.jsp" %>
	<%@include file="frontoffice/includes/nav.jsp" %>

<!-- url origen al login (vac�a si ha entrado directamente -->
	<c:set var="lastUrl" scope="page" value="${sessionScope.lasturl}"/>		
	
	<div class="col-md-12">
		<div class="col-xs-4 col-xs-offset-4">
				
			<c:if test="${isAuthenticated == false}">	
				<div class="row text-center" style="border: 1px solid; border-radius: 4px; margin-bottom: 20px; border-color: #428BCA; background-color: #428BCA; color: white;">			
					<h1><fmt:message key="login.page.title" /></h1>				
				</div>
			</c:if>
		
			<div class="row">
				<div class="panel panel-primary sombra ">
			    	<div class="panel-heading">
			      		<h3 class="panel-title">			      		
			      			<c:choose>
							  <c:when test="${isAuthenticated == false}">
							    <fmt:message key="login.page.form.title.insert" />
							  </c:when>
							  <c:when test="${isAuthenticated == true}">
							    <fmt:message key="login.page.form.title.wellcome" />
							  </c:when>							  
							</c:choose>			      					      		
			      		</h3>
			    	</div>			    	
			    	<div class="panel-body">
			    		<!-- Si no est� autentificado, mostramos el formulario de login -->			    	
						<c:if test="${isAuthenticated == false}">
							<form class="" role="form" method="post" id="frm_login" action="login">
								<div class="form-group form-group-install col-md-12">
									<label class="control-label" for="cont1"><fmt:message key="login.page.label.username" /> * </label>
									<input class="form-control" type="text" name="<%=Constantes.PARAMETRO_USER%>" id="cont1" value="" required="required" 
									placeholder="<fmt:message key="login.page.placeholder.username" />">
								</div>
									
								<div class="form-group form-group-install col-md-12">
									<label class="control-label" for="cont2"><fmt:message key="login.page.label.password" /> * </label>
									<input class="form-control" type="password" name="<%=Constantes.PARAMETRO_PASSWORD%>" id="cont2" required="required" 
									placeholder="<fmt:message key="login.page.placeholder.password" />">
								</div>
								
								<!-- Path de referencia para redirigir -->
								<input type="hidden" name="<%=Constantes.PARAM_URL_TO%>" value="${lastUrl}">
								
								<div class="col-xs-12 text-right">
										<input form="frm_login" class="btn btn-success btn-lg" 
											type="submit" name="save" 
											title="Save" 
											value="<fmt:message key="login.page.button.login" />" />				  		
								</div>						
							</form>	
						</c:if>
						
						<!-- Si est� autentificado, mostramos la ficha del usuario -->
						<c:if test="${isAuthenticated == true}">
							<div class="row">
								<ul>
									<li> Home Page </li>
									<li> Panel de usuario </li>										
									<c:if test="${isAuthenticated == true}">
										<c:if test="${sessionScope.user_session.idRol == 2}">
											<li>
												<a href='<%=Constantes.JSP_BACK_ADMIN %>' title='Administracion'>
													<fmt:message key="page.admin" />
												</a>
											</li>										
										</c:if>	
									</c:if>																
								</ul>
							</div>
							<div class="row">
								<form class="" role="form" method="post" id="frm_login" action="logout">
									<!-- Path de referencia para redirigir (actualmente decidimos index) -->
									<input type="hidden" name="<%=Constantes.PARAM_URL_TO%>" value="<%= Constantes.JSP_INDEX %>">
									
									<!-- Invalidamos la sesi�n, no borramos los datos nada m�s -->
									<input type="hidden" name="<%=Constantes.PARAM_SESSION_INVALIDATE%>" value="true">
									
									<div class="col-xs-12 text-right">
											<input form="frm_login" class="btn btn-active btn-lg" 
												type="submit" name="save" 
												title="Logo out" 
												value="<fmt:message key="login.page.button.logout" />" />				  		
									</div>														
								</form>
							</div>
						</c:if>
										
						<!-- http://silviomoreto.github.io/bootstrap-select/ 
						<div class="col-md-12">															
							<form role="form" method="post">
								<label class="control-label" for="language">
									<fmt:message key="login.label.combolang" >
										<fmt:param value="prueba" />
									</fmt:message>
								</label>							
								<select class="form-control" id="language" name="language" onchange="submit()">		                      			            		
			            			<option value="es_ES" ${language == 'es_ES' ? 'selected' : ''}>Espa�ol</option>             
			            			<option value="en_GB" ${language == 'en_GB' ? 'selected' : ''}>English</option>										
			            			<option value="es_EU" ${language == 'es_EU' ? 'selected' : ''}>Euskera</option>										
								</select>	
							</form>									
						</div>		
						-->						
					</div> <!--  panel-body -->				
				</div> <!-- fin panel primary -->
			
				<!-- Mostramos el error si hay  -->						
				<c:if test="${requestScope.isError.error == true}">
					<div class="alert alert-${requestScope.isError.type}" role="alert">
						Alerta: ${requestScope.isError.text}
					</div>			
				</c:if>			
			</div>
		</div>
	</div> <!-- clas container -->
	
	<% 
	if (request.getAttribute(Constantes.ATTR_LOGOUT_ACTION) != null) {
			
	%>		
				<script>
				$(document).ready(function(){						
					lanzarToast();				
				});	
				
				function lanzarToast(){
					//http://codeseven.github.io/toastr/demo.html
					toastr.options = {
							  "closeButton": true,
							  "debug": false,
							  "progressBar": false,
							  "positionClass": "toast-bottom-right",
							  "onclick": null,
							  "showDuration": "200",
							  "hideDuration": "1000",
							  "timeOut": "3000",
							  "extendedTimeOut": "1000",
							  "showEasing": "swing",
							  "hideEasing": "linear",
							  "showMethod": "slideDown",
							  "hideMethod": "fadeOut"
							}
	
				// Display an info toast with no title
				toastr.info('<fmt:message key="login.button.logout" />');
									}
				</script>	
	<% 	
	} //fin condicion logout		
	%>
	
		
<%@include file="frontoffice/includes/footer.jsp" %>