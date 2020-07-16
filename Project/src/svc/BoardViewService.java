package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;

public class BoardViewService {

	public BoardBean getboardview(int board_num) throws Exception {
		// TODO Auto-generated method stub
		
		BoardBean boardview = null;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(conn);
		}
		else{
			rollback(conn);
		}
		
		boardview = boardDAO.boardview(board_num);
		close(conn);
		return boardview;
		
	}

}
