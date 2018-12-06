package management.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.ReservationDTO;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value = "/adminPage")
public class AdminPageController implements ServletContextAware{
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
	
	private ServletContext servletContext;

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

		System.out.println(hairShopList.size());

		ModelAndView mav = new ModelAndView();
		mav.addObject("hairShopList", hairShopList);
		mav.setViewName("jsonView");

		return mav;
	}

	// 이벤트 등록
	@RequestMapping(value = "eventRegister", method = RequestMethod.POST)
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
		
		String realPath = servletContext.getRealPath("/main/assets/images/event");
		System.out.println(realPath + "진짜 경로 가져오는가!!! 서블릿 컨텍스트 너만 믿는다");
		if (!map.containsKey("termOfValidity"))
			map.put("termOfValidity", "");

		if (!map.containsKey("expirationDate"))
			map.put("expirationDate", "");
		
		String filePath = "C:\\Users\\stell\\git\\hairShopProject\\hairShopProject\\hairShopProject\\src\\main\\webapp\\main\\assets\\images\\event";
		try {
			if (!eventBannerImage.isEmpty()) {
				String fileName1 = map.get("eventSubject") + eventBannerImage.getOriginalFilename();
				map.put("eventBannerImage", fileName1);
				File file1 = new File(filePath, fileName1);
				FileCopyUtils.copy(eventBannerImage.getInputStream(), new FileOutputStream(file1));
			} else {
				map.put("eventBannerImage", "");
			}
			if (!eventDetailImage.isEmpty()) {
				String fileName2 = map.get("eventSubject") + eventDetailImage.getOriginalFilename();
				map.put("eventDetailImage", fileName2);
				File file2 = new File(filePath, fileName2);
				FileCopyUtils.copy(eventDetailImage.getInputStream(), new FileOutputStream(file2));
			} else {
				map.put("eventDetailImage", "");
			}
			if (!couponImage.isEmpty()) {
				String fileName3 = map.get("eventSubject") + couponImage.getOriginalFilename();
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
		mav.addObject("myPageBody", "/managementPage/adminPage/eventRegister.jsp");
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

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
