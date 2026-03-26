package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.DAOFactory;
import model.dao.UserDAO;
import model.ModelException;
import model.User;

@WebServlet(urlPatterns = {"/users", "/users/save", "/users/update"})
public class UsersController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getRequestURI();
		System.out.println(action);
		
		switch (action) {
		case "/facebook/users": {
			loadUsers(req);
			
			// Redirecionamento para a página de tratamento (index)
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
			
			break;
		}
		case "/facebook/users/save": {
			insertUsers(req);
			
			resp.sendRedirect("/facebook/users");
			
			break;
		}case "/facebook/users/update": {			
			loadUser(req);
			
			RequestDispatcher rd =
					req.getRequestDispatcher("/users/form_user.jsp");
			rd.forward(req, resp);
			
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		// Começar tratando a submissão do form.
	}
	
	private void loadUser(HttpServletRequest req) {
		String userIdStr = req.getParameter("userId");
		int userId = Integer.parseInt(userIdStr);
		
		UserDAO userDAO = DAOFactory.createDAO(UserDAO.class);
		User userToBeUpdated = null;
		
		try {
			userToBeUpdated = userDAO.findById(userId);
		} catch(ModelException e){
			//Log no servidor
			e.printStackTrace();
		}
		
		// Colocar no contexto da requisição original
		req.setAttribute("usuario", userToBeUpdated);
		
	}
	
	private void insertUsers(HttpServletRequest req) {
		// Recuperar os dados do form
		String userName = req.getParameter("user_name");
		String userGender = req.getParameter("user_gender");
		String userEmail = req.getParameter("user_email");
		
		// Criar um User a partir dos dados do form
		User user = new User();
		user.setName(userName);
		user.setGender(userGender);
		user.setEmail(userEmail);
		user.setPassword("");
		
		// Criar um UserDAO e persistir o user
		UserDAO userDAO = DAOFactory.createDAO(UserDAO.class);
		
		try {
			userDAO.save(user);
		} catch (ModelException e) {
			// Log no servidor
			e.printStackTrace();
		}
	}
	
	private void loadUsers(HttpServletRequest req) {
		UserDAO userDAO = DAOFactory.createDAO(UserDAO.class);
		
		List<User> users = List.of();
		
		try {
			users = userDAO.listAll();
		} catch (Exception e) {
			e.printStackTrace(); // Só loga no servidor
		}
		
		// Adiciona a lista de usuários na requisição original
		req.setAttribute("usuarios", users);
	}

}
