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
		String sql = "insert into message values(message_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		Object[] args = new Object[] { message.getMember_no(), message.getRoom_no(), message.getCheckin(),
				message.getCheckout(), message.getQuantity(), message.getQuestion(), message.getName(), message.getPrice() };

		jdbcTemplate.update(sql, args);
	}

	public List<Message> getMessage(int member_no) {
		String sql = "select * from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		List<Message> list = jdbcTemplate.query(sql, args, rowMapper);
		return list;
	}
	
	public List<Message> getMessage(int member_no, int room_no) {
		String sql = "select * from message where member_no = ? and room_no = ?";
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
	public List getRoom_no(int member_no) {
		String sql = "select room_no from message where member_no = ?";
		Object[] args = new Object[] { member_no };
		List room_no = jdbcTemplate.queryForList(sql, args, Integer.class);
		System.out.println("room_no = "+ room_no);
		System.out.println("room_no = "+ room_no.size());
		System.out.println("room_no = "+ room_no.get(0));
		return room_no;
	}
	
	public void update(String name, int price, int member_no, int room_no) {
		String sql = "update message set name = ?, price = ? where member_no = ? and room_no = ?";
		Object[] args = new Object[] { name, price, member_no, room_no };
		jdbcTemplate.update(sql, args);
	}
}
