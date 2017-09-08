package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.MessageDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MessageDao messageDao;
	
	@RequestMapping("/rooms")
	public String rooms() {
		return "mypage/rooms";
	}
	
	@RequestMapping("/message")
	public String message(Model m, int member_no) {
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", messageDao.getMessage(member_no));
		return "sub/message";
	}
}
