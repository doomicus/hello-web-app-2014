<%@page import="com.ipartek.formacion.helloweb.comun.Constantes"%>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Start Bootstrap</a>
            </div>
            
            <ul class="nav navbar-nav navbar-right">
            	<li id="nav-register-btn" class=""><a href="http://bootsnipp.com/register">Register</a></li>
       			<li id="nav-login-btn" class=""><a href="<%=Constantes.JSP_LOGIN %>"><i class="icon-login"></i>Login</a></li>
       			<li style="padding-top: 10px;">
       				<!-- Combo para el ididoma -->																				
					<form role="form" method="post">															
						<select class="form-control" id="language" name="language" onchange="submit()"
						style = "color: gray; background-color: black;">		                      			            		
	            			<option style="background-color: white;" value="es_ES" ${language == 'es_ES' ? 'selected' : ''}>Espa�ol</option>             
	            			<option style="background-color: white;" value="en_GB" ${language == 'en_GB' ? 'selected' : ''}>English</option>										
	            			<option style="background-color: white;" value="es_EU" ${language == 'es_EU' ? 'selected' : ''}>Euskera</option>										
						</select>	
					</form>						
       			</li>
         	</ul>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	<li>
                        <a href="<%=Constantes.PATH_SITE %>blog.jsp">Blog</a>
                    </li>
                    <li>
                    	<a href="<%=Constantes.PATH_SITE %>snippets.jsp">Snippets</a>
                    </li>
                    <li>
                        <a href="<%=Constantes.PATH_SITE %>pruebas.jsp">Pruebas</a>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            
            
        </div>
        <!-- /.container -->
    </nav>

<!-- Page Content -->
    <div class="container">
    	<div class="row">