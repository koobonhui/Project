package action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberOverLapService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberOverLapAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBean member = new MemberBean();
   		boolean joinResult = false;
   		member.setMember_id(request.getParameter("member_id"));
   		
   		MemberOverLapService memberOverLapService = new MemberOverLapService();
   		joinResult = memberOverLapService.overlap(member);
   		
   		ActionForward forward = null;
   		if(joinResult) {
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("memberListAction.dom");
   		} else {
   			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('로그인 실패');");
	   		out.println("location.href='memberLogin.dom'");
	   		out.println("</script>");
   		}
   		return forward;
	}
}

