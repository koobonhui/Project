package action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberEmailsvc;
import vo.ActionForward;
import vo.MemberBean;

public class MemberEmail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
   		
		String member_id = request.getParameter("member_id");
   		
   		MemberEmailsvc memberemail = new MemberEmailsvc();
   		MemberBean memberview = memberemail.email(member_id);
   		
   		ActionForward forward = new ActionForward();
	   	request.setAttribute("memberview", memberview);
   		forward.setPath("mailsend.jsp");
   		return forward;
	}
}
