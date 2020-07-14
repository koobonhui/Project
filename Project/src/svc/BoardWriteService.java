package svc;

import java.sql.Connection;
import dao.BoardDAO;
import vo.BoardBean;
import static db.JdbcUtil.*;
public class BoardWriteService {

	public boolean registArticle(BoardBean boardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection conn = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(conn);
		int insertCount = boardDAO.insertWrite(boardBean);
		
		if(insertCount > 0){
			commit(conn);
			isWriteSuccess = true;
		}
		else{
			rollback(conn);
		}
		
		close(conn);
		return isWriteSuccess;
		
	}

}

