package spring.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
import spring.model.RoomDao;
import spring.model.RsvpDao;
import spring.util.PasswordGenerator;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = { "/home", "/", "", "/member/home", "/member/", "/member" })
	public String home(Model m, @RequestParam(value = "query", defaultValue = "") String query) {
		List<Member> list;
		// if(!query.isEmpty())
		list = memberDao.selectAll();
		m.addAttribute("memberList", list);
		return "admin/member/list";
	}

	@Controller
	@RequestMapping(value = { "/admin/member" })
	public static class MemberController {
		@Autowired
		private MemberDao memberDao;

		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		@ResponseBody
		public String modify(Member m) {
			return String.valueOf(memberDao.modify(m));
		}

		@RequestMapping(value = "/tempPw", method = RequestMethod.GET)
		public String tempPwGet(int no, Model m) {
			m.addAttribute("member", memberDao.select(no));
			return "admin/member/tempPw";
		}

		@RequestMapping(value = "/tempPw", method = RequestMethod.POST)
		@ResponseBody
		public String tempPwPost(Member m) throws Exception {
			String newPw = PasswordGenerator.generate();
			m.setPw(newPw);
			if (memberDao.modify(m))
				return newPw;
			else
				throw new Exception("임시비밀번호 발급 실패");
		}
	}

	@Controller
	@RequestMapping(value = { "/admin/reservations" })
	public static class ReservationsController {
		@RequestMapping(value = { "/home", "/", "" })
		public String home() {
			return "admin/reservations/home";
		}
	}

	@Controller
	@RequestMapping(value = { "/admin/sales" })
	public static class SalesController {
		private Logger log = LoggerFactory.getLogger(getClass());
		@Autowired
		private RsvpDao rsvpDao;
		@Autowired
		private RoomDao roomDao;

		// 오늘 날짜 가져오기
		private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		private String getToday(Model m) {
			Calendar c1 = Calendar.getInstance();
			String strToday = format.format(c1.getTime());
			m.addAttribute("year", strToday.substring(0, 4));
			return strToday;
		}

		@RequestMapping(value = { "/home", "/", "" })
		public String home(Model m) {
			String strToday = getToday(m);
			return "admin/sales/home";
		}

		@RequestMapping(value = { "/home", "/", "" }, method = RequestMethod.POST)
		public String home(Model m, HttpServletRequest request) {
			String strToday = getToday(m);
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String sday = request.getParameter("sday");
			String eday = request.getParameter("eday");
			String sDate = year + month + sday;
			String eDate = year + month + eday;
			// Map<String, Integer> map = rsvpDao.sales_day_history(sDate, eDate);
			Double sum = 0.0;

			// 숙박명 가져오기 위해
			// for (Rsvp rsvp : Rsvplist) {
			// sum += rsvp.getTotalprice();
			// Room room = roomDao.select(rsvp.getRoom_no());
			// map.put(rsvp.getRoom_no(), room);
			// }
			// m.addAttribute("rsvpList", Rsvplist);
			// m.addAttribute("map", map);
			return "admin/sales/home";
		}

		@RequestMapping("/month_sales")
		public String month_sales() {
			return "admin/sales/month_sales";
		}
	}

}
