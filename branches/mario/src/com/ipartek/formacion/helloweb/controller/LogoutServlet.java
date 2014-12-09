package com.ipartek.formacion.helloweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.helloweb.Constantes;
import com.ipartek.formacion.helloweb.bean.Mensaje;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    RequestDispatcher dispatch = null;
    HttpSession session = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
	super();
	// TODO Auto-generated constructor stub
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

	// poner a null su session
	session.setAttribute(Constantes.USER_SESSION, null);

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