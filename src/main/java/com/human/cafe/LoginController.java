package com.human.cafe;

import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.VO.MemberVO;
import com.human.service.IF_MembershipService;

@Controller
public class LoginController {

	@Inject
	IF_MembershipService msrv;

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public String reg(Locale locale, Model model, @ModelAttribute("") MemberVO mvo) throws Exception {

		msrv.insertMember(mvo);

		return "login_view";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model, HttpSession session, @RequestParam("lid") String id,
			@RequestParam("lpass") String pass) throws Exception {

		HashMap<String, String> info = new HashMap<String, String>();
		info.put("id", id);
		info.put("pass", pass);
		// 아이디 패스워드 디버깅
//		 info.forEach((key, value) -> {
//	            System.out.println(key + " : " + value);
//	        });

		if (msrv.loginChk(info) != null) {

			session.setAttribute("nowUser", id);
			return "redirect:/";
		} else {

			return "login_view";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping(value = "/delMember", method = RequestMethod.GET)
	public String delMember(HttpSession session) throws Exception {
		String id = (String) session.getAttribute("nowUser");
		msrv.delMember(id);
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/mod_info", method = RequestMethod.GET)
	public String mod_info(Model model, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("nowUser");
		model.addAttribute("mvo", msrv.userInfo(id));
		return "mod_view";
	}

	@RequestMapping(value = "/mod_pro", method = RequestMethod.POST)
	public String mod_pro(Model model, HttpSession session, @ModelAttribute("") MemberVO mvo) throws Exception {

		msrv.mod_pro(mvo);

		return "redirect:/";
	}

	// 아이디 중복체크
	@RequestMapping("/mbidCheck.do")
	public @ResponseBody int midCheck(String id) throws Exception {

		int result = msrv.idCheck(id);
		return result;
	}

	// 로그인 유효성체크
	@RequestMapping("/memberlogin.do")
	public @ResponseBody int memberlogin(String info) throws Exception {

		HashMap<String, String> infomem = new HashMap<String, String>();
		System.out.println(info);
		String[] form = info.split("/");
		String id = form[0];
		String pass = form[1];
		infomem.put("id", id);
		infomem.put("pass", pass);

		int result = msrv.chk_info(infomem);
		
		return result;
	}

}
