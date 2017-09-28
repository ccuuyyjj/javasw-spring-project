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
import spring.model.Sales;
import spring.model.SalesDao;
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

		@RequestMapping(value = "/modify", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
		@ResponseBody
		public String modify(Member m) {
			return String.valueOf(memberDao.modify(m));
		}

		@RequestMapping(value = "/tempPw", method = RequestMethod.GET)
		public String tempPwGet(int no, Model m) {
			m.addAttribute("member", memberDao.select(no));
			return "admin/member/tempPw";
		}

		@RequestMapping(value = "/tempPw", method = RequestMethod.POST, produces = "text/plain; charset=utf-8")
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
		@Autowired
		private SalesDao salesDao;

		// 오늘 날짜 가져오기
		private SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		private String getToday(Model m) {
			Calendar c1 = Calendar.getInstance();
			String strToday = format.format(c1.getTime());

			String year = strToday.split("-")[0];
			String month = strToday.split("-")[1];
			String day = strToday.split("-")[2];
			m.addAttribute("year", year);
			return strToday;
		}

		@RequestMapping(value = { "/home", "/", "" })
		public String home(Model m) {
			String strToday = getToday(m);
			String year = strToday.split("-")[0];
			String month = strToday.split("-")[1];
			String day = strToday.split("-")[2];
			m.addAttribute("syear", year);
			m.addAttribute("smonth", month);
			m.addAttribute("eyear", year);
			m.addAttribute("emonth", month);
			m.addAttribute("eday", day);
			return "admin/sales/home";
		}

		@RequestMapping(value = { "/home", "/", "" }, method = RequestMethod.POST)
		public String home(Model m, HttpServletRequest request) {
			String strToday = getToday(m);
			String syear = request.getParameter("syear");
			String smonth = request.getParameter("smonth");
			String sday = request.getParameter("sday");
			String sDate = syear + smonth + sday;
			String eyear = request.getParameter("eyear");
			String emonth = request.getParameter("emonth");
			String eday = request.getParameter("eday");
			String eDate = eyear + emonth + eday;

			int total_cnt = 0;
			int total_amount = 0;
			int total_cancel_cnt = 0;
			int total_cancel_amount = 0;
			List<Sales> dList = salesDao.sales_day_history(sDate, eDate);

			for (Sales list : dList) {
				total_cnt += list.getCnt();
				total_amount += list.getAmount();
				total_cancel_cnt += list.getCancel_cnt();
				total_cancel_amount += list.getCancel_amount();
			}

			m.addAttribute("syear", syear);
			m.addAttribute("smonth", smonth);
			m.addAttribute("sday", sday);
			m.addAttribute("eyear", eyear);
			m.addAttribute("emonth", emonth);
			m.addAttribute("eday", eday);
			m.addAttribute("dList", dList);
			m.addAttribute("total_cnt", total_cnt);
			m.addAttribute("total_amount", total_amount);
			m.addAttribute("total_cancel_cnt", total_cancel_cnt);
			m.addAttribute("total_cancel_amount", total_cancel_amount);

			return "admin/sales/home";
		}

		@RequestMapping("/month_sales")
		public String month_sales(Model m) {
			String strToday = getToday(m);

			return "admin/sales/month_sales";
		}

		@RequestMapping(value = "/month_sales", method = RequestMethod.POST)
		public String month_sales(Model m, HttpServletRequest request) {
			String strToday = getToday(m);
			String syear = request.getParameter("syear");
			String sDate = syear + "0101";
			String eDate = syear + "1231";

			int total_cnt = 0;
			int total_amount = 0;
			int total_cancel_cnt = 0;
			int total_cancel_amount = 0;
			List<Sales> mList = salesDao.sales_month_history(sDate, eDate);
			for (Sales list : mList) {
				total_cnt += list.getCnt();
				total_amount += list.getAmount();
				total_cancel_cnt += list.getCancel_cnt();
				total_cancel_amount += list.getCancel_amount();
			}
			log.debug("syear:" + syear);
			m.addAttribute("syear", syear);
			m.addAttribute("mList", mList);
			m.addAttribute("total_cnt", total_cnt);
			m.addAttribute("total_amount", total_amount);
			m.addAttribute("total_cancel_cnt", total_cancel_cnt);
			m.addAttribute("total_cancel_amount", total_cancel_amount);

			return "admin/sales/month_sales";
		}

	}

}
