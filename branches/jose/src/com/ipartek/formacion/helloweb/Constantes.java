package com.ipartek.formacion.helloweb;

public class Constantes {
	// Seguridad
	public static final String USER_SESSION = "user_session";
	public static final String USER_ADMIN_NAME = "admin";
	public static final String USER_ADMIN_PASS = "admin";

	public static final String USER_USER_NAME = "user";
	public static final String USER_USER_PASS = "user";

	// Path para Servlets
	public static final String PATH_LOGIN = "login";
	public static final String PATH_LOGOUT = "logout";

	public static final String CONTROLLER_PERSONA = "Persona";

	// JSPs publicas
	public static final String JSP_SALUDO = "/saludo.jsp";
	public static final String JSP_LOGIN = "/login.jsp";

	// JSPs Backoffice
	public static final String JSP_BACKOFFICE = "backoffice/";
	public static final String JSP_BACK_INDEX = JSP_BACKOFFICE + "index.jsp";
	public static final String JSP_BACK_PERSONA_LIST = JSP_BACKOFFICE
			+ "persona/list.jsp";
	public static final String JSP_BACK_PERSONA_FORM = JSP_BACKOFFICE
			+ "persona/form.jsp";

	// Parametros
	public static final String PARAMETRO_USER = "user";
	public static final String PARAMETRO_PASS = "pass";

	// Mensajes
	public static final String MSG_KEY = "msg";
	public static final String MSG_LOGIN_INCORRECTO = "Usuario o contraseña incorrecta";
	public static final String MSG_LOGOUT = "Hasta la vista BABY, recuerda visitarnos!!!";

	public static final String MSG_REG_CREATE = "Registro Creado con exito";
	public static final String MSG_REG_DELETE = "Registro Eliminado con exito";
	public static final String MSG_REG_UPDATE = "Registro Modificado con exito";

	public static final String MSG_ERR_PARAMETERS = "Error recogiendo parametros";
	public static final String MSG_ERR_REG_DELETE = "Error al eliminar un registro";

	public static final String MSG_NOT_ALLOWED = "No tienes presmisos";

	// Atributos
	public static final String ATT_PERSONAS = "personas";
	public static final String ATT_PERSONA = "persona";

	// Operaciones CRUD
	public static final String OP_KEY = "op";
	public static final String OP_UPDATE = "0"; // Actualizar Registro
	public static final String OP_DELETE = "1"; // Eliminar Registro
	public static final String OP_LIST = "2"; // Listar todos los Registros
	public static final String OP_DETAIL = "3"; // Mostrar Detalle Registro
	public static final String OP_CREATE = "4"; // Crear o insertar Registro
}
