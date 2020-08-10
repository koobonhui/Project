package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberListService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberListAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();	  			
		MemberListService memberListService = new MemberListService();
		memberList = memberListService.getmemberList();
		request.setAttribute("memberList", memberList);
		ActionForward forward= new ActionForward();
   		forward.setPath("MemberList.jsp");
   		return forward;
   		
	 }

}
