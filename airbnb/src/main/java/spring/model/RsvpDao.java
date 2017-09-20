package spring.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class RsvpDao {
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Rsvp> rowMapper = (rs, index) -> {
		return new Rsvp(rs);
	};

	public void insert(Rsvp rsvp) {
		String sql = "insert into reservation values(reservation_seq.nextval, ? ,?, ?, "
				+ "to_date(?, 'YYYY-MM-DD HH24:MI:SS'), to_date(?, 'YYYY-MM-DD HH24:MI:SS'), "
				+ "?, ?, sysdate,  ?, ?, ?)";
		Object[] args = new Object[] { 
				rsvp.getRoom_no(), rsvp.getQuantity(), rsvp.getPhone(), 
				rsvp.getStartdate(), rsvp.getEnddate(),  
				rsvp.getTotalprice(), rsvp.getEtc(), rsvp.getProgress(), rsvp.getGuest_id(), rsvp.getR_id() };

		jdbcTemplate.update(sql, args);
	}

	public Rsvp select(String id) {
		String sql = "select * from reservation where guest_id = ? ";
		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper).get(0);
	}
	
	public List<Rsvp> select(int room_no) {
		String sql = "select * from reservation where room_no = ? ";
		return jdbcTemplate.query(sql, new Object[] { room_no }, rowMapper);
	}
}
