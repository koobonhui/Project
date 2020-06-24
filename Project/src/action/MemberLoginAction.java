package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberLoginService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
   		MemberBean member = new MemberBean();
   		
   		member.setMember_id(request.getParameter("member_id"));
   		member.setMember_pw(request.getParameter("member_pw"));
   		
   		MemberLoginService memberLoginService = new MemberLoginService();
   		boolean loginResult = memberLoginService.login(member);
   		
   		ActionForward forward = null;
   		if(loginResult) {
	   	    forward = new ActionForward();
	   		session.setAttribute("id", member.getMember_id());
	   		forward.setRedirect(true);
	   		forward.setPath("memberMain.do");
   		} else {
   			response.setContentType("text/html;charset=UTF-8");
	   		PrintWriter out = response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('로그인 실패');");
	   		out.println("location.href='memberLogin.do'");
	   		out.println("</script>");
   		}
   		return forward;
	}

}
