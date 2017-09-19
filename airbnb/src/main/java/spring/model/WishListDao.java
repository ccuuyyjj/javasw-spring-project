package spring.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class WishListDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	private RowMapper<WishList> rowMapper = (rs, index) -> {
		return new WishList(rs);
	};

	public void insert(WishList wishList) {
		String sql = "insert into wishlist values(wishlist_seq.nextval, ?, ?, ?, ?, ?, ?)";
		Object[] args = new Object[] { wishList.getMember_no(), wishList.getAddress(), wishList.getHostname(),
				wishList.getCheckin(), wishList.getCheckout(), wishList.getStatus() };
		jdbcTemplate.update(sql, args);
	}

	public List<WishList> select(int member_no) {
		String sql = "select * from wishlist where member_no = ? order by no desc";
		Object[] args = new Object[] { member_no };
		return jdbcTemplate.query(sql, args, rowMapper);
	}
}
