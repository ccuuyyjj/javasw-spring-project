package spring.model;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	+ "to_date(?, 'YYYY-MM-DD HH24:MI:SS'), to_date(?, 'YYYY-MM-DD HH24:MI:SS'), "
				+ "?, ?, sysdate,?, ?,     ?, ?, ?, ?)";
		Object[] args = new Object[] { 
				rsvp.getRoom_no(), rsvp.getQuantity(), rsvp.getPhone(), 
				rsvp.getStartdate(), rsvp.getEnddate(),  
				rsvp.getTotalprice(), rsvp.getEtc(), rsvp.getProgress(), rsvp.getGuest_id(), 
				rsvp.getR_id(), rsvp.getAddress(), rsvp.getOwner_id(), rsvp.getGuest_name() };

		jdbcTemplate.update(sql, args);
	}

	public Rsvp select_no(int no) {
		String sql = "select * from reservation where no = ? ";
		return jdbcTemplate.query(sql, new Object[] { no }, rowMapper).get(0);
	}
	
	// 예정된 여행 목록 추출 예약 날짜가 오늘 기준으로 이상 인것만
		public List<Rsvp> select(String id) {
			id = "aaa@a";

			String sql = "select * from reservation where guest_id=? " + "and progress = 2 "
					+ "and startdate >= (select sysdate from dual) order by reg desc";

			return jdbcTemplate.query(sql, new Object[] { id }, rowMapper);
		}
	
	
	public List<Rsvp> select(int room_no) {
		String sql = "select * from reservation where room_no = ? ";
		return jdbcTemplate.query(sql, new Object[] { room_no }, rowMapper);
	}
	
	//예약승낙된것만 가져와야 함.
	public List<Rsvp> select_complete(int room_no) {
		String sql = "select * from reservation where progress=2 and room_no = ? ";
		return jdbcTemplate.query(sql, new Object[] { room_no }, rowMapper);
	}
	
	public boolean status_update(int no, int progress) {
		String sql = "update reservation set progress = ? where no = ?";
		return jdbcTemplate.update(sql, new Object[] {progress,  no }) > 0;
	}
	
	
}
