package spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@RequestMapping("/rooms")
	public String rooms(Model m) {
		List<Room> host_list = roomDao.host_list();
		m.addAttribute("host_list", host_list);
		return "mypage/rooms";
	}
	
	@RequestMapping("/message")
	public String message(Model m, int member_no) {
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", messageDao.getMessage(member_no));
		return "sub/message";
	}
	
	@RequestMapping("/setting")
	public String setting(Model m) {
		
		return "mypage/setting";
	}
}
