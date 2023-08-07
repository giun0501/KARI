package com.human.cafe;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.VO.ReviewVO;
import com.human.py.MyClient;
import com.human.service.IF_CafeService;
import com.human.service.IF_ReviewService;
import com.human.util.ClovaSentiment;
import com.human.util.FileDataUtil;

@Controller
public class ReviewController {
	@Inject
	IF_CafeService csrv;
	
	@Inject
	IF_ReviewService rsrv;

	@Inject
	FileDataUtil filedatautil;

	@Inject
	ClovaSentiment cnt;
	
	@Inject
	MyClient mc;
	
	@RequestMapping(value = "/reviewWrite_view", method = RequestMethod.GET)
	public String reviewWrite_view(Locale locale, Model model, HttpSession session, @RequestParam("cname") String cname
			, @RequestParam("cno") Integer cno)
			throws Exception {
	
		model.addAttribute("cname", cname);
		model.addAttribute("cinfo", csrv.cafeInfo(cname));
		return "reviewWrite_view";
	}

	@RequestMapping(value = "/reg_review", method = RequestMethod.POST)
	public String reg_review(Locale locale, Model model, HttpSession session, MultipartFile[] file,
			@ModelAttribute("") ReviewVO rvo, @RequestParam("cname") String cname, RedirectAttributes redirect)
			throws Exception {
		
		String[] newName = filedatautil.fileUpload(file);
		String id = (String) session.getAttribute("nowUser");
		
		rvo.setFilename(newName[0]);
		rvo.setId(id);
		

		String comment = rvo.getCon();
		System.out.println(comment);
		String result = mc.Sentiment(comment);
		
		System.out.println(result);
		rvo.setState(result);
		rsrv.insertReview(rvo);
		
		redirect.addAttribute("cname", cname);
		redirect.addAttribute("cno", rvo.getCno());
		return "redirect:/cafe_detail";
		
		
//		String state = rvo.getCon();
//		String result = cnt.ClovaSensiment(state);
//		
//		if(result.substring(26,34).contains("positive")) {
//			result = "긍정적";
//		}else if(result.substring(26,34).contains("negative")){
//			result="부정적";
//		}else {
//			result="중립적";
//		}
//		rvo.setState(result);	 
		
	}
	
	@RequestMapping(value = "/delReview", method = RequestMethod.GET)
	public String delReview(Model model, HttpSession session,@RequestParam("delno")int delno) 
			throws Exception {
	
		rsrv.delReview(delno);
		
		
		
		return "redirect:/";
	}
	
	
	
	
	
}
