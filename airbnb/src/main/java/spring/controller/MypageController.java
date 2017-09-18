package spring.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;
import spring.model.WishList;
import spring.model.WishListDao;

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
	
	@Autowired
	private WishListDao wishListDao;

	@RequestMapping("/rooms")
	public String rooms(Model m, UsernamePasswordAuthenticationToken token) {
		List<Room> host_list = roomDao.host_list(token.getName());
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

	@RequestMapping(value="/trips")
	public String trips(Model m) throws ParseException {
		int member_no = 1;
		List<WishList> wishList = wishListDao.select(member_no);
		log.debug("get - wishList = "+wishList);
		m.addAttribute("WishList", wishList);
		
//		Calendar now = Calendar.getInstance();
//		log.debug("시간 = "+now.getTime());
//		SimpleDateFormat format = new SimpleDateFormat("yy-mm-dd");
//		now.setTime(format.parse(wishList.get(0).getCheckin()));
//		log.debug("시간 = "+now.getTime());
		return "mypage/trips";
	}
	
	@RequestMapping(value="/trips", method=RequestMethod.POST)
	public void trips(Model m, WishList wishList) {
		wishListDao.insert(wishList);
		log.debug("post - wishList = "+wishList);
	}

	@RequestMapping("/old_trips")
	public String old_trips(Model m) {
		return "mypage/old_trips";
	}
	
	@RequestMapping("/room_del")
	@ResponseBody
	public String room_del(HttpServletRequest request) {
		roomDao.delete(request.getParameter("room_no"));
		return "result";
	}
	
}
