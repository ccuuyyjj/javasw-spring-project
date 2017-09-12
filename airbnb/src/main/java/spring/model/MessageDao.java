package spring.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Message> rowMapper = (rs, index) -> {
		return new Message(rs);
	};

	public void insert(Message message) {
		String sql = "insert into message values(message_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		Object[] args = new Object[] { message.getMember_no(), message.getRoom_no(), message.getCheckin(),
				message.getCheckout(), message.getQuantity(), message.getQuestion(), };

		jdbcTemplate.update(sql, args);
	}

	public List<Message> getMessage(int member_no) {
		String sql = "select * from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		List<Message> list = jdbcTemplate.query(sql, args, rowMapper);
		return list;
	}

	public int count(int member_no) {
		String sql = "select count(*) from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		return count;
	}
	public Integer getRoom_no(int member_no) {
		String sql = "select room_no from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		jdbcTemplate.queryForObject(sql, args, Integer.class);
		int room_no = jdbcTemplate.queryForObject(sql, args, Integer.class);
		return 1;
	}
}
