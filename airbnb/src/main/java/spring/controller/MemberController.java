package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberDao memberDao;

	@RequestMapping("/login")
	String login() {
		return "member/login";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping("/join")
	String join(Member member, @RequestHeader("referer") String referer) {
		memberDao.insert(member);
		return referer;
	}

	// 중복 이메일 검사
	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	String check(@RequestParam(value = "email") String email) {
		boolean result = memberDao.check(email);
		return String.valueOf(result);
	}
	
//	비밀번호 변경
	@RequestMapping(value= "/pw_update", method=RequestMethod.POST)
	String change(UsernamePasswordAuthenticationToken token,
				@RequestParam(value="pre_pw") String pre_pw,
				@RequestParam(value="pw") String pw,
				@RequestParam(value="pw_confirm") String pw_confirm) {
		String email = token.getName();
		
		System.out.println();
		System.out.println("email "+email);
		
		String a ="a";
		String b ="a";
		
		System.out.println(a==b);
		
		
		//이전 비밀번호 확인
		boolean result = memberDao.pw_check(email, pre_pw);
		if(result) {
			System.out.println("여기");
			return "redirect:../mypage/setting?result=pre_pw";
		}
		
		System.out.println("pw = "+ pw+"pw_confirm ="+pw_confirm);
		System.out.println(" == 사용"+pw == pw_confirm);
		System.out.println("equals 사용"+pw.equals(pw_confirm));
		
		//새 비밀번호 와 확인이 틀리면
		if(!pw.equals(pw_confirm)) {
			return "redirect:../mypage/setting?result=wrong";
		}
		
		
		memberDao.pwchange(pw,email);
		return "redirect:../mypage/setting?result=success";
	}
	
	//계정 삭제
	@RequestMapping("/delete")
	String delete(UsernamePasswordAuthenticationToken token,@RequestParam(value="pw")String pw) {
		String email = token.getName();
		
		
		
		//memberDao.delete(email, pw);
		return "home";
		
	}
}
