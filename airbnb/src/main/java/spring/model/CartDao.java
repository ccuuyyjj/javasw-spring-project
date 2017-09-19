package spring.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Cart> rowMapper = (rs, index) -> {
		return new Cart(rs);
	};

	public void insert(Cart cart) {
		String sql = "insert into cart values(cart_seq.nextval, ? ,?, ?, ?, ?, sysdate)";
		Object[] args = new Object[] { cart.getRoom_no(), cart.getQuantity(), cart.getStartdate(), cart.getEnddate(),
				cart.getGuest_id() };

		jdbcTemplate.update(sql, args);
	}

	public Cart select(String id) {
		String sql = "select * from cart where guest_id = ? ";
		return jdbcTemplate.query(sql, new Object[] { id }, rowMapper).get(0);
	}
}
