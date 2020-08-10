package svc;

import java.sql.Connection;
import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberViewService {

	public MemberBean getmemberview(String member_id) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		MemberBean member = memberDAO.selectMember(member_id);
		close(conn);
		return member;
		
		
		
	}

}
