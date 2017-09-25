package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value= {"/home", "/", "", "/member/home", "/member/", "/member"})
	public String home(Model m) {
		List<Member> list = memberDao.selectAll();
		m.addAttribute("memberList", list);
		return "admin/member/home";
	}
	@Controller
	@RequestMapping(value= {"/admin/member"})
	public static class MemberController{
		@Autowired
		private MemberDao memberDao;
		
		@RequestMapping(value="/modify", method=RequestMethod.POST)
		@ResponseBody
		public String modify(Member m) {
			System.out.println(m);
			return String.valueOf(memberDao.modify(m));
		}
	}
	@Controller
	@RequestMapping(value= {"/admin/reservations"})
	public static class ReservationsController{
		@RequestMapping(value= {"/home", "/", ""})
		public String home() {
			return "admin/reservations/home";
		}
	}
	@Controller
	@RequestMapping(value= {"/admin/sales"})
	public static class SalesController{
		@RequestMapping(value= {"/home", "/", ""})
		public String home() {
			return "admin/sales/home";
		}
	}
	
	
}
