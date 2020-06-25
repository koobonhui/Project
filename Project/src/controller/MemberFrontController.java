package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
//import action772.MemberDeleteAction;
import action.MemberJoinAction;
//import action772.MemberListAction;
import action.MemberLoginAction;
import action.MemberLogoutAction;
//import action772.MemberViewAction;
import vo.ActionForward;

@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		if(command.equals("/memberMain.do")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Main.jsp");
		} else if(command.equals("/memberLogin.do")) {
			forward = new ActionForward();
			forward.setPath("/Login.jsp");
		} else if(command.equals("/memberJoin.do")) {
			forward = new ActionForward();
			forward.setPath("/Join.jsp");
		} else if(command.equals("/gallery.do")) {
			forward = new ActionForward();
			forward.setPath("/Gallery.jsp");
		} else if(command.equals("/memberLoginAction.do")) {
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberLogoutAction.do")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberJoinAction.do")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('틀린 경로')");
			out.println("</script>");
			forward = new ActionForward();
			forward.setPath("/Login.jsp");
		}
		
		if(forward != null) {		
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
	
	}

}
