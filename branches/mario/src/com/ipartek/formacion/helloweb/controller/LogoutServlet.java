package com.ipartek.formacion.helloweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ipartek.formacion.helloweb.Constantes;
import com.ipartek.formacion.helloweb.bean.Mensaje;
import com.ipartek.formacion.helloweb.bean.Persona;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    RequestDispatcher dispatch = null;
    HttpSession session = null;
    private static Logger log = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
	super();
	// TODO Auto-generated constructor stub
    }

    /**
     * Se ejecuta una sola vez e inicializa el Servlet.
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
	log = Logger.getLogger("ACCESOS");
	super.init(config);

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	// recuperar sesion
	session = request.getSession();
	if (null != session.getAttribute(Constantes.USER_SESSION)) {
	    Persona usuario = (Persona) session
		    .getAttribute(Constantes.USER_SESSION);
	    log.trace("Deslogeando a: " + usuario.toString());
	} else {
	    log.warn("usuario en session es nulo");
	}

	Persona per = (Persona) session.getAttribute(Constantes.USER_SESSION);
	log.info("Desconexión de: " + per.getNombre());

	// poner a null su session
	session.removeAttribute(Constantes.USER_SESSION);

	// forward a login
	dispatch = request.getRequestDispatcher(Constantes.JSP_LOGIN);
	Mensaje msg = new Mensaje(Constantes.MSG_LOGOUT,
		Constantes.MSG_SUCCESS, 1);
	request.setAttribute(Constantes.MSG_KEY, msg);
	dispatch.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request,
	    HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
    }

}
