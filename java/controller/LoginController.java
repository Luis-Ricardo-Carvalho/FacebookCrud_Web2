package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.ModelException;
import model.User;
import model.dao.DAOFactory;
import model.dao.UserDAO;
import model.utils.PasswordEncryptor;

@WebServlet(urlPatterns = {"/login", "/logout"})
public class LoginController extends HttpServlet {
	
	// /login
	// /logout
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println(req.getRequestURI());
		String userLogin = req.getParameter("user_login");
		String userPW = req.getParameter("user_pw");
		
		UserDAO userDAO = DAOFactory.createDAO(UserDAO.class);
		User authenticatedUser = null;
		
		try {
			authenticatedUser = userDAO.findByEmail(userLogin);
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
		}
		
		if(authenticatedUser != null 
				&& PasswordEncryptor.checkPassword(userPW, authenticatedUser.getPassword())) {
			req.getSession().setAttribute("usuario_logado", authenticatedUser);
			resp.sendRedirect("/facebook/index.jsp");
		}else {
			resp.sendRedirect("/facebook/login.jsp?erro=true");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println(req.getRequestURI());
		
		HttpSession session = req.getSession(false);
		
		if (session != null) {
			session.invalidate();
		}
		
		resp.sendRedirect("/facebook/login.jsp");
	}

}
