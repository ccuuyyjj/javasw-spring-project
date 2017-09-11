package spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.model.Member;
import spring.model.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberDao memberDao;
	
	@RequestMapping("/join")
	String join(Member member,@RequestHeader("referer")String referer){
		System.out.println("controller"+member.toString());
		
		memberDao.insert(member);
		
		return "redirect:"+referer;
	}
}
