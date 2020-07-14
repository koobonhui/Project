package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardWriteService;
import vo.ActionForward;
import vo.BoardBean;
import javax.servlet.http.HttpSession;

public class BoardWriteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		BoardBean board = new BoardBean();
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		board.setBoard_username((String)session.getAttribute("id"));
		board.setBoard_title(request.getParameter("board_title"));
		board.setBoard_content(request.getParameter("board_content"));
		
		BoardWriteService boardWriteService = new BoardWriteService();
		boolean isWriteSuccess = boardWriteService.registArticle(board);

		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("boardlist.do");
		}

		return forward;
	}
}
