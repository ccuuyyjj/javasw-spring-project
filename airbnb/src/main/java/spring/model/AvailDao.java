package spring.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AvailDao {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private RowMapper<Avail> rowMapper = (rs, i) -> {
		return new Avail(rs);
	};

	public List<Avail> select(int room_no) {
		String sql = "select * from available_date where room_no = ? order by day";
		Object[] args = new Object[] { room_no };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	public List<Avail> selectAvailable(int room_no) {
		String sql = "select * from available_date where room_no = ? and available = 'true' order by day";
		Object[] args = new Object[] { room_no };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	public Avail select(int room_no, String day) {
		String sql = "select * from available_date where room_no = ? and day = to_date(?, 'mm/dd/yyyy')";
		Object[] args = new Object[] { room_no, day };
		log.debug("room_no : " + room_no);
		log.debug("day : " + day);
		List<Avail> list = jdbcTemplate.query(sql, args, rowMapper);
		if (list.size() > 0) {
			return jdbcTemplate.query(sql, args, rowMapper).get(0);
		} else {
			return null;
		}
	}

	public boolean insert(Avail avail) {
		int no = jdbcTemplate.queryForObject("select available_date_seq.nextval from dual", Integer.class);

		String sql = "insert into available_date values(?, ?, to_date(?, 'mm/dd/yyyy'), ?, ?)";
		Object[] args = new Object[] { no, avail.getRoom_no(), avail.getDay(), avail.getAvailable(), avail.getPrice() };

		return jdbcTemplate.update(sql, args) > 0;
	}

	public boolean update(int no, String available) {
		log.debug("no:" + no);
		log.debug("available:" + available);
		String sql = "update available_date set available = ? where no = ?";
		Object[] args = new Object[] { available, no };
		return jdbcTemplate.update(sql, args) > 0;
	}

}
