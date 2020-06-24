package action;

import javax.servlet.http.*;
import vo.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		session.invalidate();
		
		forward.setRedirect(true);
		forward.setPath("memberMain.do");
		return forward;

	}
}