package dao;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import vo.BoardBean;
import vo.PageInfo;

public class BoardDAO {

	private static BoardDAO boardDAO;
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	PageInfo pageinfo = new PageInfo();
	
	public BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	// 글 등록하기.	
	public int insertWrite(BoardBean write) {
		String sql = "insert into board(board_title, board_username , board_date, board_readcount, board_content) values(?, ?, now(), ?, ?)";
		String sql2 = "ALTER TABLE board AUTO_INCREMENT=1";
		int insertCount = 0;
		
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql2);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, write.getBoard_title());
			pstmt.setString(2, write.getBoard_username());
			pstmt.setInt(3, 0);
			pstmt.setString(4, write.getBoard_content());
			insertCount = pstmt.executeUpdate();			
		} catch(Exception ex) {
			System.out.println("joinMember 에러: " + ex);			
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// 글 목록 보기.
	public ArrayList<BoardBean> boardList(int page, int limit) {
		String sql = "select * from board order by board_num desc limit ?, 10";
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		BoardBean board = null;
		
		int startrow = (page - 1) * 10; //읽기 시작할 row 번호..	

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				board = new BoardBean();
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_username(rs.getString("board_username"));
				board.setBoard_date(rs.getDate("board_date"));
				board.setBoard_readcount(rs.getInt("board_readcount"));	
				boardList.add(board);
			}

		} catch(Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return boardList;
	}
	
	// 글의 개수 구하기.
	public int selectListCount() {
		String sql = "select count(*) from board";
		int listCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch(Exception ex) {
			System.out.println("getListCount 에러: " + ex);			
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	public int totalBlock() {	// 전체 블록의 수
		if(selectListCount() % (pageinfo.getWidthBlock() * pageinfo.getPageRows()) > 0) {
			return selectListCount() / (pageinfo.getWidthBlock() * pageinfo.getPageRows()) + 1;
		}
		return selectListCount() / (pageinfo.getWidthBlock() * pageinfo.getPageRows());
	}
	
	public int currentBlock(int nowpage) {		// 현재 블럭의 수
		if(nowpage % pageinfo.getWidthBlock() > 0) {
			return nowpage / pageinfo.getWidthBlock() + 1;
		}
		return nowpage / pageinfo.getWidthBlock();
	}
	
	public int totalPage() {		// 전체 페이지 수를 계산하는 메소드
		if(selectListCount() % pageinfo.getPageRows() > 0) {
			return selectListCount() / pageinfo.getPageRows() + 1;
		}
		return selectListCount() / pageinfo.getPageRows();
	}
	
	//글 내용 보기
	public BoardBean boardview(int board_num) {
		String sql = "select * from board where board_num = ?";
		BoardBean boardview = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				boardview = new BoardBean();
				boardview.setBoard_num(rs.getInt("board_num"));
				boardview.setBoard_title(rs.getString("board_title"));
				boardview.setBoard_content(rs.getString("board_content"));
				boardview.setBoard_username(rs.getString("board_username"));
			}
		} catch(Exception ex) {
			System.out.println("boardview 에러 : " + ex);
		} finally {
			close(rs);
			close(pstmt);
		}
		return boardview;
	}
	
	// 조회수 업데이트.
	public int updateReadCount(int board_num) {

		int updateCount = 0;
		
		String sql = "update board set board_readcount = board_readcount + 1 where board_num = ?";

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch(SQLException ex) {
			System.out.println("updateReadCount 에러 : "+ex);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	// 글 수정
	public int updateBoard(BoardBean modifyBoard) {

		int updateCount = 0;
		String sql = "update board set board_title=?, board_content=? where board_num=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyBoard.getBoard_title());
			pstmt.setString(2, modifyBoard.getBoard_content());
			pstmt.setInt(3, modifyBoard.getBoard_num());
			updateCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			close(pstmt);
		}

		return updateCount;
	}
	
	// 글 삭제
	public int deleteBoard(int board_num) {

		String sql = "delete from board where board_num=?";
		int deleteCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch(Exception ex) {
			System.out.println("boardDelete 에러 : "+ex);
		}	finally{
			close(pstmt);
		}
		
		return deleteCount;
	}
	
	// 게시판 재정렬
	public int Rearrangement() {

		String sql1 = "SET @COUNT = 0";
		String sql2 = "UPDATE board SET board.board_num = @COUNT:=@COUNT+1";
		int Rearrangement = 0;

		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql1);
			Rearrangement = stmt.executeUpdate(sql2);
		} catch(Exception ex) {
			System.out.println("Rearrangement 에러 : "+ex);
		}	finally{
			close(stmt);
		}
		
		return Rearrangement;
	}
}
