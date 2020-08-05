package vo;
import java.sql.Date;

public class BoardBean {
	
	private int board_num;
	private String board_title;
	private String board_content;
	private String board_username;
	private Date board_date;
	private int board_readcount;
	private String board_option;
	private String board_search;
	
	public String getBoard_search() {
		return board_search;
	}
	public void setBoard_search(String board_search) {
		this.board_search = board_search;
	}
	public String getBoard_option() {
		return board_option;
	}
	public void setBoard_option(String board_option) {
		this.board_option = board_option;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_username() {
		return board_username;
	}
	public void setBoard_username(String board_username) {
		this.board_username = board_username;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
		
}
