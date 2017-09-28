package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Sales {
	private String dt;
	private int cnt;
	private int amount;
	private int cancel_cnt;
	private int cancel_amount;

	public Sales(ResultSet rs) throws SQLException {
		setDt(rs.getString("dt"));
		setCnt(rs.getInt("cnt"));
		setAmount(rs.getInt("amount"));
		setCancel_cnt(rs.getInt("cancel_cnt"));
		setCancel_amount(rs.getInt("cancel_amount"));
	}

	public int getCancel_cnt() {
		return cancel_cnt;
	}

	public void setCancel_cnt(int cancel_cnt) {
		this.cancel_cnt = cancel_cnt;
	}

	public int getCancel_amount() {
		return cancel_amount;
	}

	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
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
