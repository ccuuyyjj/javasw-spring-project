package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Cart {
	private int no;
	private int room_no;
	private String guest_id;
	private int quantity;
	private String startdate;
	private String enddate;
	private String reg;
	
	public Cart() {}
	public Cart(ResultSet rs) throws SQLException {
		rs.getInt("no");
		rs.getInt("room_no");
		rs.getString("guest_id");
		rs.getInt("quantity");
		rs.getString("startdate");
		rs.getString("enddate");
		rs.getString("reg");
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRoom_no() {
		return room_no;
	}
	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	public String getGuest_id() {
		return guest_id;
	}
	public void setGuest_id(String guest_id) {
		this.guest_id = guest_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	
	
	
}
