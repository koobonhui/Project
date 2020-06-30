package svc;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberOverLapService {

	public boolean overlap(MemberBean member) {
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		boolean OverlapResult = false;
		int OverlapId = memberDAO.OverLapId(member);
		if(OverlapId == 0){
			OverlapResult = true;
		}
		close(conn);
		return OverlapResult;
	}

}
