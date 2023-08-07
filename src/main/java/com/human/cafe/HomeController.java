package com.human.cafe;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.VO.BoardVO;
import com.human.VO.CafeVO;
import com.human.VO.PageVO;
import com.human.service.IF_BoardService;
import com.human.service.IF_CafeService;
import com.human.service.IF_MembershipService;

@Controller
public class HomeController {

	@Inject
	IF_MembershipService msrv;

	@Inject
	IF_BoardService bsrv;
	
	@Inject
	IF_CafeService csrv;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,@ModelAttribute("")PageVO pagevo)throws Exception {
		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}

		int tcnt = bsrv.totalCnt(pagevo.getSearch_word());
		pagevo.setTotalCount(tcnt);
		pagevo.calcPage();
		

		List<BoardVO> allList = bsrv.listAll(pagevo);
		model.addAttribute("bList", allList);
		model.addAttribute("pageVO", pagevo);
		
		
		return "home";
	}
	
	
	

	@RequestMapping(value = "/login_view", method = RequestMethod.GET)
	public String login_view(Locale locale, Model model) {
		return "login_view";
	}


	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location(Locale locale, Model model) {

		return "location_view";
	}

	
	@RequestMapping(value = "/myPage_view", method = RequestMethod.GET)
	public String myPage(Model model, HttpSession session) throws Exception {

		String id = (String) session.getAttribute("nowUser");
		model.addAttribute("mvo", msrv.userInfo(id));

		return "myPage_view";
	}

	// 정민 추가
	@RequestMapping(value = "/board_view", method = RequestMethod.GET)
	public String board_view(Model model, @ModelAttribute("") PageVO pagevo)
			throws Exception {
		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}

		int tcnt = bsrv.totalCnt(pagevo.getSearch_word());
		pagevo.setTotalCount(tcnt);
		pagevo.calcPage();
		

		List<BoardVO> allList = bsrv.listAll(pagevo);
		model.addAttribute("bList", allList);
		model.addAttribute("pageVO", pagevo);
		
		return "board_view";
		
	}
	
	@RequestMapping(value = "/cafe_search", method = RequestMethod.GET)
	public String cafe_search(Locale locale, Model model, @RequestParam("cname") String cname) throws Exception{
		List<CafeVO> searchList = csrv.cafe_search(cname);
		model.addAttribute("search", "search");
		model.addAttribute("cvo", searchList);
		return "cafe_view";
	}

}
