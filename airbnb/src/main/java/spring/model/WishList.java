package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class WishList {
	private Logger log = LoggerFactory.getLogger(getClass());

	private int no;
	private int member_no;
	private Integer room_no;
	private String title;

	public WishList(HttpServletRequest request) {
		setRoom_no(Integer.parseInt(request.getParameter("room_no")));
		setTitle(request.getParameter("title"));
	}

	public WishList(ResultSet rs) throws SQLException {
		setTitle(rs.getString("title"));
		setNo(rs.getInt("no"));
		setMember_no(rs.getInt("member_no"));
		setRoom_no(rs.getInt("room_no"));
	}

	public WishList(ResultSet rs, String title) throws SQLException {
		setTitle(rs.getString("title"));
	}

	public WishList() {
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Integer getRoom_no() {
		return room_no;
	}

	public void setRoom_no(Integer room_no) {
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "WishList [no=" + no + ", member_no=" + member_no + ", room_no=" + room_no + ", title=" + title + "]";
	}

}
