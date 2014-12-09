package com.ipartek.formacion.helloworld.controler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.helloworld.bean.Persona;
import com.ipartek.formacion.helloworld.service.UserService;
import com.ipartek.formacion.helloworld.util.Constante;
import com.ipartek.formacion.helloworld.util.Util;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String pUser = null;
    private String pPass = null;
    private Persona user = null;
    private RequestDispatcher dispatch = null;
    private HttpSession session = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
	super();
    }

    /**
     * @see Servlet#init(ServletConfig)
     */
    @Override
    public void init(final ServletConfig config) throws ServletException {
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(final HttpServletRequest request,
	    final HttpServletResponse response) throws ServletException,
	    IOException {
	doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(final HttpServletRequest request,
	    final HttpServletResponse response) throws ServletException,
	    IOException {
	loadMessages();
	getParameters(request);
	session = request.getSession();
	user = UserService.find(pUser, pPass);
	validateUser(request);
	dispatch.forward(request, response);
    }

    private void loadMessages() {
	// TODO terminar de implementar

    }

    private void validateUser(final HttpServletRequest request) {
	if (user != null) {
	    session.setAttribute(Constante.USER_SESSION, user);
	    String ruta = Util.obtenerRutaPersona(user);
	    dispatch = request.getRequestDispatcher(ruta);
	} else {
	    dispatch = request.getRequestDispatcher(Constante.JSP_LOGIN);
	    request.setAttribute(Constante.MSG_KEY,
		    Constante.MSG_LOGIN_INCORRECT);
	}
    }

    private void getParameters(final HttpServletRequest request) {
	pUser = request.getParameter(Constante.PARAMETRO_USER);
	pPass = request.getParameter(Constante.PARAMETRO_PASS);
    }
}