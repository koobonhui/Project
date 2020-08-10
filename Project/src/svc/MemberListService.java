package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.MemberDAO;
import vo.MemberBean;

public class MemberListService {
	public ArrayList<MemberBean> getmemberList() throws Exception {
		
		ArrayList<MemberBean> memberList = null;
		Connection conn = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		memberList = memberDAO.MemberList();
		close(conn);
		return memberList;		
	}

}
