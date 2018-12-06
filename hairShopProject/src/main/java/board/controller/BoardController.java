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

@Controller
@RequestMapping("hairShop/board")
@Component
public class BoardController {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam Map<String,String> map,
									HttpSession session) {
		//세션
		String email = (String)session.getAttribute("memEmail");
		map.put("email", email);
		boardDAO.boardWrite(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", "1");
		mav.addObject("subdisplay", "/board/boardList.jsp");
		mav.setViewName("/hairShop/hairShop_index");
		return mav;
	}
	

	@RequestMapping(value="boardView", method=RequestMethod.POST)
	public ModelAndView boardView(@RequestParam int seq, @RequestParam(required=false, defaultValue="1") int pg) {
		ModelAndView mav = new ModelAndView();
		BoardDTO boardDTO = boardDAO.boardView(seq);
		mav.addObject("pg", pg);
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
		boardPaging.makeSearchPagingHTML();		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardSearch")
	public ModelAndView boardSearch(@RequestParam(required=false) Map<String,String> map) {

		//1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		//페이징 처리
		int totalA = boardDAO.getBoardSearchTotalA(map);
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
	public ModelAndView boardModifyForm(@RequestParam String seq) {
		System.out.println(seq +"board컨트롤러");
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
		boardDAO.boardModify(map);
		
		model.addAttribute("pg", map.get("pg"));
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
}