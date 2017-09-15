package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Avail {
	private int no;
	private int room_no;
	private String day;
	private String available;
	private int price;

	public Avail() {
	}

	public Avail(ResultSet rs) throws SQLException {
		this.no = rs.getInt("no");
		this.room_no = rs.getInt("room_no");
		this.day = rs.getString("day");
		this.available = rs.getString("available");
		this.price = rs.getInt("price");
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

	public String getDay() {
		return day;
	}

	public String getDate() {
		return day.substring(0, 10);
	}

	public void setDay(String day) {
		this.day = day;
	}

	public boolean isAvailable() {
		return Boolean.parseBoolean(available);
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Avail [no=" + no + ", room_no=" + room_no + ", day=" + day + ", available=" + available + ", price="
				+ price + "]";
	}
}
