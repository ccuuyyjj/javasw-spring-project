package spring.controller;

import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

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

import spring.model.AvailDao;
import spring.model.Cart;
import spring.model.CartDao;
import spring.model.Member;
import spring.model.MemberDao;
import spring.model.Message;
import spring.model.MessageDao;
import spring.model.Review;
import spring.model.ReviewDao;
import spring.model.Room;
import spring.model.RoomDao;
import spring.model.Rsvp;
import spring.model.RsvpDao;

@Controller
@RequestMapping("/sub")
public class SubController {
	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private RoomDao roomDao;
	@Autowired
	private MessageDao messageDao;
	@Autowired
	private AvailDao availDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private RsvpDao rsvpDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private CartDao cartDao;

	// 목록
	@RequestMapping("/sub_list")
	public String sub(Model m, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value = "amount", required = false) Integer amount,
			@RequestParam(value = "type", required = false) String types,
			@RequestParam(value = "price", required = false) int[] price,
			@RequestParam(value = "filter", required = false, defaultValue = "0,0") int[] filter)
			throws ParseException {
		// System.out.println("sub");
		/*
		 * type = 방 유형 price = 숙박 가격 filter = 침실, 침대, 욕실 순
		 */
		List<String> type_list = new ArrayList<String>();
		List<Object> args_list = new ArrayList<>();
		// 페이징 네비게이터
		int totalPost = roomDao.count(); // 게시물 수
		int pagePosts = 21; // 현재 페이지 출력될 게시물 수
		int totalPage = (totalPost + pagePosts - 1) / pagePosts; // 총 페이지 수
		int countPage = 3; // 화면에 출력될 페이지 수
		int start = (page - 1) / countPage * countPage + 1; // 현재페이지에서 시작 페이지
		int end = start + countPage - 1; // 현재페이지에서 끝 페이지
		// start , end 재설정 ( 이전, 다음 페이지 )
		if (start > countPage && page != end) {
			start -= 1; // 이전페이지 (현재 페이지가 4일때 start는 3)
		}
		if (page <= end) {
			end = start + countPage; // 다음페이지
		}

		// end 가 총페이지를 넘는 걸 방지
		if (end > totalPage) {
			end = totalPage;
			if (totalPage > 4) { // 총 페이지 수가 4미만 일때 오류 or 페이징 숫자와 시작페이지가 같이 나옴
				if (totalPage - start == 2) {
					start -= 1;
				} else {
					start -= 2;
				}
			}
		}

		int avg = availDao.avgPrice();
		m.addAttribute("rating", reviewDao.avg());
		m.addAttribute("avg", avg);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("page", page);
		m.addAttribute("totalPage", totalPage);

		if (startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {
			type_list.add("date");
			args_list.add(startDate + "~" + endDate);
		}

		if (location != null && !location.isEmpty()) {
			type_list.add("region");
			args_list.add(location);
		}

		if (amount != null) {
			type_list.add("capacity");
			args_list.add(amount);
		}

		if (types != null && !types.isEmpty()) {
			String[] type = types.split(",");
			type_list.add("type");
			for (String str : type)
				System.out.println("type = " + str);
			args_list.add(type);
		}

		if (price != null && price.length != 0) {
			type_list.add("price");
			args_list.add(price);
		}

		if (filter != null && filter.length != 0) {
			type_list.add("filter");
			args_list.add(filter);
		}

		List<Room> list = roomDao.search(page, pagePosts, type_list.toArray(), args_list.toArray());

		m.addAttribute("list", list);
		return "sub/sub_list";
	}

	// 상세페이지
	@RequestMapping("/detail/{no}")
	public String detail(@PathVariable("no") int no, Model m,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			UsernamePasswordAuthenticationToken token) {
		log.debug("token = " + token);
		if (token != null) {
			m.addAttribute("username", token.getName());
		}
		// 페이징 네비게이터
		int totalPost = reviewDao.count(no); // 게시물 수
		int pagePosts = 5; // 현재 페이지 출력될 게시물 수
		int totalPage = (totalPost + pagePosts - 1) / pagePosts; // 총 페이지 수
		int countPage = 3; // 화면에 출력될 페이지 수
		int start = (page - 1) / countPage * countPage + 1; // 현재페이지에서 시작 페이지
		int end = start + countPage - 1; // 현재페이지에서 끝 페이지
		// start , end 재설정 ( 이전, 다음 페이지 )
		if (start > countPage && page != end) {
			start -= 1; // 이전페이지 (현재 페이지가 4일때 start는 3)
		}
		if (page <= end) {
			end = start + countPage; // 다음페이지
		}

		// end 가 총페이지를 넘는 걸 방지
		if (end > totalPage) {
			end = totalPage;
			if (totalPage > 4) { // 총 페이지 수가 4미만 일때 오류 or 페이징 숫자와 시작페이지가 같이 나옴
				if (totalPage - start == 2) {
					start -= 1;
				} else {
					start -= 2;
				}
			}
		}

		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("page", page);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("exist", "true");

		m.addAttribute("room", roomDao.select(no));
		m.addAttribute("availList", availDao.selectAvailable(no));
		System.out.println(pagePosts + "게시물 수");
		m.addAttribute("review", reviewDao.select(page, pagePosts, no));
		m.addAttribute("total", reviewDao.count(no));
		m.addAttribute("avg", reviewDao.avg(no));

		return "sub/detail";
	}

	// 예약 가능 요청
	@RequestMapping(value = "/detail/{id}", method = RequestMethod.POST)
	public String detail(@PathVariable("id") int id, HttpServletRequest request,
			UsernamePasswordAuthenticationToken token, Model m) {
		log.debug("id: " + id);
		String email = token.getName();
		@SuppressWarnings("unused")
		Member member = memberDao.select(email);
		Cart cart = new Cart();
		cart.setRoom_no(id);
		cart.setGuest_id(email);
		cart.setDiffdays(Integer.parseInt(request.getParameter("diffdays")));
		cart.setStartdate(request.getParameter("checkin"));
		cart.setEnddate(request.getParameter("checkout"));
		cart.setQuantity(Integer.parseInt(request.getParameter("qty")));

		cartDao.insert(cart);

		return "redirect:/sub/book/{id}";
	}

	// 예약 요청 확인
	@RequestMapping("/book/{room_no}")
	public String book(@PathVariable("room_no") int room_no, Model m, UsernamePasswordAuthenticationToken token) {

		Cart cart = cartDao.select(token.getName(), room_no);
		Room room = roomDao.select(room_no);
		int totalprice = cart.getDiffdays() * room.getPrice();

		m.addAttribute("total_price", totalprice);
		m.addAttribute("cart", cart);
		m.addAttribute("room", room);
		m.addAttribute("room_price", room.getPrice());
		return "sub/book";
	}

	// 예약 저장
	@RequestMapping(value = "/book", method = RequestMethod.POST)
	public String book(@RequestParam(value = "c_no", required = true, defaultValue = "-1") int c_no,
			UsernamePasswordAuthenticationToken token, Model m) throws Exception {
		int totalprice = 0;

		Member member = memberDao.select(token.getName());
		Cart cart = cartDao.select(c_no);
		Room room = roomDao.select(cart.getRoom_no());

		totalprice = cart.getDiffdays() * room.getPrice();

		// 예약번호 생성 : 시간+랜덤숫자3자리
		long time = System.currentTimeMillis();
		Format format = new SimpleDateFormat("yMMdhhmmss");
		String strTime = format.format(time);
		Random random = new Random();
		int rnd = random.nextInt(1000) + 100;
		if (rnd > 1000)
			rnd -= 100;
		String r_id = strTime + rnd;

		Rsvp rsvp = new Rsvp();
		rsvp.setRoom_no(cart.getRoom_no());
		rsvp.setGuest_id(cart.getGuest_id());
		rsvp.setQuantity(cart.getQuantity());
		rsvp.setPhone(member.getPhone());
		rsvp.setStartdate(cart.getStartdate().substring(0, 10));
		rsvp.setEnddate(cart.getEnddate().substring(0, 10));
		rsvp.setTotalprice(totalprice);
		rsvp.setProgress(0); // 0:예약요청, 1:예약확인, 2:예약승낙, 9:예약거부
		rsvp.setR_id(r_id);
		rsvp.setAddress(room.getAddress());
		rsvp.setOwner_id(room.getOwner_id());
		rsvp.setGuest_name(member.getName());

		rsvpDao.insert(rsvp);
		cartDao.delete(c_no); // 예약 가능 요청이 완료되었기에 cart테이블에선 삭제해준다.
		return "redirect:/sub/book_end";
	}

	// 예약 확인 요청 끝
	@RequestMapping("/book_end")
	public String book_end() {
		return "sub/book_end";
	}

	// 이하 메시지 관련
	@RequestMapping("/message")
	public String message(Model m, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		List<Integer> no = messageDao.getRoom_no(member_no);
		List<Room> roomList = new ArrayList<>();
		List<Message> message = new ArrayList<>();
		for (int i = 0; i < no.size(); i++) {
			Room room = roomDao.select(no.get(i));
			roomList.add(room);
			messageDao.update(roomList.get(i).getName(), roomList.get(i).getPrice(), member_no,
					roomList.get(i).getNo());
			Message getMessage = messageDao.Message(member_no, no.get(i));
			message.add(getMessage);
			Collections.sort(message, new Comparator<Message>() {

				@Override
				public int compare(Message o1, Message o2) {
					if (o1.getNo() < o2.getNo()) {
						return 1;
					} else if (o1.getNo() > o2.getNo()) {
						return -1;
					} else {
						return 0;
					}
				}
			});
		}
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", message);
		return "sub/message";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(Message message, UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		messageDao.insert(message, member_no);
		return "redirect:/";
	}

	@RequestMapping("/messageDetail/{room_no}")
	public String messageDetail(@PathVariable("room_no") int room_no, Model m,
			UsernamePasswordAuthenticationToken token) {
		Member member = memberDao.select(token.getName());
		int member_no = member.getNo();
		List<Message> message = messageDao.getMessage(member_no, room_no);
		m.addAttribute("message", message);
		m.addAttribute("checkin", message.get(0).getCheckin());
		m.addAttribute("checkout", message.get(0).getCheckout());
		m.addAttribute("name", message.get(0).getName());
		m.addAttribute("quantity", message.get(0).getQuantity());
		m.addAttribute("price", message.get(0).getPrice());

		return "sub/messageDetail";
	}

	@RequestMapping(value = "/messageDetail/{room_no}", method = RequestMethod.POST)
	public String messageDetail(@PathVariable("room_no") int room_no, Model m, Message message) {
		messageDao.insert(message, message.getMember_no());
		m.addAttribute("message", message);
		m.addAttribute("checkin", message.getCheckin());
		m.addAttribute("checkout", message.getCheckout());
		m.addAttribute("name", message.getName());
		m.addAttribute("quantity", message.getQuantity());
		m.addAttribute("price", message.getPrice());

		return "redirect:/sub/messageDetail/" + room_no;
	}

	// 리뷰 작성
	@RequestMapping(value = "/review/{room_no}", method = RequestMethod.POST)
	public String insert(UsernamePasswordAuthenticationToken token, Model m, Review review) {
		review.setEmail(token.getName());

		reviewDao.insert(review);
		return "redirect:/sub/detail/" + review.getRoom_no();
	}
}
