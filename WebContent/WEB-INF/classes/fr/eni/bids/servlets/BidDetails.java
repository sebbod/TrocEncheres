package fr.eni.bids.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.bids.BidsException;
import fr.eni.bids.bll.ItemManager;
import fr.eni.bids.bll.utils.AppUtils;
import fr.eni.bids.bo.Item;

/**
 * Servlet implementation class BidDetails
 */
@WebServlet("/item/*")
public class BidDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BidDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * Show bid detail page
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get article
		int articleId = Integer.parseInt(request.getRequestURL().substring(request.getRequestURL().lastIndexOf("/")+1));
		Item article = null;
		try {
			ItemManager iMngr = new ItemManager();
			article = iMngr.getById(articleId);
		} catch (BidsException e) {
			e.printStackTrace();
		}
		
		// Define view mode
		if(article.getStatus().equals("Terminée")) {
			// If bid is ended and connected used have win
			if(article.getBuyer().getId() == AppUtils.getConnectedUser(request.getSession()).getId()) {
				request.setAttribute("mode", "won");
				System.out.println("MODE WON");
				
			// If bid is endend and connected user is not the winner of that bid
			} else {
				request.setAttribute("mode", "ended");
				System.out.println("MODE ENDED");
			}
		} else {
			request.setAttribute("mode", "default");
			System.out.println("MODE DEFAULT");
		}
		
		System.out.println(article.toString());
		
		
		request.setAttribute("article", article);
		
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/views/BidDetails.jsp");
		rd.forward(request, response);
	}
}
