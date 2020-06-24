package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBean member = new MemberBean();
   		boolean joinResult = false;
   		
   		member.setMember_id(request.getParameter("member_id"));
   		member.setMember_pw(request.getParameter("member_pw"));
   		member.setMember_name(request.getParameter("member_name"));
   		member.setMember_birth(request.getParameter("yy") + request.getParameter("mm") + request.getParameter("dd"));
   		member.setMember_gender(request.getParameter("member_gender"));
   		member.setMember_phone(request.getParameter("member_phone"));
   		
   		MemberJoinService memberJoinService = new MemberJoinService();
   		joinResult = memberJoinService.joinMember(member);
   		
   		ActionForward forward = null;
   		if(joinResult == false) {
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('회원등록실패')");
   			out.println("history.back()");
   			out.println("</script>");
	   	} else {
	   	    forward = new ActionForward();
	   		forward.setRedirect(true);
	   		forward.setPath("memberLogin.do");
   		}
   		return forward;
}
	}

