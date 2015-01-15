package com.ipartek.formacion.busredsociales.comun;

import com.ipartek.formacion.busredsociales.dao.factoria.DAOFactory;

public class Globales {
	
	static {
		
	}
	
	
	
	
	/**
	 * url ROOT del sitio
	 */
	public static String SITE_ROOT_PATH = "http://192.168.1.55:8080/Busqueda_en_Red_Social/";
		
	public static String SITE_DEFAULT_LANG = "es_ES";	
	public static int SESSION_MAX_MINUTES = 30;
	
	
	public static String SITE_BACKOFFICE_THEME = "default";
	//public static String SITE_BACKOFFICE_THEME = "sb-admin-2";
	
	public static String SITE_FRONTOFFICE_THEME = "default";
	//public static String SITE_FRONTOFFICE_THEME = "blog-post";
	
	public static int COOKIES_MAX_EXP = 60*60*24*30;
	
	public static int GLOBAL_MOTOR = DAOFactory.MYSQL;
	
	public static DAOFactory factoria = null;

}
