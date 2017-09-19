package spring.model;

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
		String sql = "insert into reservation values(reservation.nextval, ? ,?, ?, ?,   ?, ?, ?, ?, sysdate,   ?)";
		Object[] args = new Object[] { 
							rsvp.getRoom_no(), rsvp.getQuantity(), rsvp.getPhone(), rsvp.getStartdate(), 
							rsvp.getEnddate(), rsvp.getTotalprice(), rsvp.getEtc(), rsvp.getProgress(), 
							rsvp.getGuest_id() };

		jdbcTemplate.update(sql, args);
	}
	
	public Rsvp select(String id) {
		String sql = "select * from reservation where guest_id ";
		return jdbcTemplate.query(sql, new Object[] {id}, rowMapper).get(0) ;
	}
	
}
