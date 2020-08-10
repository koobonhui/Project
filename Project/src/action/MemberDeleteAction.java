package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MemberDeleteService;
import vo.ActionForward;

public class MemberDeleteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward forward = null;
		String member_id = request.getParameter("member_id");
		MemberDeleteService memberDeleteService = new MemberDeleteService();
		boolean isDeleteSuccess = memberDeleteService.deleteMember(member_id);

		if(!isDeleteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberListAction.do");
		}
			
		return forward;
	}

}
