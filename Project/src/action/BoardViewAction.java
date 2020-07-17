package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardViewService;
import vo.ActionForward;
import vo.BoardBean;

 public class BoardViewAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardViewService boardViewService = new BoardViewService();
		BoardBean boardview = boardViewService.getboardview(board_num);	
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("boardview", boardview);
   		forward.setPath("BoardView.jsp");
   		return forward;
	 }
	 
}