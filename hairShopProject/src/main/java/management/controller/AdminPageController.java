package management.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fileUpload.realPath.FileUploadRealPath;
import hairShop.bean.ReservationDTO;
import management.bean.ReservationPaging;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value = "/adminPage")
public class AdminPageController {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MemberDTO memberDTO;
	@Autowired
	private DesignerDTO designerDTO;
	@Autowired
	private ReservationDTO reservationDTO;
	@Autowired
	private ManagementDAO managementDAO;
	@Autowired
	private ReservationPaging reservationPaging;
	
/////////////////////////// 메뉴이동 ///////////////////////////

	// 회원 관리 메뉴 이동
	@RequestMapping(value = "memberManagement", method = RequestMethod.GET)
	public ModelAndView memberManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("memEmail") != null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/memberManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");

		return mav;
	}

	// 이벤트 관리 메뉴 이동
	@RequestMapping(value = "eventManagement", method = RequestMethod.GET)
	public ModelAndView eventManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("memEmail") != null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/eventManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");

		return mav;
	}

	// 이벤트 관리 메뉴 이동
	@RequestMapping(value = "eventRegister", method = RequestMethod.GET)
	public ModelAndView eventList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if (session.getAttribute("memEmail") != null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/eventRegister.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	// 예약 관리 메뉴 이동
	@RequestMapping(value="reservationManagement", method=RequestMethod.GET)
	public ModelAndView reservationManagement(HttpSession session,
											  @RequestParam(required=false, defaultValue="1") String pg,
											  @RequestParam(required = false, defaultValue = "") String searchOption, 
											  @RequestParam(required = false, defaultValue = "") String keyword) {
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("pg", pg);
			mav.addObject("searchOption", searchOption);
			mav.addObject("keyword", keyword);
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/reservationManagement.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}

/////////////////////////// 회원 관리 ///////////////////////////

	// 개인회원 조회
	@RequestMapping(value = "getMemberList", method = RequestMethod.POST)
	public ModelAndView getMemberList() {
		List<MemberDTO> memberList = managementDAO.getMemberByType("0");

		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", memberList);
		mav.setViewName("jsonView");

		return mav;
	}

	// 개인회원 total 조회
	@RequestMapping(value = "getMemberTotal", method = RequestMethod.POST)
	public @ResponseBody String getMemberTotal() {
		return managementDAO.getMemberTotal();
	}

	// 개인회원 삭제
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public @ResponseBody void memberDelete(@RequestParam String email) {
		managementDAO.memberDelete(email);
	}

	// 개인회원 비밀번호 수정
	@RequestMapping(value = "memberPwdModify", method = RequestMethod.POST)
	public @ResponseBody void memberPwdModify(@RequestParam String email, @RequestParam String modifyPwd) {

		managementDAO.memberPwdModify(email, modifyPwd);
	}

///////////////////////// 헤어샵 관리 ///////////////////////////
	
	// 헤어샵 total 조회
	@RequestMapping(value="getTotalHairShop", method=RequestMethod.POST)
	public @ResponseBody String getTotalHairShop() {
		return managementDAO.getTotalHairShop();
	}

	// 헤어샵 이름 조회
	@RequestMapping(value = "getHairShopName", method = RequestMethod.POST)
	public ModelAndView getHairShopName() {
		List<String> hairShopNameList = managementDAO.getHairShopName();

		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopNameList", hairShopNameList);
		mav.setViewName("jsonView");

		return mav;
	}

	// 헤어샵 리스트 조회
	@RequestMapping(value = "getHairShopList", method = RequestMethod.POST)
	public ModelAndView getHairShopList(@RequestParam String hairShopName) {
		List<MemberDTO> hairShopList = managementDAO.getHairShopList(hairShopName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopList", hairShopList);
		mav.setViewName("jsonView");

		return mav;
	}
	
	// 헤어샵 삭제
	@RequestMapping(value="hairShopDelete", method=RequestMethod.POST)
	public @ResponseBody void hairShopDelete(@RequestParam String email) {
		managementDAO.hairShopDelete(email);
	}
	
	// 헤어샵 수정
	@RequestMapping(value="hairShopPwdModify", method=RequestMethod.POST)
	public @ResponseBody void hairShopPwdModify(@RequestParam String email,	
						    @RequestParam String modifyPwd) {
		managementDAO.hairShopPwdModify(email, modifyPwd);
	}
	
///////////////////////// 예약 관리 ///////////////////////////
	
	// 예약 total 조회
	@RequestMapping(value="getReservationTotal", method=RequestMethod.POST)
	public ModelAndView getReservationTotal() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		
		List<ReservationDTO> allReservationList = managementDAO.getAllReservation(); // 모든 예약이 담긴 리스트
		List<String> ReservationTotalList = new ArrayList<String>(); // return 할 리스트
		
		// 예약날과 현재날이 같으면 카운팅
		int todayCnt = 0;
		for(ReservationDTO dto : allReservationList) {
			if((sdf.format(dto.getLogtime())).equals(sdf.format(date)))
				todayCnt++;
		}
		
		ReservationTotalList.add(Integer.toString(allReservationList.size()));
		ReservationTotalList.add(Integer.toString(todayCnt));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ReservationTotalList", ReservationTotalList);
		mav.setViewName("jsonView");

		return mav;
	}
	
	// 예약 리스트 조회
	@RequestMapping(value="getReservationList", method=RequestMethod.POST)
	public ModelAndView getReservationList(@RequestParam int pg) {
		// 리스트
		int endNum = pg*10;
		int startNum = endNum-9;
		List<ReservationDTO> reservationList = managementDAO.getReservationList(startNum, endNum);
		
		// 페이징
		int totalA = managementDAO.getListTotalA();
		reservationPaging.setCurrentPage(pg);
		reservationPaging.setPageBlock(10);
		reservationPaging.setPageSize(8);
		reservationPaging.setTotalA(totalA);
		reservationPaging.makePagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservationPaging", reservationPaging.getPagingHTML());
		mav.addObject("reservationList", reservationList);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	// 예약 검색
	@RequestMapping(value="reservationSearch", method=RequestMethod.POST)
	public ModelAndView reservationSearch(@RequestParam(required=false) Map<String, String> map, 
										  HttpSession session) {
		
		// DB
		int pg = Integer.parseInt(map.get("pg"));
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		
		List<ReservationDTO> reservationSearchList = managementDAO.reservationSearch(map);

		int totalA = managementDAO.getSearchReservationTotalA(map);
		reservationPaging.setCurrentPage(pg);
		reservationPaging.setPageBlock(10);
		reservationPaging.setPageSize(8);
		reservationPaging.setTotalA(totalA);
		reservationPaging.makeSearchPagingHTML();
		
	 	ModelAndView modelAndView = new ModelAndView();
	 	modelAndView.addObject("pg", pg);
	 	modelAndView.addObject("searchOption", map.get("searchOption"));
	 	modelAndView.addObject("keyword", map.get("keyword"));
	 	modelAndView.addObject("reservationSearchList", reservationSearchList);
	 	modelAndView.addObject("reservationPaging", reservationPaging.getPagingHTML());
	 	modelAndView.setViewName("jsonView");
	 	
		return modelAndView;
	}
	
///////////////////////// 이벤트 관리 ///////////////////////////
	
	// 이벤트 등록
	@RequestMapping(value = "eventRegistered", method = RequestMethod.POST)
	public ModelAndView eventRegister(@RequestParam Map<String, String> map,
			@RequestParam(required = false) MultipartFile eventBannerImage,
			@RequestParam(required = false) MultipartFile eventDetailImage,
			@RequestParam(required = false) MultipartFile couponImage,
			HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();

		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		
		if (!map.containsKey("termOfValidity"))
			map.put("termOfValidity", "");

		if (!map.containsKey("expirationDate"))
			map.put("expirationDate", "");
		if(map.get("minPrice").equals("")) {
			map.put("minPrice", "0");
		}
		
		String filePath = new FileUploadRealPath().eventImagePath;
		try {
			if (!eventBannerImage.isEmpty()) {
				String fileName1 = "register_" + eventBannerImage.getOriginalFilename();
				map.put("eventBannerImage", fileName1);
				File file1 = new File(filePath, fileName1);
				FileCopyUtils.copy(eventBannerImage.getInputStream(), new FileOutputStream(file1));
			} else {
				map.put("eventBannerImage", "");
			}
			if (!eventDetailImage.isEmpty()) {
				String fileName2 = "register_" + eventDetailImage.getOriginalFilename();
				map.put("eventDetailImage", fileName2);
				File file2 = new File(filePath, fileName2);
				FileCopyUtils.copy(eventDetailImage.getInputStream(), new FileOutputStream(file2));
			} else {
				map.put("eventDetailImage", "");
			}
			if (!couponImage.isEmpty()) {
				String fileName3 = "register_" + couponImage.getOriginalFilename();
				map.put("couponImage", fileName3);
				File file3 = new File(filePath, fileName3);
				FileCopyUtils.copy(couponImage.getInputStream(), new FileOutputStream(file3));
			} else {
				map.put("couponImage", "");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		managementDAO.eventRegister(map);

		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.addObject("myPageBody", "/managementPage/adminPage/eventRegistered.jsp");
		mav.setViewName("/main/index");

		return mav;
	}
	
	// event 조회
	@RequestMapping(value = "getEventList", method = RequestMethod.POST)
	public ModelAndView getEventList() {
		List<Map<String, Object>> eventList = managementDAO.getEventList();
		List<Map<String, Object>> getEndEventList = managementDAO.getEndEventList();
		System.out.println("이벤트리스트 사이즈" + eventList.size());
		System.out.println("종료이벤트리스트 사이즈" + getEndEventList.size());

		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList", eventList);
		mav.addObject("endEventList", getEndEventList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// member Coupon Down
	@RequestMapping(value = "couponDownExpire", method = RequestMethod.POST)
	public ModelAndView couponDownExpire(@RequestParam String seq, @RequestParam String memEmail) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("seq",seq);
		map.put("memEmail",memEmail);
		ModelAndView mav = new ModelAndView();
		if(managementDAO.couponCheckDuplication(map) == 0) {
			managementDAO.couponDownExpire(map);
			mav.addObject("success","0"); // 0일때 쿠폰다운 성공
		} else {
			mav.addObject("success","1");
		}
		return mav;
	}
	
	@RequestMapping(value = "getEventAndCouponList", method = RequestMethod.POST)
	public ModelAndView getEventAndCouponList() {
		List<Map<String, Object>> currentEventAndList = managementDAO.getCurrentEventAndCouponList();
		List<Map<String, Object>> pastEventAndList = managementDAO.getPastEventAndCouponList();
		System.out.println("진행중인 이벤트와 쿠폰 리스트 사이즈" + currentEventAndList.size());
		System.out.println("종료된 이벤트와 쿠폰 리스트 사이즈" + pastEventAndList.size());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("currentEventAndList", currentEventAndList);
		mav.addObject("pastEventAndList", pastEventAndList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "couponDownTerm", method = RequestMethod.POST)
	public ModelAndView couponDownTerm(@RequestParam String seq, @RequestParam String memEmail) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("seq",seq);
		map.put("memEmail",memEmail);
		ModelAndView mav = new ModelAndView();
		if(managementDAO.couponCheckDuplication(map) == 0) {
			managementDAO.couponDownTerm(map);
			mav.addObject("success","0");
		} else {
			mav.addObject("success","1");
		}
		mav.setViewName("jsonView");
		return mav;
	}
	
	//member coupon end
	@RequestMapping(value = "eventUpdate", method = RequestMethod.POST)
	public ModelAndView eventUpdate(@RequestParam String updateOrDelete, @RequestParam String[] seqs) {
		ModelAndView mav = new ModelAndView();

		if(updateOrDelete.equals("doDelete")) {
			List<Integer> list = new ArrayList<Integer>();
			for(String seq : seqs) {
				list.add(Integer.parseInt(seq));
			}
			managementDAO.deleteEvent(list);
			mav.addObject("myPageBody", "/managementPage/adminPage/eventDeleted.jsp");			
		}else if(updateOrDelete.equals("doUpdate")) {
			Map<String, Object> eventMap = managementDAO.getTargetEvent(seqs[0]);
			mav.addObject("eventMap", eventMap);
			mav.addObject("myPageBody", "/managementPage/adminPage/eventUpdate.jsp");
		}
		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	@RequestMapping(value = "eventUpdated", method = RequestMethod.POST)
	public ModelAndView eventUpdated(@RequestParam Map<String, String> map,
			@RequestParam(required = false) MultipartFile eventBannerImage,
			@RequestParam(required = false) MultipartFile eventDetailImage,
			@RequestParam(required = false) MultipartFile couponImage,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("수정할 녀석들");
		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		System.out.println(eventBannerImage.getOriginalFilename());
		System.out.println(eventDetailImage.getOriginalFilename());
		System.out.println(couponImage.getOriginalFilename());
		
		if (!map.containsKey("termOfValidity"))
			map.put("termOfValidity", "");

		if (!map.containsKey("expirationDate"))
			map.put("expirationDate", "");
		
		String filePath = new FileUploadRealPath().eventImagePath;
		try {
			if (!eventBannerImage.isEmpty()) {
				String fileName1 = "register_" + eventBannerImage.getOriginalFilename();
				map.put("eventBannerImage", fileName1);
				File file1 = new File(filePath, fileName1);
				FileCopyUtils.copy(eventBannerImage.getInputStream(), new FileOutputStream(file1));
			} else {
				map.put("eventBannerImage", map.get("unchangedBannerImg"));
			}
			if (!eventDetailImage.isEmpty()) {
				String fileName2 ="register_" + eventDetailImage.getOriginalFilename();
				map.put("eventDetailImage", fileName2);
				File file2 = new File(filePath, fileName2);
				FileCopyUtils.copy(eventDetailImage.getInputStream(), new FileOutputStream(file2));
			} else {
				map.put("eventDetailImage", map.get("unchangedDetailImg"));
			}
			if (!couponImage.isEmpty()) {
				String fileName3 = "register_" + couponImage.getOriginalFilename();
				map.put("couponImage", fileName3);
				File file3 = new File(filePath, fileName3);
				FileCopyUtils.copy(couponImage.getInputStream(), new FileOutputStream(file3));
			} else {
				map.put("couponImage", map.get("unchangerdCouponImg"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		managementDAO.updateEvent(map);
		mav.addObject("myPageBody", "/managementPage/adminPage/eventUpdated.jsp");			
		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.setViewName("/main/index");
		return mav;
	}
	
	///////////////////////// 배너 관리 ////////////////////////////////////////////////////
	
	// 배너 관리 메뉴 이동
	@RequestMapping(value="bannerManagement", method=RequestMethod.GET)
	public ModelAndView bannerManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("memEmail")!=null) {
			mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
			mav.addObject("myPageBody", "/managementPage/adminPage/bannerManagement.jsp");
		}else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		
		return mav;
	}
	
	@RequestMapping(value="banner_eventList", method=RequestMethod.POST)
	public ModelAndView banner_eventList() {
		List<Map<String, Object>> eventList = managementDAO.getEventList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList", eventList);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="bannerRegister", method=RequestMethod.POST)
	public ModelAndView bannerRegister(@RequestParam String bannerOption) {
		System.out.println(bannerOption);
		
		managementDAO.bannerResister(bannerOption);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/adminPage/adminPage.jsp");
		mav.addObject("myPageBody", "/managementPage/adminPage/bannerRegister.jsp");
		mav.setViewName("/main/index");
		return mav;

		
	}
}
