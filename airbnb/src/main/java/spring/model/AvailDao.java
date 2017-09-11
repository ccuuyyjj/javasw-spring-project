package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AvailDao {
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
		String sql = "select * from available_date where room_no = ? and day = ?";
		Object[] args = new Object[] { room_no, day };
		return jdbcTemplate.query(sql, args, rowMapper).get(0);
	}
	
	public int insert(Avail avail) {
		int no = jdbcTemplate.queryForObject("select available_date_seq.nextval from dual", Integer.class);
		
			String sql = "insert into available_date values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate, ?, ?)";
			Object[] args = new Object[] {
					no,
					avail.getNo(),
					avail.getDay(),
					avail.getAvailable(),
					avail.getPrice()
			};
		
		if (jdbcTemplate.update(sql, args) > 0)
			return no;
		else
			return -1;
	}
	
	public boolean update(int no, String available) {
		String sql = "update available_date set avalable = ? where no = ?";
		Object[] args = new Object[] {no, available};
		return jdbcTemplate.update(sql, args)>0;
	}
	
}
