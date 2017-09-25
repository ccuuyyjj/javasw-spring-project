package spring.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao {
	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Cart> rowMapper = (rs, index) -> {
		Cart cart = new Cart(rs);
		return cart;
	};

	public void insert(Cart cart) {
		String sql = "insert into cart values(cart_seq.nextval, ? ,?, ?, ?, ?, sysdate, ?)";
		Object[] args = new Object[] { cart.getRoom_no(), cart.getDiffdays(), cart.getStartdate(), cart.getEnddate(),
				cart.getGuest_id(), cart.getQuantity() };

		jdbcTemplate.update(sql, args);
	}

	public Cart select(String id) {
		String sql = "select * from cart where guest_id = ? ";
		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper).get(0);

	}

	public Cart select(String id, int room_no) {
		String sql = "select * from cart where guest_id = ? and room_no = ? order by no desc";
		Object[] args = new Object[] { id, room_no };
		return jdbcTemplate.query(sql, args, rowMapper).get(0);
	}

	public Cart select(int no) {
		String sql = "select * from cart where no = ?  ";
		return jdbcTemplate.query(sql, new Object[] { no }, rowMapper).get(0);
	}

	public void delete(int no) {
		jdbcTemplate.update("delete cart where no = ?", new Object[] { no });
	}
}
