package spring.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PasswordEncoder encoder;

	// 회원가입
	public void insert(Member member) {
		int no = jdbcTemplate.queryForObject("select member_seq.nextval from dual", Integer.class);
		String sql = "insert into member values(?,?,?,?,?,'true','role_member',sysdate)";
		String securepw = encoder.encode(member.getPw());
		Object[] args = new Object[] { no, member.getEmail(),securepw, member.getName(), member.getPhone(), };
		jdbcTemplate.update(sql, args);
	}

	// 이메일 중복 확인
	public boolean check(String email) {
		String sql = "select count(*) from member where email=? ";

		// 조회가 있다고 뜬다면 ==0 로 false 가 반환된다
		return jdbcTemplate.queryForObject(sql, new Object[] { email }, Integer.class) == 0;
	}

	// 이전 비밀번호 확인
	public boolean pw_check(String email, String pre_pw) {
		String origin = jdbcTemplate.queryForObject("select pw from member where email=?",String.class, email);
		// 조회가 있다고 뜬다면 ==0 로 false 가 반환된다
		return encoder.matches(pre_pw, origin);
	}

	// 비밀 번호 변경
	public void pwchange(String pw, String email) {
		String sql = "update member set pw=? where email=?";
		jdbcTemplate.update(sql, new Object[] { encoder.encode(pw), email });
	}

	// 계정 해지
	public boolean delete(String email, String pw) {
		String origin = jdbcTemplate.queryForObject("select pw from member where email=?",String.class, email);
		
		if(encoder.matches(pw,origin)) {
			jdbcTemplate.update("delete member where email=?", new Object[] {email});
			return false;
		}else {
			return true;
		}
	}

	private RowMapper<Member> rowMapper = (rs, i) -> {
		Member member = new Member(rs);
		return member;
	};

	public Member select(String username) {
		String sql = "select * from member where email = ?";
		return jdbcTemplate.query(sql, new Object[] { username }, rowMapper).get(0);
	}

	public Member select(int no) {
		String sql = "select * from member where no = ?";
		return jdbcTemplate.query(sql, new Object[] { no }, rowMapper).get(0);
	}

	public List<Member> selectAll() {
		String sql = "select * from member order by no";
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	public boolean modify(Member m) {
		try {
			
			if(m.getNo() != 0) {
				Member orig = select(m.getNo());
				if(m.getEmail() != null 
						&& !m.getEmail().isEmpty() 
						&& !orig.getEmail().equals(m.getEmail())) {
					return false;	//수정불가
				}
				if(m.getPw() != null 
						&& !m.getPw().isEmpty() 
						&& !encoder.matches(m.getPw(),orig.getPw())) {
					String sql = "update member set pw = ? where no = ?";
					if(jdbcTemplate.update(sql, encoder.encode(m.getPw()), m.getNo()) < 0)
						return false;
				}
				if(m.getName() != null 
						&& !m.getName().isEmpty() 
						&& !orig.getName().equals(m.getName())) {
					String sql = "update member set name = ? where no = ?";
					if(jdbcTemplate.update(sql, m.getName(), m.getNo()) < 0)
						return false;
				}
				if(m.getPhone() != null 
						&& !m.getPhone().isEmpty() 
						&& !orig.getPhone().equals(m.getPhone())) {
					String sql = "update member set phone = ? where no = ?";
					if(jdbcTemplate.update(sql, m.getPhone(), m.getNo()) < 0)
						return false;
				}
				if(m.getAuthority() != null 
						&& !m.getAuthority().isEmpty() 
						&& !orig.getAuthority().equals(m.getAuthority())) {
					String sql = "update member set authority = ? where no = ?";
					if(jdbcTemplate.update(sql, m.getAuthority(), m.getNo()) < 0)
						return false;
				}
				if(m.getReg() != null 
						&& !m.getReg().isEmpty() 
						&& !orig.getReg().equals(m.getReg())) {
					return false;	//수정불가
				}
				return true;	//수정완료
			}
			return false;
		} catch(Exception e) {
			return false;
		}
	}
}
