package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.BoardDAO;

public class BoardDeleteService {

	public boolean deleteBoard(int board_num) throws Exception {
		
		boolean isRemoveSuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int deleteCount = boardDAO.deleteBoard(board_num);
		
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
	
	public boolean Rearrangement() throws Exception {
		
		boolean checkRearrangement = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int Rearrangement = boardDAO.Rearrangement();
		
		if(Rearrangement > 0) {
			commit(conn);
			System.out.println("재정렬 성공");
			checkRearrangement = true;
		} else {
			rollback(conn);
		}
		close(conn);
		return checkRearrangement;
	}

}
