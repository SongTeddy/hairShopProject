package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(value="boardWriteForm", method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
		model.addAttribute("subdisplay", "/hairShopProject/hairShop/board/boardWriteForm.jsp");
		return "/hairShop/hairShop_index";
	}
	
	@RequestMapping(value="boardWrite", method=RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam Map<String,String> map,
									HttpSession session) {
		//세션
		String email = (String)session.getAttribute("memEmail");
		String nickname = (String)session.getAttribute("memNickname");
		
		map.put("email", email);
		map.put("name", nickname);
		
		boardDAO.boardWrite(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", "1");
		mav.addObject("subdisplay", "/board/boardList.jsp");
		mav.setViewName("/hairShop/hairShop_index");
		return mav;
	}
	
	/*@RequestMapping(value="/hairShop/board/boardList.do", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(required=false, defaultValue="1") String pg) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("subdisplay", "/hairshop/board/boardList.jsp");
		mav.setViewName("jsonView");
		return mav;
	}*/
/*	
	@RequestMapping(value="boardList", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg,
							Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("subdisplay", "/board/boardList.jsp");
		return "/hairShop/hairShop_index";
	}
	*/
	

	@RequestMapping(value="boardView", method=RequestMethod.POST)
	public ModelAndView boardView(@RequestParam int seq, @RequestParam int pg) {
		ModelAndView mav = new ModelAndView();
		BoardDTO boardDTO = boardDAO.boardView(seq);
		mav.addObject("pg", pg);
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("subdisplay", "/board/boardView.jsp");
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam(required=false, defaultValue="1") String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		/*System.out.println("getboard");*/
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		System.out.println("dao" +list.size());
		//페이징 처리
		int totalA = boardDAO.getBoardTotalA();
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(10);
		boardPaging.setPageSize(12);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardSearch")
	public ModelAndView boardSearch(@RequestParam(required=false) Map<String,String> map) {
		System.out.println(map.get("pg")+","+map.get("searchOption")+","+map.get("keyword"));
		
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
	
	@RequestMapping(value="boardReplyForm", method=RequestMethod.GET)
	public String boardReplyForm(@RequestParam int pseq,
								 @RequestParam int pg,
								 Model model) {
		model.addAttribute("pseq", pseq);//원글번호
		model.addAttribute("pg", pg);
		model.addAttribute("subdisplay", "/board/boardReplyForm.jsp");
		return "/hairShop/hairShop_index";
	}
	
	@RequestMapping(value="boardReply", method=RequestMethod.POST)
	public String boardReply(@ModelAttribute BoardDTO boardDTO,
							 @RequestParam int pg,
							 HttpSession session,
							 Model model) {
		//원글
		BoardDTO pDTO = boardDAO.boardView(boardDTO.getPseq());
		
		String email = (String)session.getAttribute("memEmail");
		String nickname = (String)session.getAttribute("memName");
		
		boardDTO.setEmail(email);
		boardDTO.setNickname(nickname);
		boardDTO.setRef(pDTO.getRef());//답글ref = 원글ref
		boardDTO.setLev(pDTO.getLev()+1);//답글lev = 원글lev+1
		boardDTO.setStep(pDTO.getStep()+1);//답글step = 원글step+1
		
		//DB
		boardDAO.boardReply(boardDTO);
		
		model.addAttribute("pg", pg);
		model.addAttribute("subdisplay", "/board/boardList.jsp");
		return "/hairShop/hairShop_index";
	}
	
	@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
	public String boardModifyForm(@RequestParam int seq,
								 @RequestParam int pg,
								 Model model) {
		
		BoardDTO boardDTO = boardDAO.boardView(seq);
		
		model.addAttribute("pg", pg);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("subdisplay", "/board/boardModifyForm.jsp");
		return "/hairShop/hairShop_index";
	}
	
	
	@RequestMapping(value="boardModify", method=RequestMethod.POST)
	public String boardModify(@RequestParam Map<String,String> map,
			 				  Model model) {
		boardDAO.boardModify(map);
		
		model.addAttribute("pg", map.get("pg"));
		model.addAttribute("subdisplay", "/board/boardList.jsp");
		return "/hairShop/hairShop_index";
	}
	
	
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam String seq,
			 				  Model model) {
		boardDAO.boardDelete(Integer.parseInt(seq));
		
		model.addAttribute("pg", "1");
		model.addAttribute("subdisplay", "/board/boardList.jsp");
		return "/hairShop/hairShop_index";
	}
	
}