package ipt.fm.ipartek.linkedin.controller;

import ipt.fm.ipartek.linkedin.bean.LinkedInParse;
import ipt.fm.ipartek.linkedin.bean.Persona;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// recoger parametros
		String first = request.getParameter("first");
		String last = request.getParameter("last");

		// buscar el linkedin

		LinkedInParse parse = new LinkedInParse(first, last);
		ArrayList<Persona> personas = parse.getHtml();

		// pasar attributo resultado
		request.setAttribute("personas", personas);
		// forward a jsp de busqueda
		request.getRequestDispatcher("resultados.jsp").forward(request,
				response);

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
