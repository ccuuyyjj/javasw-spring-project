package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Rsvp {
	private int no;
	private int room_no;
	private String guest_id;
	private int quantity;
	private String phone;
	private String startdate;
	private String enddate;
	private int totalprice;
	private String etc;
	private String reg;
	private int progress;
	private String r_id;

	public Rsvp() {
	}

	public Rsvp(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setRoom_no(rs.getInt("room_no"));
		setGuest_id(rs.getString("guest_id"));
		setQuantity(rs.getInt("quantity"));
		setPhone(rs.getString("phone"));
		setStartdate(rs.getString("startdate"));
		setEnddate(rs.getString("enddate"));
		setTotalprice(rs.getInt("totalprice"));
		setEtc(rs.getString("etc"));
		setReg(rs.getString("reg"));
		setProgress(rs.getInt("progress"));
		setR_id(rs.getString("r_id"));
	}

	public Rsvp(HttpServletRequest request) {
		setNo(Integer.parseInt(request.getParameter("no")));
		setRoom_no(Integer.parseInt(request.getParameter("room+no")));
		setGuest_id(request.getParameter("guest_id"));
		setQuantity(Integer.parseInt(request.getParameter("quantity")));
		setPhone(request.getParameter("phone"));
		setStartdate(request.getParameter("startdate"));
		setEnddate(request.getParameter("totalprice"));
		setEtc(request.getParameter("etc"));
		setReg(request.getParameter("reg"));
		setR_id(request.getParameter("r_id"));
	}
	
	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
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
