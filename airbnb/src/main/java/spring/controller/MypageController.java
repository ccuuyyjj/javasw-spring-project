package spring.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.Member;
import spring.model.MemberDao;
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
	private MemberDao memberDao;

	@Autowired
	private RoomDao roomDao;

	@RequestMapping("/rooms")
	public String rooms(Model m) {
		List<Room> host_list = roomDao.host_list();
		m.addAttribute("host_list", host_list);
		return "mypage/rooms";
	}

	@RequestMapping("/message")
	public String message(Model m, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", messageDao.getMessage(member_no));
		return "sub/message";
	}

	@RequestMapping("/setting")
	public String setting(Model m) {

		return "mypage/setting";
	}

	@RequestMapping("/my_reservations")
	public String my_reservations(Model m) {
		return "mypage/my_reservations";
	}

	@RequestMapping("/transaction_history")
	public String transaction_history(Model m) {
		return "mypage/transaction_history";
	}

	@RequestMapping("/trips")
	public String trips(Model m) {
		return "mypage/trips";
	}
	
	@RequestMapping(value="/trips", method=RequestMethod.POST)
	public String trips(Model m, String address, String host, String checkin, String checkout) {
		m.addAttribute("address", address);
		m.addAttribute("host", host);
		m.addAttribute("checkin", checkin);
		m.addAttribute("checkout", checkout);
		return "mypage/trips";
	}

	@RequestMapping("/old_trips")
	public String old_trips(Model m) {
		return "mypage/old_trips";
	}
}
