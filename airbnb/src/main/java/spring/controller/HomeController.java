package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/check")
	void check(@RequestParam(value = "email") String email) {
		// 중복 이메일 검사
		System.out.println("들어왔나?" + email);
	}

}
