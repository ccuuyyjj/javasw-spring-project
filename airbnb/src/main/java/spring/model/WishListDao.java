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

	private RowMapper<WishList> rowMapper2 = (rs, index) -> {
		String title = "";
		return new WishList(rs, title);
	};

	public void insert(WishList wishList, int member_no) {
		String sql = "insert into wishlist values(wishlist_seq.nextval, ?, ?, ?)";
		Object[] args = new Object[] { member_no, wishList.getRoom_no(), wishList.getTitle() };
		jdbcTemplate.update(sql, args);
	}

	public List<WishList> titleSelect(int member_no) {
		String sql = "select DISTINCT title from wishlist where member_no = ?";
		Object[] args = new Object[] { member_no };
		return jdbcTemplate.query(sql, args, rowMapper2);
	}

	public List<WishList> Select(int member_no, String title) {
		String sql = "select * from wishlist where member_no = ? and title = ?";
		Object[] args = new Object[] { member_no, title };
		return jdbcTemplate.query(sql, args, rowMapper);
	}

	public int count(int member_no, String title) {
		String sql = "select count(room_no) from wishlist where member_no = ? and title = ?";
		Object[] args = new Object[] { member_no, title };
		return jdbcTemplate.queryForObject(sql, args, Integer.class);
	}
}
