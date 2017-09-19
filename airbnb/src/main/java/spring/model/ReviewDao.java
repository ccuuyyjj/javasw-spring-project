package spring.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<Review> mapper =(arg0,arg1)-> {
		return new Review(arg0);
		};

	//리뷰 작성
	public void insert(Review review) {
		String sql = "insert into review values(review_seq.nextval,?,?,?,?,sysdate)";
		jdbcTemplate.update(sql, new Object[] {review.getEmail(),review.getDetail(),review.getRating(),review.getRoom_no()});
	}

	//리뷰 리스트
	public List<Review> select(int page,int pagePosts,int id) {
		int start = (page - 1) * pagePosts + 1;
		int end = start + pagePosts - 1;
		String sql = "select * from (select rownum rn, a.* from "
				+ "(select * from review where room_no=? order by reg desc)"
				+ "a) where rn between "+start+" and "+end;
		
		return jdbcTemplate.query(sql, new Object[] {id},mapper);
	}
	
	//리뷰 갯수, 등급 평균
	public int count(int id){
		String sql ="select count(*) from review where room_no=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id},Integer.class);
	}
	public int avg(int id) {
		String sql ="select avg(rating) from review where room_no=?";
		if(jdbcTemplate.queryForObject(sql, new Object[] {id},Integer.class) == null)
			return 0;
		else
			return jdbcTemplate.queryForObject(sql, new Object[] {id},Integer.class);
			
		
	}
}
