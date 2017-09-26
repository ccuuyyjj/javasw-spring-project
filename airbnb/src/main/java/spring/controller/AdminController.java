package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.Member;
import spring.model.MemberDao;
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
		@RequestMapping(value = { "/home", "/", "" })
		public String home() {
			return "admin/sales/home";
		}
	}

}
