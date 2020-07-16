package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {

		ActionForward forward = null;
		boolean isModifySuccess = false;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardBean modifyBoard = new BoardBean();
		BoardModifyService boardModifyService = new BoardModifyService();
		
		modifyBoard.setBoard_num(board_num);
		modifyBoard.setBoard_title(request.getParameter("board_title"));
		modifyBoard.setBoard_content(request.getParameter("board_content"));
		
		isModifySuccess = boardModifyService.modifyBoard(modifyBoard);
		
		if(!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardview.do?board_num=" + modifyBoard.getBoard_num() + "&page=" + page);
		}
		
		return forward;		
	}
}
