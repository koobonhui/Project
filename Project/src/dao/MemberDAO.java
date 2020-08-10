package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	
	// 로그인
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
	
	// 회원가입
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
	
	// 회원중복 확인
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
		
		return -1;	// 디비 에러
	}
	
	// 회원목록
	public ArrayList<MemberBean> MemberList() {
		String sql = "SELECT * FROM members";
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		MemberBean mb = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					mb = new MemberBean();
					mb.setMember_id(rs.getString("member_id"));
					mb.setMember_pw(rs.getString("member_pw"));
					mb.setMember_name(rs.getString("member_name"));
					mb.setMember_birth(rs.getString("member_birth"));
					mb.setMember_gender(rs.getString("member_gender"));
					mb.setMember_phone(rs.getString("member_phone"));
					memberList.add(mb);
				} while(rs.next());
			}
		} catch(Exception ex) {
			System.out.println("getDeatilMember 에러: " + ex);			
		} finally {
			close(rs);
			close(pstmt);
		}
		return memberList;
	}
	
	// 회원정보 상세
	public MemberBean selectMember(String member_id) {
		String sql = "SELECT * FROM members WHERE member_id=?";
		MemberBean mb = null;
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mb = new MemberBean();
				mb.setMember_id(rs.getString("member_id"));
				mb.setMember_pw(rs.getString("member_pw"));
				mb.setMember_name(rs.getString("member_name"));
				mb.setMember_birth(rs.getString("member_birth"));
				mb.setMember_gender(rs.getString("member_gender"));
				mb.setMember_phone(rs.getString("member_phone"));
			}
		} catch(Exception ex) {
			System.out.println("getDeatilMember 에러: " + ex);			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return mb;
	}
	
	// 회원정보 삭제
	public int deleteMember(String member_id) {
		String sql = "DELETE FROM members WHERE member_id=?";
		int deleteCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			deleteCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("deleteMember 에러: " + ex);	
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
}
