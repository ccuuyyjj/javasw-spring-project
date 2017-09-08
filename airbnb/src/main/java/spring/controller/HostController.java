package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	Room room = new Room();
	
	@RequestMapping("become_host1")
	public String become_host1() {
		log.debug("room_no=" +session.getAttribute("room_no"));
		return "host/become_host1";
	}
	
	@RequestMapping(value="become_host1", method=RequestMethod.POST)
	public String become_host1(HttpServletRequest request) {
		
		String house_type = request.getParameter("house_type");
		String room_type = request.getParameter("room_type");
		String type = house_type + " " + room_type;
		String region = request.getParameter("region");
		
		session.setAttribute("type", type);
		session.setAttribute("region", region);
		
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
		
		session.setAttribute("capacity", capacity);
		session.setAttribute("beds", beds);
		session.setAttribute("bedrooms", bedrooms);
		session.setAttribute("bed_type", bed_type);
		
		return "redirect:/host/become_host1_2";
	}
	
	@RequestMapping("become_host1_2")
	public String become_host1_2() {
		log.debug("capacity=" +session.getAttribute("capacity"));
		log.debug("bedrooms=" +session.getAttribute("bedrooms"));
		log.debug("beds=" +session.getAttribute("beds"));
		log.debug("bed_type=" +session.getAttribute("bed_type"));
		return "host/become_host1_2";
	}
	@RequestMapping(value="become_host1_2", method=RequestMethod.POST)
	public String become_host1_2(HttpServletRequest request) {
		String address = request.getParameter("address");
		session.setAttribute("address", address);
		return "redirect:/host/become_host1_3";
	}
	
	
	@RequestMapping("become_host1_3")
	public String become_host1_3(Model model) {
		
		model.addAttribute("address", session.getAttribute("address"));
		
		return "host/become_host1_3";
	}
	@RequestMapping(value="become_host1_3", method=RequestMethod.POST)
	public String become_host1_3(HttpServletRequest request) {
		String mode = request.getParameter("mode");
		
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			log.debug("room_no=" +session.getAttribute("room_no"));
			log.debug("type=" +session.getAttribute("type"));
			log.debug("region=" +session.getAttribute("region"));
			log.debug("capacity=" +session.getAttribute("capacity"));
			log.debug("bedrooms=" +session.getAttribute("bedrooms"));
			log.debug("beds=" +session.getAttribute("beds"));
			log.debug("bed_type=" +session.getAttribute("bed_type"));
			log.debug("address=" +session.getAttribute("address"));
			log.debug("lat="+request.getParameter("lat"));
			log.debug("lng="+request.getParameter("lng"));
			
			double lat = Double.parseDouble(request.getParameter("lat"));
			double lng = Double.parseDouble(request.getParameter("lng"));
			
			room.setType((String)session.getAttribute("type"));
			room.setRegion((String)session.getAttribute("region"));
			room.setCapacity((int)session.getAttribute("capacity"));
			room.setBedrooms((int)session.getAttribute("bedrooms"));
			room.setBeds((int)session.getAttribute("beds"));
			room.setBed_type((String)session.getAttribute("bed_type"));
			room.setAddress((String)session.getAttribute("address"));
			room.setLat(lat);
			room.setLng(lng);
			room.setProgress(1); //1단계
			//room.getOwner_id(); //나중에 아이디 추가하기
			
			if(session.getAttribute("room_no") != null) {
				//호스팅 수정
				room.setNo((int)session.getAttribute("room_no"));
				roomDao.update(room);
				
			} else {
				//호스팅 새로 등록
				int room_no = roomDao.insert(room);
				session.setAttribute("room_no", room_no);
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
		String options = "";
		String[] option = request.getParameterValues("options");
		if(option != null) {
			for(int i=0; i<option.length; i++) {
				options += option[i]+"l";
			}
			log.debug("options =>"+options);
			session.setAttribute("options", options);
		}
		
		String mode = request.getParameter("mode");
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			room.setOptions(options);
			roomDao.update(room);
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
		
		String options = (String)session.getAttribute("options");
		String[] option = request.getParameterValues("options");
		if(option != null) {
			for(int i=0; i<option.length; i++) {
				options += option[i]+"l";
			}
			log.debug("options =>"+options);
			
			room.setOptions(options);
			roomDao.update(room);
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
		String etc = request.getParameter("etc");
		String name = request.getParameter("name");
		
		room.setEtc(etc);
		room.setName(name);
		roomDao.update(room);
		
		return "redirect:/host/become_host2_2";
	}
	
	@RequestMapping("become_host2_2")
	public String become_host2_2(Model model) {
		
		String photourl = (String)session.getAttribute("photourl");
		model.addAttribute("photourl", photourl);
		
		return "host/become_host2_2";
	}
	@RequestMapping(value="become_host2_2", method=RequestMethod.POST)
	public String become_host2_2(HttpServletRequest request) {
		String name = request.getParameter("name");
		session.setAttribute("name", name);
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
		
		int price = Integer.parseInt(request.getParameter("price"));
		
		//체크인시간은 options 테이블에 추가
		String check_in = request.getParameter("check_in");
		String options = (String)session.getAttribute("options");
		options += check_in;
		
		session.setAttribute("price", price);
		session.setAttribute("options", options);
		
		String mode = request.getParameter("mode");
		if(mode != null && mode.equalsIgnoreCase("save")) {	//임시 저장
			//가격은 avail 테이블에 저장.. 
			//availDao
			
			room.setOptions(options);
			roomDao.update(room);
			return "redirect:/host/become_host3_3";
		}	
		else {
			return "redirect:/host/become_host3_2";
		}
	}
	
	@RequestMapping("become_host3_2")
	public String become_host3_2() {
		return "host/become_host3_2";
	}
	@RequestMapping(value="become_host3_2", method=RequestMethod.POST)
	public String become_host3_2(HttpServletRequest request) {
		
		return "redirect:/host/become_host3_3";
	}
	
	//달력 저장
	@RequestMapping("check_date")
	public void check_date() {
		
	}
	
	@RequestMapping("become_host3_3")
	public String become_host3_3() {
		return "host/become_host3_3";
	}
	@RequestMapping(value="become_host3_3", method=RequestMethod.POST)
	public String become_host3_3(HttpServletRequest request) {
		return "redirect:/host/become_host3_4";
	}
	
	@RequestMapping("become_host3_4")
	public String become_host3_4() {
		return "host/become_host3_4";
	}
}
