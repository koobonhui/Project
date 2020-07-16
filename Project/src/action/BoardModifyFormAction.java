package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardViewService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			String nowPage = request.getParameter("page");
			BoardViewService boardViewService = new BoardViewService();	
		   	BoardBean boardview = boardViewService.getboardview(board_num);
		   	request.setAttribute("boardview", boardview);
		   	request.setAttribute("page", nowPage);
	   		forward.setPath("BoardModify.jsp");
	   		return forward;
	   		
	 }
	 
}
