package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.util.ArrayList;
import vo.MemberBean;

public class MemberDAO {

	private static MemberDAO memberDAO;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		
	}
	
	public static MemberDAO getInstance() {
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public String selectLoginId(MemberBean member) {
		String loginId = null;
		String sql = "SELECT member_id FROM members WHERE member_id=? AND member_pw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginId = rs.getString("member_id");
			}
		} catch (Exception ex) {
			System.out.println(" 에러: " + ex);			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginId;
	}
	
	public int insertMember(MemberBean member) {
		String sql = "INSERT INTO members VALUES(?, ?, ?, ?, ?, ?)";
		int insertCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pw());
			pstmt.setString(3, member.getMember_name());
			pstmt.setString(4, member.getMember_birth());
			pstmt.setString(5, member.getMember_gender());
			pstmt.setString(6, member.getMember_phone());
			insertCount = pstmt.executeUpdate();			
		} catch(Exception ex) {
			System.out.println("joinMember 에러: " + ex);			
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	public int OverLapId(MemberBean member) {
		String sql = "SELECT member_id FROM members WHERE member_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 0;		// 아이디 있음
			} else {
				return 1;		// 가입 가능
			}
		} catch (Exception ex) {
			System.out.println(" 에러: " + ex);			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return -1;
	}
	
//	public ArrayList<MemberBean> selectMemberList() {
//		String sql = "SELECT * FROM members";
//		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
//		MemberBean mb = null;
//		try {
//			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				do {
//					mb = new MemberBean();
//					mb.setMember_id(rs.getString("member_id"));
//					mb.setMember_pw(rs.getString("member_pw"));
//					mb.setMember_name(rs.getString("member_name"));
//					mb.setMember_age(rs.getInt("member_age"));
//					mb.setMember_gender(rs.getString("member_gender"));
//					mb.setMember_email(rs.getString("member_email"));
//					memberList.add(mb);
//				} while(rs.next());
//			}
//		} catch(Exception ex) {
//			System.out.println("getDeatilMember 에러: " + ex);			
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return memberList;
//	}
//	
//	public MemberBean selectMember(String viewId) {
//		String sql = "SELECT * FROM members WHERE member_id=?";
//		MemberBean mb = null;
//		try {
//			
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, viewId);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				mb = new MemberBean();
//				mb.setMember_id(rs.getString("member_id"));
//				mb.setMember_pw(rs.getString("member_pw"));
//				mb.setMember_name(rs.getString("member_name"));
//				mb.setMember_age(rs.getInt("member_age"));
//				mb.setMember_gender(rs.getString("member_gender"));
//				mb.setMember_email(rs.getString("member_email"));
//			}
//		} catch(Exception ex) {
//			System.out.println("getDeatilMember 에러: " + ex);			
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return mb;
//	}
//	
//	public int deleteMember(String deleteId) {
//		String sql = "DELETE FROM members WHERE member_id=?";
//		int deleteCount = 0;
//
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, deleteId);
//			deleteCount = pstmt.executeUpdate();
//		} catch(Exception ex) {
//			System.out.println("deleteMember 에러: " + ex);	
//		} finally {
//			close(pstmt);
//		}
//		
//		return deleteCount;
//	}
}
