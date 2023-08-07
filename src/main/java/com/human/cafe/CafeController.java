package com.human.cafe;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.VO.CafeVO;
import com.human.service.IF_CafeService;
import com.human.service.IF_ReviewService;

@Controller
public class CafeController {

	@Inject
	IF_CafeService csrv;

	@Inject
	IF_ReviewService rsrv;
	
	@RequestMapping(value = "/cafe_view", method = RequestMethod.GET)
	public String cafe_view(Locale locale, Model model, @RequestParam("cate") String cate) throws Exception {

		List<CafeVO> cafeList = csrv.cafeList(cate);



		model.addAttribute("cafeName", cate.trim());
		model.addAttribute("cvo", cafeList);
		return "cafe_view";
	}

	@RequestMapping(value = "/cafe_detail", method = RequestMethod.GET)
	public String cafe_detail(Locale locale, Model model, @RequestParam("cname") String cname, @RequestParam("cno") String cno) throws Exception {
		csrv.cntUpdate(cno);
		model.addAttribute("cinfo", csrv.cafeInfo(cname));
		model.addAttribute("rList", rsrv.reviewList(cno));
		return "cafe_detail";
	}

}
