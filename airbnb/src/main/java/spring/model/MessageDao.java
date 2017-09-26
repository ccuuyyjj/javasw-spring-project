package spring.model;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDao {
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Message> rowMapper = (rs, index) -> {
		return new Message(rs);
	};

	public void insert(Message message, int member_no) {
		String sql = "insert into message values(message_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		Object[] args = new Object[] { member_no, message.getRoom_no(), message.getCheckin(), message.getCheckout(),
				message.getQuantity(), message.getQuestion(), message.getName(), message.getPrice() };

		jdbcTemplate.update(sql, args);
	}

	public List<Message> getMessage(int member_no) {
		String sql = "select * from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		List<Message> list = jdbcTemplate.query(sql, args, rowMapper);
		return list;
	}

	public Message Message(int member_no, int room_no) {
		String sql = new SQL() {
			{
				SELECT("*");
				FROM("message");
				WHERE("member_no = ? and room_no = ?");
			}
		}.toString();
		Object[] args = new Object[] { member_no, room_no };
		return jdbcTemplate.query(sql, args, rowMapper).get(0);
	}

	public List<Message> getMessage(int member_no, int room_no) {
		String sql = "select * from " + "(select * from message where member_no = ? and room_no = ? order by reg desc)";
		Object[] args = new Object[] { member_no, room_no };
		List<Message> list = jdbcTemplate.query(sql, args, rowMapper);
		return list;
	}

	public int count(int member_no) {
		String sql = "select count(*) from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		int count = jdbcTemplate.queryForObject(sql, args, Integer.class);
		return count;
	}

	public List<Integer> getRoom_no(int member_no) {
		String sql = "select DISTINCT room_no from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		List<Integer> room_no = jdbcTemplate.queryForList(sql, args, Integer.class);
		return room_no;
	}

	public void update(String name, int price, int member_no, int room_no) {
		String sql = "update message set name = ?, price = ? where member_no = ? and room_no = ?";
		Object[] args = new Object[] { name, price, member_no, room_no };
		jdbcTemplate.update(sql, args);
	}
}
