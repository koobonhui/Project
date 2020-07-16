package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.BoardBean;
import dao.BoardDAO;

public class BoardModifyService {

	public boolean modifyBoard(BoardBean modifyBoard) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int updateCount = boardDAO.updateBoard(modifyBoard);
		
		if(updateCount > 0){
			commit(conn);
			isModifySuccess = true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isModifySuccess;
		
	}

}
