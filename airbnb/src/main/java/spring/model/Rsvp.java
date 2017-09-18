package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Rsvp {
	private int no;
	private int room_no;
	private int guest_no;
	private int quantity;
	private String phone;
	private String startdate;
	private String enddate;
	private int totalprice;
	private String etc;
	private String reg;
	private int progress;
	
	public Rsvp() {}
	
	public Rsvp(ResultSet rs) throws SQLException{
		setNo(rs.getInt("no"));
		setRoom_no(rs.getInt("room_no"));
		setGuest_no(rs.getInt("guest_no"));
		setQuantity(rs.getInt("quantity"));
		setPhone(rs.getString("phone"));
		setStartdate(rs.getString("startdate"));
		setEnddate(rs.getString("enddate"));
		setTotalprice(rs.getInt("totalprice"));
		setEtc(rs.getString("etc"));
		setReg(rs.getString("reg"));
		setProgress(rs.getInt("progress"));
	}
	
	public Rsvp(HttpServletRequest request) {
		setNo(Integer.parseInt(request.getParameter("no")));
		setRoom_no(Integer.parseInt(request.getParameter("room+no")));
		setGuest_no(Integer.parseInt(request.getParameter("guest_no")));
		setQuantity(Integer.parseInt(request.getParameter("quantity")));
		setPhone(request.getParameter("phone"));
		setStartdate(request.getParameter("startdate"));
		setEnddate(request.getParameter("totalprice"));
		setEtc(request.getParameter("etc"));
		setReg(request.getParameter("reg"));
	}
	
	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
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
	public int getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
}
