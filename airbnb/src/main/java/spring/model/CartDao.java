package spring.model;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

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
		String sql = "insert into cart values(cart_seq.nextval, ? ,?, ?, ?, ?, sysdate)";
		Object[] args = new Object[] { 
							cart.getRoom_no(), cart.getQuantity(), cart.getStartdate(), 
							cart.getEnddate(), cart.getGuest_id() };

		jdbcTemplate.update(sql, args);
	}
	
	public Cart select(String id, int room_no) {
		String sql = "select * from cart where guest_id = ? and room_no = ? order by no desc";
		Object[] args = new Object[] {id, room_no};
		return jdbcTemplate.query(sql, args, rowMapper).get(0);
	}
}
