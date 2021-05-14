package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDao;
/**
 * Servlet implementation class UserControl
 */
@WebServlet("/UserControl")
public class UserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession session = request.getSession(true);
	     UserBean user = new UserBean();
			session.removeAttribute("currentSessionUser");
			session.setAttribute("currentSessionUser", user);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
			System.out.println("stronbzo");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	    
			HttpSession session = request.getSession(true);
			 UserBean user = new UserBean();
			 String action= request.getParameter("action");
			
			 if(action.equalsIgnoreCase("login")) {
				 user.setEmail(request.getParameter("email"));
			     user.setPassword(request.getParameter("password"));
			     
			     user = userDao.doRetrieve(user);
			     if(user.isValid()==true) {
				     session.removeAttribute("currentSessionUser"); 
				     session.setAttribute("currentSessionUser",user); 
				     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					 dispatcher.forward(request, response);
					}
				     else if (!user.isValid()){
				    	 session.setAttribute("currentSessionUser",user); 
				    	 response.sendRedirect("./ProductView.jsp");
				     }
			}
			 else if(action.equalsIgnoreCase("signin")) {
				 user.setCF(request.getParameter("CF"));
				 user.setNome(request.getParameter("Nome"));
				 user.setCognome(request.getParameter("Cognome"));
				 user.setEmail(request.getParameter("Email"));
				 user.setPassword(request.getParameter("Password"));
				 user.setVia(request.getParameter("Via"));
				 user.setCittà(request.getParameter("Città"));
				 user.setCAP(request.getParameter("CAP"));
				 user.setProvincia(request.getParameter("Provincia"));
				 user.setTelefono(request.getParameter("Telefono"));
				 user.setData_Nascita(request.getParameter("Nascita"));
				 user.setIscritto(Boolean.parseBoolean(request.getParameter("Iscritto")));
				 try {
				 user.setCard(userDao.GenerateCardNumber());
				 }catch(SQLException e) {System.out.println("the error was: "+e);}
				 user.setScadenza_Card(userDao.GenerateExpireCard());
				 userDao.doInsert(user);
			 }
		}	
		catch (Throwable theException){
		     System.out.println(theException); 
		}
		
			 
		     //visualizzazioni di testing
		     /*System.out.println("QUI 1");
		     System.out.println("product control");
		     System.out.println(request.getParameter("password"));
		     System.out.println(request.getParameter("email"));*/
		    
		     //---------------------------//
		   
		    /* System.out.println(user.getCF());
		     System.out.println(user.isValid());*/
		  //   System.out.println(user.isValid());
		   //qui si inserisce lúser nella sessione e si manda tutto alla jsp principale
		    
	}

}
