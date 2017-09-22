package spring.controller;

import java.util.ArrayList;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
import spring.model.Message;
import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;

import spring.model.RsvpDao;
import spring.model.WishList;

import spring.model.Rsvp;

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
	//숙소 목록 삭제
	@RequestMapping("/room_del")
	@ResponseBody
	public String room_del(HttpServletRequest request) {
		roomDao.delete(request.getParameter("room_no"));
		return "result";
	}
		
	//숙소 목록 - 예약관리
	@RequestMapping("/my_reservations")
	public String my_reservations(Model m, UsernamePasswordAuthenticationToken token) {
		List<Room> host_list = roomDao.host_list_complete(token.getName());
		//Map<Room, List<Rsvp>> map = new HashMap<>();
		Map<Integer, List<Rsvp>> map = new HashMap<>();
		for(Room room : host_list) {
			List<Rsvp> list = rsvpDao.select(room.getNo());
			map.put(room.getNo(), list);
		}
		m.addAttribute("host_list", host_list);
		m.addAttribute("map", map);
		return "mypage/my_reservations";
	}
	
	//예약관리 - 예약 상태값 변경
	@RequestMapping("/rsvp_cng")
	@ResponseBody
	public String rsvp_cng(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		int progress = Integer.parseInt(request.getParameter("step"));
		
		boolean result = rsvpDao.status_update(no, progress);
		log.debug("result:"+result);
		if(result) {
			//상태값이 변경될때 게스트에게 메시지로 알려준다.
			String msg = "회원님이 예약 요청하신 건이 [예약";
			switch(progress) {
				case 1: msg += "확인]"; break;
				case 2: msg += "승낙]"; break;
				case 3: msg += "거절]"; break;
			}
			msg += " 되었습니다";
			
			Rsvp rsvp = rsvpDao.select_no(no);
			Member member = memberDao.select(rsvp.getGuest_id());
			Room room = roomDao.select(rsvp.getRoom_no());
			
			Message message = new Message();
			message.setMember_no(member.getNo()); 
			message.setRoom_no(rsvp.getRoom_no()); 
			message.setCheckin(rsvp.getStartdate().substring(0, 10).replace("-", "/"));
			message.setCheckout(rsvp.getEnddate().substring(0, 10).replace("-", "/")); 
			message.setQuantity(rsvp.getQuantity()); 
			message.setQuestion(msg); 
			message.setName(room.getName());
			message.setPrice(room.getPrice());
			
			messageDao.insert(message, member.getNo());
			return "OK";
		} 
		else {
			return "Fail";
		}
	}
	
	@RequestMapping("/message")
	public String message(Model m, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", messageDao.getMessage(member_no));
		return "sub/message";
	}
	
	//계정관리
	@RequestMapping("/setting")
	public String setting(Model m) {

		return "mypage/setting";
	}
	
	//계정관리 - 대금수령내역 - 수령완료내역
	@RequestMapping("/transaction_history")
	public String transaction_history(Model m, UsernamePasswordAuthenticationToken token)  {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = format.format(c1.getTime());
        log.debug("strToday:"+strToday.substring(0, 4));
        List<Room> host_list = roomDao.host_list_complete(token.getName());
		Map<Integer, String> r_name = new HashMap<>();
		try {
			for(Room room : host_list) {
				if( room.getProgress() == 4) {
					List<Rsvp> list = rsvpDao.select_complete(room.getNo());
					for(Rsvp rsvp : list) {
						Date day1 = format.parse(rsvp.getEnddate());
						Date day2 = format.parse(strToday);
						if(day1.compareTo(day2) < 0) {
							//숙소명이 길어서 앞부분만 일부 보여줌..
							String name = room.getName().substring(0, 10)+"...";
							r_name.put(room.getNo(), name);
						}
					}
				}
			}
		} catch(ParseException e) {
			e.printStackTrace();
		}
		
		m.addAttribute("nameList", r_name);
		m.addAttribute("today", strToday.substring(0, 4));
		return "mypage/transaction_history";
	}
	
	@RequestMapping(value="/transaction_history", method=RequestMethod.POST)
	public String transaction_history(HttpServletRequest request) throws ParseException {
		String[] arr 			= request.getParameter("roomName").split("|");
		int room_no 		= Integer.parseInt(arr[0]);
		String year 			= request.getParameter("year");
		String sMonth		= request.getParameter("startMonth");
		String eMonth	= request.getParameter("endMonth");
		
		
		//rsvpDao.sum_price(room_no, year, startMonth, endMonth);
		
		
		return "mypage/transaction_history";
	}
	
	//계정관리 - 대금수령내역 - 수령 예정 내역
	@RequestMapping("/future_transactions")
	public String future_transactions(){
		
		return "mypage/future_transactions";
	}
	
	
	//계정관리 - 대금수령내역 - 총 수입
	@RequestMapping("/tax_report")
	public String tax_report() {
		return "mypage/tax_report";
	}
	
	
	//여행목록 - 예정된 여행
	@RequestMapping(value = "/trips")
	public String trips(Model m, UsernamePasswordAuthenticationToken token) {
		String id = token.getName();
		
		List<Rsvp> rsvp = rsvpDao.select(id);
		List<Room> room = new ArrayList<>();
		
		for(Rsvp list:rsvp) {
			room.add(roomDao.select(list.getRoom_no()));
		}
		
		m.addAttribute("rsvp",rsvp);
		m.addAttribute("roomList",room);
		return "mypage/trips";
	}
	
	//여행목록 - 지나간 여행
	@RequestMapping("/old_trips")
	public String old_trips(Model m,UsernamePasswordAuthenticationToken token) {

		
		
		return "mypage/old_trips";
	}
	
	@RequestMapping(value="/wishlist", method=RequestMethod.POST)
	public void wishlist(Model m, WishList wishList, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		wishListDao.insert(wishList, member_no);
	}
	
	@RequestMapping("/wishlist")
	public String wishlist(Model m, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		List<WishList> title = wishListDao.titleSelect(member_no);
		int count = wishListDao.count(member_no);
		List<Integer> roomcount = new ArrayList<>();
		for(int i=0; i < count; i++) {
			count = wishListDao.count(member_no, title.get(i).getTitle());
			roomcount.add(count);
		}
		
		m.addAttribute("title", title);
		m.addAttribute("count", count);
		m.addAttribute("roomcount", roomcount);
		return "mypage/wishlist";
	}
}
