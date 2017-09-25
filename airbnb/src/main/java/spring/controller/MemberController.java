package spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
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
	private Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	MemberDao memberDao;

	@RequestMapping("/login")
	String login(UsernamePasswordAuthenticationToken token,
			@RequestHeader(required = false, value = "referer", defaultValue = "/") String referer,
			HttpServletRequest request) throws Exception {
		if (token != null)
			throw new Exception("이미 로그인된 상태입니다.");
		log.debug("referer:" + referer);

		if (referer.indexOf("login") >= 0) {
			referer = "http://localhost:8080/airbnb/home";
		}
		request.getSession().setAttribute("prevPage", referer);

		return "member/login";
	}

	// 회원가입
	@ResponseBody
	@RequestMapping("/join")
	String join(UsernamePasswordAuthenticationToken token, Member member,
			@RequestHeader(required = false, value = "referer", defaultValue = "/") String referer) throws Exception {
		if (token != null)
			throw new Exception("이미 로그인된 상태입니다.");
		if (member != null)
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

	// 비밀번호 변경
	@RequestMapping(value = "/pw_update", method = RequestMethod.POST)
	String change(UsernamePasswordAuthenticationToken token, @RequestParam(value = "pre_pw") String pre_pw,
			@RequestParam(value = "pw") String pw, @RequestParam(value = "pw_confirm") String pw_confirm) {
		String email = token.getName();

		System.out.println("email " + email);

		// 이전 비밀번호 확인
		boolean result = memberDao.pw_check(email, pre_pw);
		if (!result) {
			System.out.println("여기");
			return "redirect:../mypage/setting?result=pre_pw";
		}

		System.out.println("pw = " + pw + "pw_confirm =" + pw_confirm);
		System.out.println(" == 사용" + pw == pw_confirm);
		System.out.println("equals 사용" + pw.equals(pw_confirm));

		// 새 비밀번호 와 확인이 틀리면
		if (!pw.equals(pw_confirm)) {
			return "redirect:../mypage/setting?result=wrong";
		}

		memberDao.pwchange(pw, email);
		return "redirect:../mypage/setting?result=success";
	}

	// 계정 삭제
	@RequestMapping("/delete")
	String delete(UsernamePasswordAuthenticationToken token, @RequestParam(required = false, value = "pw") String pw) {
		String email = token.getName();
		boolean result = memberDao.delete(email, pw);
		if (result) {
			return "redirect:../mypage/setting?result=delete";
		} else {
			System.out.println("여기?");
			return "redirect:/logout";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}
}
