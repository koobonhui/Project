package action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberOverLapService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberOverLapAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBean member = new MemberBean();
		HttpSession session = request.getSession();
   		boolean joinResult = false;
   		member.setMember_id(request.getParameter("member_id"));
   		
   		MemberOverLapService memberOverLapService = new MemberOverLapService();
   		joinResult = memberOverLapService.overlap(member);
   		
   		ActionForward forward = null;
   		if(joinResult) {
   			session.setAttribute("check", joinResult);
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("memberoverlap.do");
   		} else {
   			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('실패');");
	   		out.println("location.href='memberJoin.do'");
	   		out.println("</script>");
   		}
   		return forward;
	}
}

