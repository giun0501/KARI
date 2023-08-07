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

import com.human.VO.BoardVO;
import com.human.service.IF_BoardService;

@Controller
public class BoardController {

	@Inject
	IF_BoardService bsrv;

	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public String board_detail(Locale locale, Model model, @RequestParam("viewno") Integer viewno) throws Exception {
		model.addAttribute("viewvo", bsrv.viewDetail(viewno));
		return "board_detail";
	}

	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(Model model) throws Exception {

		return "write_view";
	}

	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String board_write(Model model, HttpSession session, @ModelAttribute("") BoardVO bvo) throws Exception {
		String id = (String) session.getAttribute("nowUser");
		bvo.setId(id);
		bsrv.boardWrite(bvo);
		return "redirect:/board_view";
	}

	@RequestMapping(value = "/delBoard", method = RequestMethod.GET)
	public String delBoard(Model model, @RequestParam("num") int num) throws Exception {
		bsrv.del_board(num);

		return "redirect:/board_view";
	}

	@RequestMapping(value = "/modBoard", method = RequestMethod.GET)
	public String modBoard(Locale locale, Model model, @RequestParam("num") Integer modno, HttpSession session)
			throws Exception {

		model.addAttribute("modvo", bsrv.mod_board(modno));
		return "mod_form";
	}

	@RequestMapping(value = "/modBoard_pro", method = RequestMethod.POST)
	public String modBoard_pro(Locale locale, Model model, @ModelAttribute("") BoardVO bvo) throws Exception {

		bsrv.modBoard_pro(bvo);
		// model.addAttribute("viewno", bvo.getNum());

		return "redirect:/board_view";
	}

}
