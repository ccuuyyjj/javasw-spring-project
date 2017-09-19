package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.datetime.joda.MillisecondInstantPrinter;

public class WishList {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	private int no;
	private int member_no;
	private String address;
	private String hostname;
	private String checkin;
	private String checkout;
	private String status;
	
	public WishList(HttpServletRequest request) {
		setMember_no(Integer.parseInt(request.getParameter("member_no")));
		setStatus(request.getParameter("status"));
		setAddress(request.getParameter("address"));
		setHostname(request.getParameter("hostname"));
		setCheckin(request.getParameter("checkin"));
		setCheckout(request.getParameter("checkout"));
	}
	
	public WishList(ResultSet rs) throws SQLException {
		setNo(rs.getInt("no"));
		setMember_no(rs.getInt("member_no"));
		setStatus(rs.getString("status"));
		setAddress(rs.getString("address"));
		setHostname(rs.getString("hostname"));
		setCheckin(rs.getString("checkin"));
		setCheckout(rs.getString("checkout"));
	}
	
	
	public WishList() {
		super();
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	
	public boolean getTimeCheck() throws ParseException {
	     
		SimpleDateFormat  formatter = new SimpleDateFormat("yy/MM/dd");
		         
		//현재 날짜 구하기
		String todate =  formatter.format(new Date());
		
		log.debug("현재시간 년월일 = " + todate);
		        
		Date todate_date =  formatter.parse(todate);
		Date trip_date =  formatter.parse(getCheckin());
		        
		log.debug(todate_date + "====== " + trip_date);
		long diff = todate_date.getTime() - trip_date.getTime();
		
		// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		long diffDays = diff / (24 * 60 * 60 * 1000);
		     
		log.debug("날짜계산차이 = " + diff);

		return diff<0;
	}
	
	public String getCheckin() {
		return checkin.replace("-", "/");
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

	@Override
	public String toString() {
		return "WishList [no=" + no + ", member_no=" + member_no + ", status=" + status + ", address=" + address
				+ ", hostname=" + hostname + ", checkin=" + checkin + ", checkout=" + checkout + "]";
	}
	
	
}
