package spring.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javassist.runtime.Desc;
import spring.model.Message;
import spring.model.MessageDao;
import spring.model.Room;
import spring.model.RoomDao;

@Controller
@RequestMapping("/sub")
public class SubController {
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private MessageDao messageDao;

	@RequestMapping("/sub_list")
	public String sub(Model m, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "location", required = false, defaultValue = "") String location,
			@RequestParam(value = "startDate", required = false, defaultValue = "") String startDate,
			@RequestParam(value = "endDate", required = false, defaultValue = "") String endDate,
			@RequestParam(value = "amount", required = false, defaultValue = "0") Integer amount,
			@RequestParam(value = "type", required = false, defaultValue = "") String types,
			@RequestParam(value = "price", required = false, defaultValue = "0,1000000") int[] price,
			@RequestParam(value = "filter", required = false, defaultValue = "0,0") int[] filter)
			throws ParseException {
		System.out.println("sub");
		/*
		 * type = 방 유형 price = 숙박 가격 filter = 침실, 침대, 욕실 순
		 */
		List<String> type_list = new ArrayList<>();
		List<Object> args_list = new ArrayList<>();
		// 페이징 네비게이터
		int totalPost = roomDao.count(); // 게시물 수
		int pagePosts = 21; // 현재 페이지 출력될 게시물 수
		int totalPage = (totalPost + pagePosts - 1) / pagePosts; // 총 페이지 수
		int countPage = 3; // 화면에 출력될 페이지 수
		int start = (page - 1) / countPage * countPage + 1; // 현재페이지에서 시작 페이지
		int end = start + countPage - 1; // 현재페이지에서 끝 페이지

		// start , end 재설정 ( 이전, 다음 페이지 )
		if (start > countPage && page != end)
			start -= 1; // 이전페이지 (현재 페이지가 4일때 start는 3)
		if (page <= end)
			end = start + countPage; // 다음페이지

		// end 가 총페이지를 넘는 걸 방지
		if (end > totalPage) {
			end = totalPage;
			start -= 2;
		}
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

	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id, Model m) {
		m.addAttribute("room", roomDao.select(id));
		return "sub/detail";
	}

	@RequestMapping("/message")
	public String message(Model m, UsernamePasswordAuthenticationToken token) {
		int member_no = 1;
		List no = messageDao.getRoom_no(member_no);
		List<Room> roomList = new ArrayList<>();
		List<Message> message = new ArrayList<>();
		for (int i = 0; i < no.size(); i++) {
			Room room = roomDao.select((int) no.get(i));
			roomList.add(room);
			System.out.println("room = " + roomList.get(i));
			messageDao.update(roomList.get(i).getName(), roomList.get(i).getPrice(), member_no,
					roomList.get(i).getNo());
			Message getMessage = messageDao.Message(member_no, (int) no.get(i));
			message.add(getMessage);
			Collections.sort(message, new Comparator<Message>() {

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
		System.out.println("message = " + message.get(0).toString());
		System.out.println("message = " + message.get(1).toString());
		return "sub/message";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(Message message) {
		System.out.println(message.toString());
		messageDao.insert(message);
		return "redirect:/";
	}

	@RequestMapping("/messageDetail/{room_no}")
	public String messageDetail(@PathVariable("room_no") int room_no, Model m) {
		int member_no = 1;
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
		messageDao.insert(message);
		m.addAttribute("message", message);
		m.addAttribute("checkin", message.getCheckin());
		m.addAttribute("checkout", message.getCheckout());
		m.addAttribute("name", message.getName());
		m.addAttribute("quantity", message.getQuantity());
		m.addAttribute("price", message.getPrice());

		return "redirect:/sub/messageDetail/" + room_no;
	}
}
