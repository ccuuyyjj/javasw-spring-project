package spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;
import spring.model.Rsvp;
import spring.model.RsvpDao;
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
	
	@Autowired
	private RsvpDao rsvpDao;
	
	//숙소 목록
	@RequestMapping("/rooms")
	public String rooms(Model m, UsernamePasswordAuthenticationToken token) {
		List<Room> host_list = roomDao.host_list(token.getName());
		m.addAttribute("host_list", host_list);
		return "mypage/rooms";
	}
	//숙소 목록 - 예약관리
	@RequestMapping("/my_reservations")
	public String my_reservations(Model m) {
		List<Room> host_list = roomDao.host_list_complete();
		Map<Room, List<Rsvp>> map = new HashMap<>();
		
		for(Room room : host_list) {
			List<Rsvp> list = rsvpDao.select(room.getNo());
			map.put(room, list);
		}
		
		m.addAttribute("host_list", host_list);
		
		
		return "mypage/my_reservations";
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

	@RequestMapping("/transaction_history")
	public String transaction_history(Model m) {
		return "mypage/transaction_history";
	}

	@RequestMapping(value = "/trips")
	public String trips(Model m) {
		return "mypage/trips";
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

	@RequestMapping("/wishlist")
	public String wishlist(Model m/*, WishList wishList*/) {
		//wishListDao.insert(wishList);
		return "mypage/wishlist";
	}
	
//	@RequestMapping(value="/wishlist", method=RequestMethod.POST)
//	public String wishlist(Model m) {
//		int member_no=1;
//		List<WishList> wishList = wishListDao.select(member_no);
//		m.addAttribute("wishList", wishList);
//		return "mypage/wishlist";
//	}
}
