package spring.model;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

@Repository
public class RsvpDao {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Rsvp> rowMapper = (rs, index) -> {
		return new Rsvp(rs);
	};

	public void insert(Rsvp rsvp) throws Exception {
		String sql = "insert into reservation values(reservation_seq.nextval, ? ,?, ?, "
				+ "to_date(?, 'YYYY-MM-DD HH24:MI:SS'), to_date(?, 'YYYY-MM-DD HH24:MI:SS'), "
				+ "?, ?, sysdate,?, ?,?, ?)";
		Object[] args = new Object[] { rsvp.getRoom_no(), rsvp.getQuantity(), rsvp.getPhone(), rsvp.getStartdate(),
				rsvp.getEnddate(), rsvp.getTotalprice(), rsvp.getEtc(), rsvp.getProgress(), rsvp.getGuest_id(),
				rsvp.getR_id(), rsvp.getGuest_name() };
		jdbcTemplate.update(sql, args);
	}

	public Rsvp select_no(int no) {
		String sql = "select * from reservation where no = ? ";
		return jdbcTemplate.query(sql, new Object[] { no }, rowMapper).get(0);
	}

	// 예정된 여행 목록 추출 예약 날짜가 오늘 기준으로 이상 인것만
	public List<Rsvp> select(String id, int type) {

		RowMapper<Rsvp> rowMapper = (rs, index) -> {
			Rsvp rsvp = new Rsvp(rs);
			rsvp.setAddress(rs.getString("address"));
			{
				String email = rs.getString("owner_id");
				String sql = "select name from member where email=?";
				SqlRowSet srs = jdbcTemplate.queryForRowSet(sql, email);
				if (srs.next()) {
					rsvp.setHost_name(srs.getString("name"));
				}
			}
			return rsvp;
		};
		String sql;
		if (type == 1) {
			sql = " select a.*,b.address,b.owner_id from" + "(select * from reservation where guest_id=? "
					+ "and progress=2 and startdate > (select sysdate from dual)order by reg desc)a " + "inner join"
					+ "(select * from room)b " + "on a.room_no = b.no";
		} else {
			sql = " select a.*,b.address,b.owner_id from" + "(select * from reservation where guest_id=? "
					+ "and progress=2 and startdate < (select sysdate from dual)order by reg desc)a " + "inner join"
					+ "(select * from room)b " + "on a.room_no = b.no";
		}

		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
	}

	public List<Rsvp> select(int room_no) {
		String sql = "select * from reservation where room_no = ? ";
		return jdbcTemplate.query(sql, new Object[] { room_no }, rowMapper);
	}

	// 예약승낙된것만 가져와야 함.
	public List<Rsvp> select_complete(String id) {
		String sql = "select * from reservation where progress=2 and owner_id=?";
		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
	}

	public boolean status_update(int no, int progress) {
		String sql = "update reservation set progress = ? where no = ?";
		return jdbcTemplate.update(sql, new Object[] { progress, no }) > 0;
	}

	public List<Rsvp> transaction_history(int room_no, String sMonth, String eMonth, String id) {
		String sql = "select * from reservation where progress=2 and "
				+ "enddate >= to_date(?, 'YYYYMM') and  enddate <= sysdate and "
				+ "enddate < add_months(to_date(?, 'YYYYMM'), +1) and owner_id=? ";
		if (room_no > 0) {
			sql += "and room_no = ? order by enddate desc";
			Object[] args = new Object[] { sMonth, eMonth, id, room_no };
			return jdbcTemplate.query(sql, args, rowMapper);

		} else {
			sql += "order by enddate desc";
			Object[] args = new Object[] { sMonth, eMonth, id };
			return jdbcTemplate.query(sql, args, rowMapper);
		}
	}

	public List<Rsvp> future_transactions(String id, int room_no) {
		String sql = "select * from reservation where progress=2 and enddate > sysdate and owner_id=? ";
		if (room_no > 0) {
			sql += "and room_no = ? order by enddate desc";
			Object[] args = new Object[] { id, room_no };
			return jdbcTemplate.query(sql, args, rowMapper);

		} else {
			sql += "order by enddate desc";
			Object[] args = new Object[] { id };
			return jdbcTemplate.query(sql, args, rowMapper);
		}
	}

	public List<Rsvp> tax_report(String sDate, String eDate, String id) {
		String sql = "select * from reservation where progress=2 and "
				+ "enddate >= to_date(?, 'YYYYMM') and enddate < add_months(to_date(?, 'YYYYMM'), +1) "
				+ "and owner_id=? order by enddate desc ";
		Object[] args = new Object[] { sDate, eDate, id };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	// 예약 취소
	public boolean delete(String id, String no) {
		String sql = "update reservation set PROGRESS = 3 where guest_id=? and no=?";

		return jdbcTemplate.update(sql, new Object[] { id, no }) == 1;
	}

	public List<String> progressStat(String type, String constraint) {
		String sql = "select r, count(decode(p, 0, '1')) as p0, count(decode(p, 1, '1')) as p1, count(decode(p, 2, '1')) as p2, count(decode(p, 3, '1')) as p3, count(decode(p, 9, '1')) as p9, count(*) as sum from (select to_char(reg, ?) as r, progress as p from reservation) group by r order by r"
				+ constraint;
		SqlRowSet srs = jdbcTemplate.queryForRowSet(sql, type);
		List<String> list = new ArrayList<>();

		while (srs.next()) {
			String item = srs.getString("r") + "|" + srs.getString("p0") + "|" + srs.getString("p1") + "|"
					+ srs.getString("p2") + "|" + srs.getString("p3") + "|" + srs.getString("p9") + "|"
					+ srs.getString("sum");
			list.add(item);
		}
		return list;
	}
}
