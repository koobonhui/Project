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
import action.BoardDeleteAction;
import action.BoardListAction;
import action.BoardModifyAction;
import action.BoardModifyFormAction;
import action.BoardSearchAction;
import action.BoardViewAction;
import action.BoardWriteAction;
//import action772.MemberDeleteAction;
import action.MemberJoinAction;
//import action772.MemberListAction;
import action.MemberLoginAction;
import action.MemberLogoutAction;
import action.MemberOverLapAction;
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
		
		if(command.equals("/memberMain.do")) {		// 메인 jsp
			forward = new ActionForward();
			forward.setPath("/Main.jsp");
		} else if(command.equals("/memberLogin.do")) {	// 로그인 jsp
			forward = new ActionForward();
			forward.setPath("/Login.jsp");
		} else if(command.equals("/memberJoin.do")) {	// 회원가입 jsp
			forward = new ActionForward();
			forward.setPath("/Join.jsp");
		} else if(command.equals("/gallery.do")) {	// 갤러리 jsp
			forward = new ActionForward();
			forward.setPath("/Gallery.jsp");
		} else if(command.equals("/memberoverlap.do")) {	// 실시간 확인 jsp
			forward = new ActionForward();
			forward.setPath("/Memberoverlap.jsp");
		} else if(command.equals("/boardwrite.do")) {	// 글쓰기 jsp
			forward = new ActionForward();
			forward.setPath("/BoardWrite.jsp");
		} else if(command.equals("/memberLoginAction.do")) {	// 로그인 Action
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberLogoutAction.do")) {	// 로그아웃 Action
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberJoinAction.do")) {	// 회원가입 Action
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/memberoverlapaction.do")) {	// 실시간 아이디 중복 Action
			action = new MemberOverLapAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardWriteAction.do")) {	// 게시판 글쓰기 Action
			action = new BoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		} else if(command.equals("/boardlist.do")) {	// 게시판 리스트 목록 Action
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardview.do")) {	// 게시판 글 보기 Action
			action = new BoardViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardmodifyform.do")) {	// 게시판 글 수정하기 Action
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardModifyAction.do")) {	// 게시판 글 수정하기 Action
			action = new BoardModifyAction();
			try { 
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardDelete.do")) {	// 게시판 글 삭제하기 Action
			action = new BoardDeleteAction();
			try { 
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardSearchAction.do")) {	// 게시판 글 검색 Action
			action = new BoardSearchAction();
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
