package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Cart {
	private int no;
	private int room_no;
	private String guest_id;
	private int diffdays;
	private String startdate;
	private String enddate;
	private String reg;
	private int quantity;

	public Cart() {
	}

	public Cart(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setRoom_no(rs.getInt("room_no"));
		setGuest_id(rs.getString("guest_id"));
		setDiffdays(rs.getInt("diffdays"));
		setStartdate(rs.getString("startdate"));
		setEnddate(rs.getString("enddate"));
		setReg(rs.getString("reg"));
		setQuantity(rs.getInt("quantity"));
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public int getDiffdays() {
		return diffdays;
	}

	public void setDiffdays(int diffdays) {
		this.diffdays = diffdays;
	}

	public String getStartdate() {
		return startdate;
	}

	public String getSdate() {
		SimpleDateFormat originformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newformat = new SimpleDateFormat("yyyy년 M월 d일");
		String new_date = "";
		try {
			Date origindate = originformat.parse(startdate);
			new_date = newformat.format(origindate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new_date;
	}

	public String getEdate() {
		SimpleDateFormat originformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newformat = new SimpleDateFormat("yyyy년 M월 d일");
		String new_date = "";
		try {
			Date origindate = originformat.parse(enddate);
			new_date = newformat.format(origindate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new_date;
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
