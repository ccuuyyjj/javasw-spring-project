package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Sales {
	private String dt;
	private int cnt;
	private int amount;

	public Sales(ResultSet rs) throws SQLException {
		setDt(rs.getString("dt"));
		setCnt(rs.getInt("cnt"));
		setAmount(rs.getInt("amount"));
	}

	public String getDt() {
		return dt;
	}

	public void setDt(String dt) {
		this.dt = dt;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
