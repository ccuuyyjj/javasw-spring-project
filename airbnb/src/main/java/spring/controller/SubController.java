package spring.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate,
			@RequestParam(value="amount", required = false) Integer amount,
			@RequestParam(value="type", required = false) String[] type,
			@RequestParam(value="price", required = false) int[] price,
			@RequestParam(value="filter",required=false, defaultValue= "0,0") int[] filter ) throws ParseException {
		/*
		 * 	type = 방 유형
		 * price = 숙박 가격
		 * filter = 침실, 침대, 욕실 순
		 * */
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

		if(startDate != null && endDate != null && !startDate.isEmpty() && !endDate.isEmpty()) {
			type_list.add("date");
			args_list.add(startDate + "~" + endDate);
		}

		if(location != null) {
			type_list.add("region");
			args_list.add(location);
		}

		if(amount != null) {
			type_list.add("capacity");
			args_list.add(amount);
		}
		
		if(type != null) {
			type_list.add("type");
			args_list.add(type);
		}
		
		if(price != null) {
			type_list.add("price");
			args_list.add(price);
		}

		if(filter != null) {
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
	public String message(Model m, int member_no) {
		m.addAttribute("count", messageDao.count(member_no));
		m.addAttribute("message", messageDao.getMessage(member_no));
		return "sub/message";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(Message message) {
		System.out.println(message.toString());
		messageDao.insert(message);
		return "redirect:/";
	}
	
	@RequestMapping("/messageDetail")
	public String messageDetail(Model m) {
		return "sub/messageDetail";
	}
}
