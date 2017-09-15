package spring.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 회원가입
	public void insert(Member member) {
		int no = jdbcTemplate.queryForObject("select member_seq.nextval from dual", Integer.class);

		String sql = "insert into member values(?,?,?,?,?,'true','role_member',sysdate)";
		Object[] args = new Object[] { no, member.getEmail(), member.getPw(), member.getName(), member.getPhone(), };
		jdbcTemplate.update(sql, args);
	}

	// 이메일 중복 확인
	public boolean check(String email) {
		String sql = "select count(*) from member where email=? ";

		// 조회가 있다고 뜬다면 ==0 로 false 가 반환된다
		return jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class) == 0;
	}

}
