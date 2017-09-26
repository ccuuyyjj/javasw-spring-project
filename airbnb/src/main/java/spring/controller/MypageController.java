package spring.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
import spring.model.Message;
import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;
import spring.model.Rsvp;
import spring.model.RsvpDao;
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
	@Autowired
	private RsvpDao rsvpDao;

	// 숙소 목록
	@RequestMapping("/rooms")
	public String rooms(Model m, UsernamePasswordAuthenticationToken token) {
		List<Room> host_list = roomDao.host_list(token.getName());
		m.addAttribute("host_list", host_list);
		return "mypage/rooms";
	}

	// 숙소 목록 삭제
	@RequestMapping("/room_del")
	@ResponseBody
	public String room_del(HttpServletRequest request) {
		roomDao.delete(request.getParameter("room_no"));
		return "result";
	}

	// 숙소 목록 - 예약관리
	@RequestMapping("/my_reservations")
	public String my_reservations(Model m, UsernamePasswordAuthenticationToken token) {
		List<Room> host_list = roomDao.host_list_complete(token.getName());
		// Map<Room, List<Rsvp>> map = new HashMap<>();
		Map<Integer, List<Rsvp>> map = new HashMap<>();
		for (Room room : host_list) {
			List<Rsvp> list = rsvpDao.select(room.getNo());
			map.put(room.getNo(), list);
		}
		m.addAttribute("host_list", host_list);
		m.addAttribute("map", map);
		return "mypage/my_reservations";
	}

	// 예약관리 - 예약 상태값 변경
	@RequestMapping("/rsvp_cng")
	@ResponseBody
	public String rsvp_cng(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		int progress = Integer.parseInt(request.getParameter("step"));

		boolean result = rsvpDao.status_update(no, progress);
		log.debug("result:" + result);
		if (result) {
			// 상태값이 변경될때 게스트에게 메시지로 알려준다.
			String msg = "회원님이 예약 요청하신 건이 [예약";
			switch (progress) {
			case 1:
				msg += "확인]";
				break;
			case 2:
				msg += "승낙]";
				break;
			case 3:
				msg += "거절]";
				break;
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
		} else {
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

	// 계정관리
	@RequestMapping("/setting")
	public String setting(Model m) {

		return "mypage/setting";
	}

	// 수령완료 숙소명 가져오기
	private void getHostName_history(Model m, String id) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Calendar c1 = Calendar.getInstance();
		String strToday = format.format(c1.getTime());
		List<Room> host_list = roomDao.host_list_complete(id);
		Map<Integer, String> r_name = new HashMap<>();
		try {
			for (Room room : host_list) {
				if (room.getProgress() == 4) {
					List<Rsvp> list = rsvpDao.select_complete(id);
					for (Rsvp rsvp : list) {
						if (rsvp.getRoom_no() == room.getNo()) {
							Date day1 = format.parse(rsvp.getEnddate());
							Date day2 = format.parse(strToday);
							if (day1.compareTo(day2) < 0) { // 수령완료
								// 숙소명이 길어서 앞부분만 일부 보여줌..
								String name = room.getName().substring(0, 10) + "...";
								r_name.put(room.getNo(), name);
							}
						}
					}
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		m.addAttribute("nameList", r_name);
		m.addAttribute("year", strToday.substring(0, 4));
	}

	// 계정관리 - 대금수령내역 - 수령완료내역
	@RequestMapping("/transaction_history")
	public String transaction_history(Model m, UsernamePasswordAuthenticationToken token) {
		getHostName_history(m, token.getName());
		return "mypage/transaction_history";
	}

	@RequestMapping(value = "/transaction_history", method = RequestMethod.POST)
	public String transaction_history(HttpServletRequest request, Model m, UsernamePasswordAuthenticationToken token)
			throws ParseException {
		String rName = request.getParameter("roomName");
		int room_no = 0;
		if (!rName.equalsIgnoreCase("all")) {
			room_no = Integer.parseInt(rName);
		}
		String year = request.getParameter("year");
		String sMonth = request.getParameter("startMonth");
		String eMonth = request.getParameter("endMonth");
		String sDate = year + sMonth;
		String eDate = year + eMonth;
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-mm");
		List<Rsvp> Rsvplist = rsvpDao.transaction_history(room_no, sDate, eDate, token.getName());

		Double sum = 0.0;
		Map<Integer, Room> map = new HashMap<>();
		// 숙박명 가져오기 위해
		for (Rsvp rsvp : Rsvplist) {
			sum += rsvp.getTotalprice();
			Room room = roomDao.select(rsvp.getRoom_no());
			map.put(rsvp.getRoom_no(), room);
		}

		getHostName_history(m, token.getName());
		m.addAttribute("cList", Rsvplist);
		m.addAttribute("map", map);
		m.addAttribute("room_no", room_no);
		m.addAttribute("year", year);
		m.addAttribute("sMonth", sMonth);
		m.addAttribute("eMonth", eMonth);
		m.addAttribute("total", sum);
		return "mypage/transaction_history";
	}

	// 수령예정 숙소명 가져오기
	private void getHostName_future(Model m, String id) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		Calendar c1 = Calendar.getInstance();
		String strToday = format.format(c1.getTime());
		List<Room> host_list = roomDao.host_list_complete(id);
		Map<Integer, String> r_name = new HashMap<>();
		try {
			for (Room room : host_list) {
				if (room.getProgress() == 4) {
					List<Rsvp> list = rsvpDao.select_complete(id);
					for (Rsvp rsvp : list) {
						if (rsvp.getRoom_no() == room.getNo()) {
							Date day1 = format.parse(rsvp.getEnddate());
							Date day2 = format.parse(strToday);
							if (day1.compareTo(day2) > 0) { // 수령예정
								// 숙소명이 길어서 앞부분만 일부 보여줌..
								String name = room.getName().substring(0, 10) + "...";
								r_name.put(room.getNo(), name);
							}
						}
					}
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		m.addAttribute("nameList", r_name);
	}

	// 계정관리 - 대금수령내역 - 수령 예정 내역
	@RequestMapping("/future_transactions")
	public String future_transactions(UsernamePasswordAuthenticationToken token, Model m) {
		getHostName_future(m, token.getName());
		return "mypage/future_transactions";
	}

	@RequestMapping(value = "/future_transactions", method = RequestMethod.POST)
	public String future_transactions(HttpServletRequest request, UsernamePasswordAuthenticationToken token, Model m) {
		String rName = request.getParameter("roomName");
		int room_no = 0;
		if (!rName.equalsIgnoreCase("all")) {
			room_no = Integer.parseInt(rName);
		}
		List<Rsvp> Rsvplist = rsvpDao.future_transactions(token.getName(), room_no);
		Double sum = 0.0;
		Map<Integer, Room> map = new HashMap<>();
		// 숙박명 가져오기 위해
		for (Rsvp rsvp : Rsvplist) {
			sum += rsvp.getTotalprice();
			Room room = roomDao.select(rsvp.getRoom_no());
			map.put(rsvp.getRoom_no(), room);
		}
		getHostName_future(m, token.getName());
		m.addAttribute("room_no", room_no);
		m.addAttribute("fList", Rsvplist);
		m.addAttribute("map", map);
		m.addAttribute("total", sum);

		return "mypage/future_transactions";
	}

	// 계정관리 - 대금수령내역 - 총 수입
	@RequestMapping("/tax_report")
	public String tax_report() {
		return "mypage/tax_report";
	}

	// 여행목록 - 예정된 여행
	@RequestMapping(value = "/trips")
	public String trips(Model m, UsernamePasswordAuthenticationToken token) {
		String id = token.getName();

		List<Rsvp> rsvp = rsvpDao.select(id, 1);
		m.addAttribute("rsvp", rsvp);

		return "mypage/trips";
	}

	// 여행목록 - 지나간 여행
	@RequestMapping("/old_trips")
	public String old_trips(Model m, UsernamePasswordAuthenticationToken token) {
		String id = token.getName();

		List<Rsvp> rsvp = rsvpDao.select(id, 2);

		m.addAttribute("rsvp", rsvp);

		return "mypage/old_trips";
	}

	@RequestMapping(value = "/wishlist", method = RequestMethod.POST)
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
		for (int i = 0; i < count; i++) {
			count = wishListDao.count(member_no, title.get(i).getTitle());
			roomcount.add(count);
		}

		m.addAttribute("title", title);
		m.addAttribute("count", count);
		m.addAttribute("roomcount", roomcount);
		return "mypage/wishlist";
	}

	@RequestMapping("/wishlistdetail/{wltitle}/{roomcount}")
	public String wishlistdetail(Model m, UsernamePasswordAuthenticationToken token,
			@PathVariable("wltitle") String wltitle, @PathVariable("roomcount") int roomcount) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		List<WishList> wishlist = wishListDao.Select(member_no, wltitle);
		List<Room> roomlist = new ArrayList<>();
		for (int i = 0; i < wishlist.size(); i++) {
			Room room = roomDao.select(wishlist.get(i).getRoom_no());
			roomlist.add(room);
		}
		m.addAttribute("roomlist", roomlist);
		m.addAttribute("wltitle", wltitle);
		m.addAttribute("roomcount", roomcount);

		return "mypage/wishlistdetail";
	}

	@RequestMapping("/wishlist2")
	public void wishlist2(Model m, UsernamePasswordAuthenticationToken token, HttpServletResponse response)
			throws IOException {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		List<WishList> title = wishListDao.titleSelect(member_no);
		log.debug("ajax로 옴");
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		for (int i = 0; i < title.size(); i++) {
			buffer.append("{");
			buffer.append("\"title\":\"");
			buffer.append(title.get(i).getTitle().trim());
			buffer.append("\"},");
		}
		buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		String result = buffer.toString();
		log.debug("buffer = " + result);

		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(result);
	}

	// 예약 취소
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam(value = "no") String no, UsernamePasswordAuthenticationToken token) {
		System.out.println("들어옴");
		String id = token.getName();
		boolean a = rsvpDao.delete(id, no);
		System.out.println("a =" + a);
		return String.valueOf(a);
	}
}
