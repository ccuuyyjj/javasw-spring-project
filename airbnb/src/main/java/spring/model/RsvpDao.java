package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class RsvpDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Rsvp> rowMapper = (rs, index) -> {
		return new Rsvp(rs);
	};

	public void insert(Rsvp rsvp) {
		String sql = "insert into reservation values(reservation_seq.nextval, ? ,?, ?, "
				+ "to_date(?, 'mm/dd/yyyy'), to_date(?, 'mm/dd/yyyy'), " + "?, ?, ?, sysdate,?, ?)";
		Object[] args = new Object[] { rsvp.getRoom_no(), rsvp.getQuantity(), rsvp.getPhone(), rsvp.getStartdate(),
				rsvp.getEnddate(), rsvp.getTotalprice(), rsvp.getEtc(), rsvp.getProgress(), rsvp.getGuest_id(),
				rsvp.getR_id() };

		jdbcTemplate.update(sql, args);
	}

	// 예정된 여행 목록 추출 예약 날짜가 오늘 기준으로 이상 인것만
	public List<Rsvp> select(String id) {
		id = "aaa@a";

//		String sql = " select * from (select * from reservation where guest_id=? and"
//				+ " progress=2 and startdate >= (select sysdate from dual)order by reg desc)"
//				+ "inner join(select room.no,room.address,room.owner_id from room)b " + "on a.room_no = b.no";

		String sql = "select * from reservation where guest_id=? " + "and progress = 2 "
				+ "and startdate >= (select sysdate from dual) order by reg desc";

		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
	}
}
