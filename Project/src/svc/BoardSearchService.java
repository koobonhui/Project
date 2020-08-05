package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardSearchService {
	
	public int getSearchCount(BoardBean search) throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		listCount = boardDAO.selectSearchCount(search);
		close(conn);
		System.out.println("서치 리카 : " + listCount);
		return listCount;		
	}

	public ArrayList<BoardBean> boardSearch(int page, int limit, BoardBean search) throws Exception {
		
		ArrayList<BoardBean> boardSearch = null;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		boardSearch = boardDAO.boardSearch(page, limit, search);
		close(conn);
		return boardSearch;
		
	}

}
