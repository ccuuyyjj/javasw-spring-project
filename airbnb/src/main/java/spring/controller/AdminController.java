package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(value= {"/home", "/", ""})
	public String home() {
		return "admin/member/home";
	}
	@Controller
	@RequestMapping(value= {"/admin/member"})
	public static class MemberController{
		@RequestMapping(value= {"/home", "/", ""})
		public String home() {
			return "admin/member/home";
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
