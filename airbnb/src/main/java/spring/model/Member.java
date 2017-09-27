package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Member {
	private int no;
	private String email;
	private String pw;
	private String name;
	private String phone;
	private String enabled;
	private String authority;
	private String reg;

	public Member() {
		super();
	}

	public Member(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setEmail(rs.getString("Email"));
		setPw(rs.getString("pw"));
		setName(rs.getString("name"));
		setPhone(rs.getString("phone"));
		setEnabled(rs.getString("enabled"));
		setAuthority(rs.getString("authority"));
		setReg(rs.getString("reg"));
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getReg() {
		return reg;
	}

	public String getDetailReg() {
		String year = reg.split("-")[0];
		String month = reg.split("-")[1];

		return month + "월 " + year;
	}

	public void setReg(String reg) {
		this.reg = reg;
	}

	@Override
	public String toString() {
		return "Member [no=" + no + ", email=" + email + ", pw=" + pw + ", name=" + name + ", phone=" + phone
				+ ", enabled=" + enabled + ", authority=" + authority + ", reg=" + reg + "]";
	}

}
