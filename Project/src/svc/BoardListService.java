package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardListService {
	
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectListCount();
		System.out.println("서비스 리카 : " + listCount);
		close(conn);
		return listCount;		
	}

	public ArrayList<BoardBean> getboardList(int page, int limit) throws Exception {
		
		ArrayList<BoardBean> boardList = null;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		boardList = boardDAO.boardList(page, limit);
		close(conn);
		return boardList;
		
	}

}
