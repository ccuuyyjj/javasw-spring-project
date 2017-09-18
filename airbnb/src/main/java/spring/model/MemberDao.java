package spring.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
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
	
	//이전 비밀번호  확인
	public boolean pw_check(String email,String pre_pw) {
		String sql ="select count(*) from member where email=? and pw=? ";

		// 조회가 있다고 뜬다면 ==0 로 false 가 반환된다
		return jdbcTemplate.queryForObject(sql,new Object[] {email,pre_pw},Integer.class) ==0; 
	}
	
	//비밀 번호 변경
	public void pwchange(String pw,String email) {
		String sql ="update member set pw=? where email=?";
		
		jdbcTemplate.update(sql,new Object[] {pw,email});
	}
	
	//계정 해지
	public void delete(String email,String pw) {
		String sql ="delete member where email=? and pw=?";
		
		jdbcTemplate.update(sql,new Object[] {email,pw});
	}
	
	private RowMapper<Member> rowMapper = (rs, i) -> {
		Member member = new Member(rs);	
		return member;
	};
	
	public Member select(String username){
		String sql = "select * from member where email = ?";
		return jdbcTemplate.query(sql, new Object[] {username}, rowMapper).get(0);
	}
	public Member select(int no){
		String sql = "select * from member where no = ?";
		return jdbcTemplate.query(sql, new Object[] {no}, rowMapper).get(0);
	}
	}
