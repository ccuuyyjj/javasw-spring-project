package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Avail;
import spring.model.AvailDao;
import spring.model.Room;
import spring.model.RoomDao;

@Controller
@RequestMapping("/host")
public class HostController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	RoomDao roomDao;
	
	@Autowired
	AvailDao availDao;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("become_host1")
	public String become_host1() {
		log.debug("room_no=" +session.getAttribute("room_no"));
		return "host/become_host1";
	}
	
	@RequestMapping(value="become_host1", method=RequestMethod.POST)
	public String become_host1(HttpServletRequest request) {
		session.setAttribute("room", new Room());
		String house_type = request.getParameter("house_type");
		String room_type = request.getParameter("room_type");
		String type = house_type + " " + room_type;
		log.debug("type=>"+type);
		String region = request.getParameter("region");
		
		Room room = (Room)session.getAttribute("room");
		room.setType(type);
		room.setRegion(region);
		
		return "redirect:/host/become_host1_1";
	}
	
	@RequestMapping("become_host1_1")
	public String become_host1_1() {
		log.debug("room_no=" +session.getAttribute("room_no"));
		return "host/become_host1_1";
	}
	@RequestMapping(value="become_host1_1", method=RequestMethod.POST)
	public String become_host1_1(HttpServletRequest request) {
		
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		int beds = Integer.parseInt(request.getParameter("beds"));
		int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
		String bed_type = request.getParameter("bed_type");
		
		Room room = (Room)session.getAttribute("room");
		room.setCapacity(capacity);
		room.setBeds(beds);
		room.setBedrooms(bedrooms);
		room.setBed_type(bed_type);
		
		return "redirect:/host/become_host1_2";
	}
	
	@RequestMapping("become_host1_2")
	public String become_host1_2() {
		return "host/become_host1_2";
	}
	@RequestMapping(value="become_host1_2", method=RequestMethod.POST)
	public String become_host1_2(HttpServletRequest request) {
		String address = request.getParameter("address");
		log.debug(address);
		
		Room room = (Room)session.getAttribute("room");
		room.setAddress(address);
		
		return "redirect:/host/become_host1_3";
	}
	
	
	@RequestMapping("become_host1_3")
	public String become_host1_3(Model model) {
		Room room = (Room)session.getAttribute("room");
		
		model.addAttribute("address", room.getAddress());
		
		return "host/become_host1_3";
	}
	@RequestMapping(value="become_host1_3", method=RequestMethod.POST)
	public String become_host1_3(HttpServletRequest request) {
		String mode = request.getParameter("mode");
		
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			Room room = (Room)session.getAttribute("room");
			
			double lat = Double.parseDouble(request.getParameter("lat"));
			double lng = Double.parseDouble(request.getParameter("lng"));
			
			room.setLat(lat);
			room.setLng(lng);
			room.setProgress(1); //1단계
			//room.getOwner_id(); //나중에 아이디 추가하기
			
			if(room.getNo() > 0) {
				//호스팅 수정
				roomDao.update(room);
				
			} else {
				//호스팅 새로 등록
				int room_no = roomDao.insert(room);
				room.setNo(room_no);
			}
			
			return "redirect:/host/become_host1_6";
		} 
		else {
			return "redirect:/host/become_host1_4";
		}
		
	}
	
	@RequestMapping("become_host1_4")
	public String become_host1_4() {
		return "host/become_host1_4";
	}
	@RequestMapping(value="become_host1_4", method=RequestMethod.POST)
	public String become_host1_4(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Room room = (Room)session.getAttribute("room");
		String options = "";
		String[] option = request.getParameterValues("options");
		if(option != null) {
			for(int i=0; i<option.length; i++) {
				options += option[i]+"l";
			}
			log.debug("options =>"+options);
			room.setOptions(options);
		}
		
		String mode = request.getParameter("mode");
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			
			if(room.getNo() > 0 ) {
				room.setOptions(options);
				roomDao.update(room);
			}
			else {
				//호스팅 새로 등록
				int room_no = roomDao.insert(room);
				room.setNo(room_no);
			}
			return "redirect:/host/become_host1_6";
			
		}	
		else {
			return "redirect:/host/become_host1_5";
		}
	}
	@RequestMapping("become_host1_5")
	public String become_host1_5() {
		return "host/become_host1_5";
	}
	@RequestMapping(value="become_host1_5", method=RequestMethod.POST)
	public String become_host1_5(HttpServletRequest request) {
		Room room = (Room)session.getAttribute("room");
		String options = room.getOptions();
		String[] option = request.getParameterValues("options");
		if(option != null) {
			for(int i=0; i<option.length; i++) {
				options += option[i]+"l";
			}
			log.debug("options =>"+options);
		}
		if(room.getNo() > 0 ) {
			room.setOptions(options);
			roomDao.update(room);
		}
		else {
			//호스팅 새로 등록
			int room_no = roomDao.insert(room);
			room.setNo(room_no);
		}
		
		return "redirect:/host/become_host1_6";
	}
	
	@RequestMapping("become_host1_6")
	public String become_host1_6(HttpServletRequest request, Model model) {
		//1_3에서 왔는지 1_5에서 왔는지 구분값이 필요함.
		String referer = request.getHeader("referer");
		log.debug("referer =" + referer);
		String urlNo = referer.substring(referer.length()-1);
		log.debug("urlNo =" + urlNo);
		model.addAttribute("urlNo", urlNo);
		
		return "host/become_host1_6";
	}
	@RequestMapping(value="become_host1_6", method=RequestMethod.POST)
	public String become_host1_6() {
		return "redirect:/host/become_host2";
	}
	
	//2단계 시작
	@RequestMapping("become_host2")
	public String become_host2() {
		return "host/become_host2";
	}
	
	@RequestMapping("become_host2_1")
	public String become_host2_1() {
		return "host/become_host2_1";
	}
	@RequestMapping(value="become_host2_1", method=RequestMethod.POST)
	public String become_host2_1(HttpServletRequest request) {
		Room room = (Room)session.getAttribute("room");
		String etc = request.getParameter("etc");
		String name = request.getParameter("name");
		
		room.setEtc(etc);
		room.setName(name);
		room.setProgress(2); //2단계
		roomDao.update(room);
		
		return "redirect:/host/become_host2_2";
	}
	
	@RequestMapping("become_host2_2")
	public String become_host2_2(Model model) {
		Room room = (Room)session.getAttribute("room");
		String photourl = room.getPhotoUrl();
		model.addAttribute("photourl", photourl);
		
		return "host/become_host2_2";
	}
	@RequestMapping(value="become_host2_2", method=RequestMethod.POST)
	public String become_host2_2(HttpServletRequest request) {
		return "redirect:/host/become_host3";
	}
	
	
	//3단계 시작
	@RequestMapping("become_host3")
	public String become_host3() {
		return "host/become_host3";
	}
	@RequestMapping(value="become_host3", method=RequestMethod.POST)
	public String become_host3(HttpServletRequest request) {
		return "redirect:/host/become_host3_1";
	}
	
	@RequestMapping("become_host3_1")
	public String become_host3_1() {
		return "host/become_host3_1";
	}
	@RequestMapping(value="become_host3_1", method=RequestMethod.POST)
	public String become_host3_1(HttpServletRequest request) {
		Room room = (Room)session.getAttribute("room");
		
		int price = Integer.parseInt(request.getParameter("price"));
		session.setAttribute("price", price);
		
		//체크인시간은 options 테이블에 추가
		String check_in = request.getParameter("check_in");
		log.debug("check_in=>"+check_in);
		String options = room.getOptions();
		if(options != null) {
			options += check_in;
		} else {
			options = check_in;
		}
		log.debug("options=>"+options);
		room.setOptions(options);
		
		String mode = request.getParameter("mode");
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			room.setProgress(3); //3단계
			roomDao.update(room);
			return "redirect:/host/become_host3_3";
		}	
		else {
			return "redirect:/host/become_host3_2";
		}
	}
	
	@RequestMapping("become_host3_2")
	public String become_host3_2(Model m) {
		//달력에 available_date의 available이 true이면 달력에 표시해주기 위해 데이터를 가져온다 
		Room room = (Room)session.getAttribute("room");
		List<Avail> list = availDao.selectAvailable(room.getNo());
		m.addAttribute("availList", list);
		
		return "host/become_host3_2";
	}
	@RequestMapping(value="become_host3_2", method=RequestMethod.POST)
	public String become_host3_2(HttpServletRequest request) {
		
		return "redirect:/host/become_host3_3";
	}
	
	//달력 저장
	@RequestMapping("check_date") 
	@ResponseBody
	public String check_date(@RequestParam(value="start", required=true) String start, 
			@RequestParam(value="diff", required=true) int diff) {
			int price = (int)session.getAttribute("price");
			Room room = (Room)session.getAttribute("room");
			String msg = "";
			log.debug("start:"+start);
			log.debug("diff:"+diff);
			for(int i=0; i<diff; i++) { 
				if(i > 0) {
					DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
				    try {
				        Date date = df.parse(start);
				        // 날짜 더하기
				        Calendar cal = Calendar.getInstance();
				        cal.setTime(date);
				        cal.add(Calendar.DATE, 1);
				        start = df.format(cal.getTime());
				    } catch (ParseException e) {
				        e.printStackTrace();
				    }
					
					log.debug("start:"+start);
				}
				Avail avail = availDao.select(room.getNo(), start);
				if(avail != null) {
					String available = avail.getAvailable();
					log.debug("available:"+available);
					if(available.equalsIgnoreCase("true")) {
						available = "false";
					} else if(available.equalsIgnoreCase("false")) {
						available = "true";
					}
					boolean result = availDao.update(avail.getNo(), available);
					if(result){
						msg += "@"+start + "|" + available;
					}
				}
				else {
					Avail avail1 = new Avail();
					avail1.setRoom_no(room.getNo());
					avail1.setDay(start);
					avail1.setAvailable("true");
					avail1.setPrice(price);
					boolean result = availDao.insert(avail1);
					 
					if(result) {
						msg += "@"+start + "|" + "true";
						
					}
				}
			}
			
			return msg.substring(1);
	}
	
	@RequestMapping("become_host3_3")
	public String become_host3_3() {
		return "host/become_host3_3";
	}
	@RequestMapping(value="become_host3_3", method=RequestMethod.POST)
	public String become_host3_3(HttpServletRequest request) {
		Room room = (Room)session.getAttribute("room");
		room.setProgress(4); //4단계
		roomDao.update(room);
		return "redirect:/host/become_host3_4";
	}
	
	@RequestMapping("become_host3_4")
	public String become_host3_4() {
		return "host/become_host3_4";
	}
}
