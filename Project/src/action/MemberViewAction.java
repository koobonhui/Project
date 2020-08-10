package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberViewService;
import vo.ActionForward;
import vo.MemberBean;

 public class MemberViewAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		String member_id = request.getParameter("member_id");
		MemberViewService memberViewService = new MemberViewService();
		MemberBean memberview = memberViewService.getmemberview(member_id);	
		ActionForward forward = new ActionForward();
	   	request.setAttribute("memberview", memberview);
   		forward.setPath("MemberView.jsp");
   		return forward;
	 }
	 
}