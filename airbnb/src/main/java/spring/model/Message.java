package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Message {
	private int no;
	private int member_no;
	private int room_no;
	private String checkin;
	private String checkout;
	private int quantity;
	private String question;
	private String reg;
	private String name;
	private int price;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Message() {
		super();
	}

	public Message(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setMember_no(rs.getInt("member_no"));
		setRoom_no(rs.getInt("room_no"));
		setCheckin(rs.getString("checkin"));
		setCheckout(rs.getString("checkout"));
		setQuantity(rs.getInt("quantity"));
		setQuestion(rs.getString("question"));
		setReg(rs.getString("reg"));
		setName(rs.getString("name"));
		setPrice(rs.getInt("price"));
	}

	public Message(HttpServletRequest request) {
		setMember_no(Integer.parseInt(request.getParameter("member_no")));
		setRoom_no(Integer.parseInt(request.getParameter("room_no")));
		setCheckin(request.getParameter("checkin"));
		setCheckout(request.getParameter("checkout"));
		setQuantity(Integer.parseInt(request.getParameter("quantity")));
		setQuestion(request.getParameter("question"));
		setReg(request.getParameter("reg"));
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getReg() {
		return reg;
	}

	public String getDate() {
		return reg.substring(0, 16);
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "Message [no=" + no + ", member_no=" + member_no + ", room_no=" + room_no + ", checkin=" + checkin
				+ ", checkout=" + checkout + ", quantity=" + quantity + ", question=" + question + ", reg=" + reg
				+ ", name=" + name + ", price=" + price + "]";
	}
}
