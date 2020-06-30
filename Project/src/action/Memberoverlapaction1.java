package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberOverLapService;
import vo.MemberBean;

@WebServlet("/memberoverlapaction1")
public class Memberoverlapaction1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MemberBean member = new MemberBean();
		member.setMember_id(request.getParameter("member_id"));
		MemberOverLapService memberOverLapService = new MemberOverLapService();
   		boolean overResult = memberOverLapService.overlap(member);
   		
   		if(overResult) {
   			overResult = true;
   		}
	}

}
