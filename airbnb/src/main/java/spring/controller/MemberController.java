package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	MemberDao memberDao;

	//회원가입
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

}
