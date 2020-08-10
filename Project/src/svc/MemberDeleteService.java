package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberDeleteService {

	public boolean deleteMember(String member_id) throws Exception {
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		int deleteCount = memberDAO.deleteMember(member_id);
		
		if(deleteCount > 0) {
			commit(conn);
			isRemoveSuccess = true;
		}
		else {
			rollback(conn);
		}		
		close(conn);
		return isRemoveSuccess;
	}

}
