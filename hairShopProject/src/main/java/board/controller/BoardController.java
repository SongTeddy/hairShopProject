package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Controller
@RequestMapping("hairShop/board")
@Component
public class BoardController {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam Map<String,String> map,
									HttpSession session) {
		//세션
		String email = (String)session.getAttribute("memEmail");
		MemberDTO memberDTO = memberDAO.isCheckEmail((String) session.getAttribute("memEmail"));
		map.put("email", email);
		map.put("hairShopId", memberDTO.getHairshopid());
		System.out.println(map);
		boardDAO.boardWrite(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", "1");
		mav.addObject("subdisplay", "/board/boardList.jsp");
		mav.addObject("hairShopId", memberDTO.getHairshopid());
		mav.setViewName("/hairShop/hairShop_index");
		return mav;
	}
	

	@RequestMapping(value="boardView", method=RequestMethod.POST)
	public ModelAndView boardView(@RequestParam int seq) {
		ModelAndView mav = new ModelAndView();
		BoardDTO boardDTO = boardDAO.boardView(seq);
		mav.addObject("boardDTO", boardDTO);
/*		mav.addObject("subbdisplay", "/board/boardView.jsp");*/
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		/*System.out.println("getboard");*/
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		//페이징 처리
		int totalA = boardDAO.getBoardTotalA();
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardSearch")
	public ModelAndView boardSearch(@RequestParam(required=false) Map<String,String> map,
									@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		System.out.println(map);
		//페이징 처리
		int totalA = boardDAO.getBoardSearchTotalA(map);
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML(map.get("searchOption"),map.get("keyword"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("searchOption", map.get("searchOption"));
		mav.addObject("keyword", map.get("keyword"));
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
	public ModelAndView boardModifyForm(@RequestParam String seq) {
		System.out.println("modifyForm = "+seq);
		ModelAndView mav = new ModelAndView();
		BoardDTO boardDTO = boardDAO.boardView(Integer.parseInt(seq));
		
		mav.addObject("seq", seq);
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("subdisplay", "/board/boardModifyForm.jsp");
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardModify", method=RequestMethod.POST)
	public String boardModify(@RequestParam Map<String,String> map,
			 				  Model model) {

		System.out.println(map);
		boardDAO.boardModify(map);
		
		model.addAttribute("subdisplay", "/board/boardModifyForm.jsp");
		return "/hairShop/hairShop_index";
	}
	
	
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam int seq, Model model) {
		boardDAO.BoardDelete(seq);
		model.addAttribute("pg", "1");
		model.addAttribute("subdisplay", "/board/boardList.jsp");
		return "/hairShop/hairShop_index";
	}
	
	@RequestMapping(value="isCheckId", method=RequestMethod.POST)
	public ModelAndView isCheckId(@RequestParam String hairShopId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String memEmail = (String)session.getAttribute("memEmail");
		String memType = (String)session.getAttribute("memType");
		if(memEmail != null && memType.equals("1")) {
			MemberDTO memberDTO = memberDAO.isCheckEmail(memEmail);
			if(memberDTO.getHairshopid().equals(hairShopId)) {
				mav.addObject("isCheckId", 1);
			} else mav.addObject("isCheckId", 0);
		} else mav.addObject("isCheckId", 0);
		mav.addObject("hairShopId", hairShopId);
		mav.setViewName("jsonView"); 
		return mav;
	}
}