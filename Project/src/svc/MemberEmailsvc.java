package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberEmailsvc {

	public MemberBean email(String member_id) {
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		MemberBean loginId = memberDAO.email(member_id);		
		close(conn);
		return loginId;	
	}
}
