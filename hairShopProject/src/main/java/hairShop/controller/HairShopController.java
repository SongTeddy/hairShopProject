package hairShop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.HairShopReviewDTO;
import hairShop.dao.HairShopDAO;
import management.dao.ManagementDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Controller
public class HairShopController {
	@Autowired
	private HairShopDAO hairShopDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private ManagementDAO managementDAO;
	@Autowired
	private HairShopReviewDTO hairShopReviewDTO;

	@RequestMapping(value = "/hairShop/hairShop_index.do", method = RequestMethod.GET)
	public ModelAndView input(@RequestParam String hairShopId, HttpSession session) { // 사용자가 만든 콜백 메소드
		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopId", hairShopId);
		mav.addObject("display", "/hairShop/hairShop_index.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

	@RequestMapping(value = "/hairShop/search.do")
	public ModelAndView search(@RequestParam String service, @RequestParam String date, @RequestParam String day,
			@RequestParam String latitud, @RequestParam String longitude,
			@RequestParam(required = false, defaultValue = "0") String sortOption) {
		ModelAndView mav = new ModelAndView();
		System.out.println(latitud);
		mav.addObject("service", service);
		mav.addObject("day", day);
		mav.addObject("date", date);
		mav.addObject("latitud", latitud);
		mav.addObject("longitude", longitude);
		mav.addObject("sortOption", sortOption);
		mav.setViewName("/hairShop/search");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getSearchList.do")
	public ModelAndView getSearchList(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map.get("latitud") + " latitud 잘 들어오낭~");
		System.out.println(map.get("sortOption") + " sortOption 잘 들어오낭~");
		List<Map<String, Object>> list = null;
		if (((String) map.get("sortOption")).equals("0"))
			list = hairShopDAO.getSearchListOrderByStar(map);
		else if (((String) map.get("sortOption")).equals("1"))
			list = hairShopDAO.getSearchListOrderByDistance(map);

		mav.addObject("listSize", list.size());
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getHairShopInfo.do", method = RequestMethod.POST)
	public ModelAndView getHairShopInfo(@RequestParam String hairShopId, HttpSession session) {
		if (session.getAttribute("memEmail") != null) {
			String email = (String) session.getAttribute("memEmail");
			System.out.println("getHairShopInfo 세션" + email);
		}

		ModelAndView mav = new ModelAndView();
		System.out.println("ajax hairShopId" + hairShopId);
		Map<String, Object> map = hairShopDAO.getHairShopInfo(hairShopId);
		System.out.println("위도 들어와야해 " + map.get("LATITUD"));
		System.out.println("경도 들어와라" + map.get("LONGITUDE"));
		List<Map<String, Object>> list = hairShopDAO.getDesignerInfo(hairShopId);
		System.out.println(map.size() + " list size = " + list.size());
		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getSearchHairShopList.do")
	public ModelAndView getSearchHairShopList(@RequestParam String hairShopName) {
		ModelAndView mav = new ModelAndView();
		System.out.println(hairShopName);
		List<Map<String, Object>> list = hairShopDAO.getSearchHairShopList(hairShopName);
		System.out.println(list.size());
//    System.out.println(list.get(0).get("MINPRICE"));
//    System.out.println(list.get(0).get("DISTANCE"));
		mav.addObject("listSize", list.size());
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getHeartBtn.do")
	public ModelAndView getHeartBtn(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println("하트버튼 " + map.get("hairShopId"));
		Map<String, Object> heartMap = hairShopDAO.getHeartBtn(map);
		mav.addObject("heartMap", heartMap);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/insertHeart.do")
	public ModelAndView insertHeart(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		System.out.println("하트버튼 " + map.get("hairShopId"));
		hairShopDAO.insertHeart(map);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/deleteHeart.do")
	public ModelAndView deleteHeart(@RequestParam Map<String, String> map) {
		System.out.println("하트버튼 " + map.get("hairShopId"));
		ModelAndView mav = new ModelAndView();
		hairShopDAO.deleteHeart(map);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getDesignerSchedule.do")
	public ModelAndView getDesignerSchedule(@RequestParam String selectedDay, @RequestParam String hairShopId) {
		ModelAndView mav = new ModelAndView();
		System.out.println("선택한 날짜" + selectedDay);
		System.out.println("선택한 헤어샵아이디" + hairShopId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("hairShopId", hairShopId);
		map.put("selectedDay", selectedDay);

		List<List<Map<String, Object>>> reservationList = new ArrayList<List<Map<String, Object>>>();
		List<Map<String, Object>> list = hairShopDAO.getDesignerSchedule(map);
		for (Map<String, Object> map2 : list) {
			System.out.println(map2.keySet());
		}

		for (Map<String, Object> designerMap : list) {
			List<Map<String, Object>> designerReservationList = hairShopDAO.timeBtnCheck(designerMap);
			System.out.println(designerReservationList.size());
			reservationList.add(designerReservationList);
		}
		mav.addObject("reservationList", reservationList);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/getServiceList.do", method = RequestMethod.POST)
	public ModelAndView getServiceList(@RequestParam String hairShopId, @RequestParam String pickedService) {
		ModelAndView mav = new ModelAndView();
		System.out.println("ajax hairShopId" + hairShopId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("hairShopId", hairShopId);
		map.put("pickedService", pickedService);
		List<Map<String, Object>> list = hairShopDAO.getServiceList(map);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/reserve.do", method = RequestMethod.POST)
	public ModelAndView reserve(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("선택한 디자이너" + map.get("chosenDesignerId"));
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> memCouponList = managementDAO.getCouponList((String)session.getAttribute("memEmail"));
		mav.setViewName("/main/index");
		mav.addObject("display", "/hairShop/reserve.jsp");
		mav.addObject("map", map);
		mav.addObject("memCouponList", memCouponList);
		mav.addObject("memCouponListSize", memCouponList.size());
		return mav;
	}
	
	@RequestMapping(value = "/hairShop/confirmedReservation.do", method = RequestMethod.POST)
	public ModelAndView confirmedReservation(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		
		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		int done = hairShopDAO.confirmedReservation(map);
		mav.setViewName("/main/index");
		if (done == 1) {
			managementDAO.usedCoupon(map);
			mav.addObject("display", "/hairShop/confirmedReservation.jsp");
		} else if (done == 0) {
			mav.addObject("display", "/hairShop/failedReservation.jsp");
		}
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping(value = "/hairShop/reviewList.do", method = RequestMethod.POST)
	public ModelAndView reviewList(@RequestParam String hairShopId) {

		List<HairShopReviewDTO> list = hairShopDAO.hairShopReviewList(hairShopId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/hairShop/randomReview.do", method = RequestMethod.GET)
	public ModelAndView randomReview() {

		List<HairShopReviewDTO> list = hairShopDAO.randomReviewList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;

	}

	// 리뷰 작성
	@RequestMapping(value = "/hairShop/reviewWrite.do", method = RequestMethod.POST)
	public @ResponseBody String reviewWrite(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		String reviewSubject = map.get("designerSubject");
		String reviewContent = map.get("designerContent");
		String starScope = map.get("starScope");

		map = managementDAO.checkReservationList(map);
		map.put("reviewSubject", reviewSubject);
		map.put("reviewContent", reviewContent);
		map.put("starScope", starScope);

		hairShopDAO.hairShopReviewWrite(map);

		model.addAttribute("display", "/hairShop/hairShop_index.jsp");
		model.addAttribute("memberPage", "/managementPage/usageDetailsInformationForm.jsp");
		model.addAttribute("memEmail", map.get("BOOKEREMAIL"));

		return "success";
	}
}