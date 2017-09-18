package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Review {

	private int no;
	private String email;
	private String detail;
	private String rating;
	private String room_no;
	private String reg;
	
	public Review(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setEmail(rs.getString("email"));
		setDetail(rs.getString("detail"));
		setRating(rs.getString("rating"));
		setRoom_no(rs.getString("Room_no"));
		setReg(rs.getString("reg"));
	}
	
	public Review() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}

	public String getReg() {
		return reg;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	
	
	
	
}
