package spring.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert (Member member) {
		int no = jdbcTemplate.queryForObject("select member_seq.nextval from dual", Integer.class);
		
		String sql = "insert into member values(?,?,?,?,?,'true','role_member',sysdate)";
		Object[] args = new Object[] {
				no,member.getEmail(),member.getPw(),member.getName(),member.getPhone(),
		};
		jdbcTemplate.update(sql,args);
	}
	
	
	
}
