package management.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import fileUpload.realPath.FileUploadRealPath;
import hairShop.bean.ReservationDTO;
import management.dao.ManagementDAO;
import member.bean.DesignerDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Component
@RequestMapping(value = "/companyPage")
public class CompanyPageController {
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

// 메뉴 이동
	// 디자이너 관리
	@RequestMapping(value = "designerMenu", method = RequestMethod.GET)
	public ModelAndView designerMenu(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("memEmail") != null) {			
			Map<String, String> map = managementDAO.getHairShopInfo((String) session.getAttribute("memEmail"));
			mav.addObject("hairShopId", map.get("HAIRSHOPID"));
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/designerMenu.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");

		return mav;
	}

// 예약 현황 메뉴

	// 예약 현황 조회

	@RequestMapping(value = "getTotalReservation", method = RequestMethod.POST)
	public @ResponseBody String getTotalReservation(@RequestParam String hairshopId) {
		return managementDAO.getTotalReservation(hairshopId);
	}

	// 총 예약 매출 조회
	@RequestMapping(value = "getTotalReservePrice", method = RequestMethod.POST)
	public @ResponseBody String getTotalReservePrice(@RequestParam String hairshopId) {
		List<String> list = managementDAO.getTotalReservePrice(hairshopId);

		int totalPrice = 0;

		for (int i = 0; i < list.size(); i++) {
			totalPrice += Integer.parseInt(list.get(i));
		}

		return String.format("%,d", totalPrice);
	}

	// 헤어샵의 디자이너 이름 구하기
	@RequestMapping(value = "getHairShopDesigner", method = RequestMethod.POST)
	public ModelAndView getHairShopDesigner(@RequestParam String hairshopId) {
		List<String> list = managementDAO.getHairShopDesigner(hairshopId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 오늘 년, 월, 일 구하기
	@RequestMapping(value = "reserveCalender", method = RequestMethod.POST)
	public ModelAndView reserveCalender(@RequestParam int startDay) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, startDay);

		// 리스트 생성
		List<String> list = new ArrayList<String>();
		List<String> dayOfWeekList = new ArrayList<String>();

		String[] weekDay = { "일", "월", "화", "수", "목", "금", "토" }; // 요일을 구하기 위한 배열

		// 리스트에 데이터 추가
		for (int i = 0; i < 7; i++) {
			list.add(Integer.toString(c.get(c.YEAR)));
			list.add(Integer.toString(c.get(c.MONTH) + 1));
			list.add(Integer.toString(c.get(c.DATE)));

			dayOfWeekList.add(weekDay[c.get(c.DAY_OF_WEEK) - 1]);

			c.add(Calendar.DATE, 1); // 하루 증가
		} // 년,월,일을 7일치 추가해줌

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("dayOfWeekList", dayOfWeekList);
		mav.setViewName("jsonView");

		return mav;
	}

	// memberInfo(헤어샵 정보) 얻기
	@RequestMapping(value = "getMemberInfo", method = RequestMethod.POST)
	public ModelAndView getMemberInfo(@RequestParam String hairshopId) {
		List<MemberDTO> list = managementDAO.getMemberInfo(hairshopId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 디자이너 예약 얻기
	@RequestMapping(value = "getReserveTime", method = RequestMethod.POST)
	public ModelAndView getReserveTime(@RequestParam String designerid, @RequestParam int cnt,
			@RequestParam int startDay) {

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd");

		// DB
		List<ReservationDTO> list = managementDAO.getReservation(designerid); // 한명의 예약 정보 리스트

		// 리스트 생성
		List<String> bookerNameList = new ArrayList<String>(); // 예약자 이름 리스트
		List<String> bookerEmailList = new ArrayList<String>(); // 예약자 이메일 리스트
		List<String> bookerTelList = new ArrayList<String>(); // 예약자 연락처 리스트
		List<String> bookerRequestsList = new ArrayList<String>(); // 예약자 요청사항 리스트

		List<String> serviceList = new ArrayList<String>(); // 서비스 리스트
		List<String> descriptionList = new ArrayList<String>(); // 시술명 리스트
		List<String> priceList = new ArrayList<String>(); // 가격 리스트
		List<String> requiredTimeList = new ArrayList<String>(); // 요구시간 리스트
		List<String> startEndTimeList = new ArrayList<String>(); // 시작~끝 시간 리스트
		List<String> startList = new ArrayList<String>(); // 시작시간 리스트
		List<String> endList = new ArrayList<String>(); // 종료시간 리스트

		// 리스트에 데이터 추가
		for (ReservationDTO reservationDTO : list) {
			bookerNameList.add(reservationDTO.getBookername());
			bookerEmailList.add(reservationDTO.getBookeremail());
			bookerTelList.add(reservationDTO.getBookertel1() + '-' + reservationDTO.getBookertel2() + '-'
					+ reservationDTO.getBookertel3());
			bookerRequestsList.add(reservationDTO.getRequests());

			serviceList.add(reservationDTO.getService());
			descriptionList.add(reservationDTO.getDescription());
			priceList.add(String.format("%,d", reservationDTO.getPrice()));
			requiredTimeList.add(Integer.toString(reservationDTO.getTimerequired()));
			startEndTimeList
					.add(sdf.format(reservationDTO.getStarttime()) + " ~ " + sdf.format(reservationDTO.getEndtime()));
			startList.add(sdf.format(reservationDTO.getStarttime())); // 각 예약날의 시:분을 리스트에 추가
			endList.add(sdf.format(reservationDTO.getEndtime())); // 각 예약날의 시:분을 리스트에 추가
		}

		// td의 클래스들이 담긴 리스트
		List<String> tdClassList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) { // 예약이 더이상 없으면 break;
			Calendar c = Calendar.getInstance(); // 한 예약이 끝나면 캘린더 오늘날짜로 초기화
			c.add(Calendar.DATE, startDay);

			// String으로 하면 01처럼 앞에 0이 붙어서 비교가 힘들어서 int로 형변환
			int ReserveDay = Integer.parseInt(sdf2.format(list.get(i).getStarttime()));// 예약날의 일

			while (true) {

				// 오늘의 일과 예약날의 일이 같아지면 break
				if (ReserveDay == c.get(c.DATE)) { // 아래쪽에 두면 한달을 더 돌아버림
					break;
				}
				cnt++;

				c.add(Calendar.DATE, 1);
			}
			tdClassList.add(Integer.toString(cnt)); // cnt가 시작시간이 표시 될 td의 클래스가 됌

			cnt = 1;
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("bookerNameList", bookerNameList);
		mav.addObject("bookerEmailList", bookerEmailList);
		mav.addObject("bookerTelList", bookerTelList);
		mav.addObject("bookerRequestsList", bookerRequestsList);

		mav.addObject("serviceList", serviceList);
		mav.addObject("descriptionList", descriptionList);
		mav.addObject("priceList", priceList);
		mav.addObject("requiredTimeList", requiredTimeList);
		mav.addObject("startEndTimeList", startEndTimeList);
		mav.addObject("startList", startList);
		mav.addObject("endList", startList);

		mav.addObject("tdClassList", tdClassList);

		mav.setViewName("jsonView");

		return mav;
	}

// 디자이너 관리 메뉴

	// 디자이너 정보

	@RequestMapping(value = "getDesignerInfo", method = RequestMethod.POST)
	public ModelAndView getDesignerInfo(@RequestParam String hairshopId) {
		List<DesignerDTO> list = managementDAO.getDesignerInfo(hairshopId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");

		return mav;
	}

	// 디자이너 추가 or 수정
	@RequestMapping(value = "designerAdd", method = RequestMethod.POST)
	public ModelAndView designerAdd(@RequestParam Map<String, String> map, 
			@RequestParam(required = false) MultipartFile designerimageOriginal) {
		System.out.println("인서트 할지 수정할지 결정해라 " + map.get("insertOrUpdate"));
		map.put("designerid", map.get("hairshopid") + "_" + map.get("designername"));
		for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = map.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		String filePath = new FileUploadRealPath().designerImagePath;
		try {
			if (!designerimageOriginal.isEmpty()) {
				String fileName = map.get("designerid") + designerimageOriginal.getOriginalFilename();
				map.put("designerimage", fileName);
				File file1 = new File(filePath, fileName);
				FileCopyUtils.copy(designerimageOriginal.getInputStream(), new FileOutputStream(file1));
			} else {
				map.put("designerimage", "");
			} 
		}catch (IOException e) {
				e.printStackTrace();
		}
		if(map.get("insertOrUpdate").equals("insert")) {
			managementDAO.designerAdd(map);			
		}else if(map.get("insertOrUpdate").equals("update")) {
			if (!designerimageOriginal.isEmpty()) {
				managementDAO.designerModify(map);
			}else {
				managementDAO.designerModifyExceptImg(map);			
			}
		}
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/designerAdd.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

	// 선택된 디자이너 삭제
	@RequestMapping(value = "designerCheckedDelete", method = RequestMethod.POST)
	public ModelAndView designerCheckedDelete(@RequestParam(value = "designerIds[]") List<String> designerIds) {
		List<String> list = new ArrayList<String>();
		List<String> cannotDeletelist = new ArrayList<String>();
		
		
		for (String designerId : designerIds) {
			List<ReservationDTO> reservationList = managementDAO.getCommingReservation(designerId);
			//예약이 걸려있으면 디자이너를 지울 수 없음!!!
			System.out.println("예약 리스트 사이즈 " + reservationList.size());
			if(reservationList.size()==0) {
				list.add(designerId);	
				// DB
				if(list.size()>0) {
					managementDAO.designerCheckedDelete(list);			
				}
			}else {
				cannotDeletelist.add(designerId);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("cannotDeletelist", cannotDeletelist);
		mav.setViewName("jsonView");
		return mav;
	}

	// 헤어샵 정보 등록 페이지
	@RequestMapping(value = "hairShopInfoInput", method = RequestMethod.GET)
	public ModelAndView hairShopInfoInput(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("memEmail") != null) {
			Map<String, String> map = managementDAO.getHairShopInfo((String) session.getAttribute("memEmail"));
			mav.addObject("map", map);
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/hairShopInfoInput.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}

	// 헤어샵 서비스 리스트 페이지
	@RequestMapping(value = "serviceManagement")
	public ModelAndView serviceManagement(HttpSession session,
			@RequestParam(required = false, defaultValue = "") String serviceCategory) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("memEmail") != null) {
			System.out.println(serviceCategory + "선택한 카테고리");
			Map<String, String> map = new HashMap<String, String>();
			map.put("memEmail", (String) session.getAttribute("memEmail"));
			map.put("serviceCategory", serviceCategory);
			List<Map<String, Object>> list = managementDAO.getServices(map);
			mav.addObject("list", list);
			mav.addObject("serviceCategory", serviceCategory);
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/serviceManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}

	// 헤어샵 서비스 등록 페이지
	@RequestMapping(value = "serviceRegister", method = RequestMethod.GET)
	public ModelAndView serviceRegister(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("memEmail") != null) {
			Map<String, String> map = managementDAO.getHairShopInfo((String) session.getAttribute("memEmail"));
			mav.addObject("map", map);
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/serviceRegister.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}

	// 헤어샵 서비스 삭제하기
	@RequestMapping(value = "serviceDeleted")
	public ModelAndView serviceDeleted(HttpSession session, @RequestParam String[] hairShopId,
			@RequestParam String[] descriptions) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("memEmail") != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("hairShopId", hairShopId[0]);
			for (int i = 0; i < descriptions.length; i++) {
				map.put("description", descriptions[i]);
				managementDAO.deleteService(map);
			}
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/serviceDeleted.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}

	// 헤어샵 서비스 등록하기
	@RequestMapping(value = "serviceRegistered")
	public ModelAndView serviceRegistered(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		managementDAO.serviceRegister(map);
		mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/serviceRegistered.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

	// 헤어샵 스케줄 등록 페이지 띄우기
	@RequestMapping(value = "scheduleManagement", method = RequestMethod.GET)
	public ModelAndView scheduleManagement(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("memEmail") != null) {
			mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
			mav.addObject("myPageBody", "/managementPage/companyPage/scheduleManagement.jsp");
		} else {
			mav.addObject("display", "/main/body.jsp");
		}
		mav.setViewName("/main/index");
		return mav;
	}

	@RequestMapping(value = "getInfoForScheduling", method = RequestMethod.POST)
	public ModelAndView getInfoForScheduling(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Map<String, String>> list = managementDAO.getInfoForScheduling((String) session.getAttribute("memEmail"));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	// 한 헤어샵의 전체 디자이너 스케줄 등록
	@RequestMapping(value = "totalHairShopSchedule", method = RequestMethod.POST)
	public ModelAndView totalHairShopSchedule(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> loopMap = new HashMap<String, Object>();
		loopMap.put("totalStartDate", map.get("totalStartDate"));
		loopMap.put("hairShopId", map.get("hairShopId"));
		for (int i = 0; i <= Integer.parseInt(map.get("iMax")); i++) {
			loopMap.put("i", i);
			managementDAO.totalHairShopSchedule(loopMap);
		}
		mav.setViewName("jsonView");
		return mav;
	}

	// 휴가 등록
	@RequestMapping(value = "vacationDesignerSchedule", method = RequestMethod.POST)
	public ModelAndView vacationDesignerSchedule(@RequestParam Map<String, String> map) {
		System.out.println("휴가 가는 디자이너 " + map.get("designerId"));
		ModelAndView mav = new ModelAndView();
		Map<String, Object> loopMap = new HashMap<String, Object>();
		loopMap.put("vacationStartDate", map.get("vacationStartDate"));
		loopMap.put("designerId", map.get("designerId"));
		System.out.println(map.get("iMax") + "기간이 잘 들어왔나요 ");
		List<Integer> cannotDeleteDay = new ArrayList<Integer>();
		List<Integer> deletedDay = new ArrayList<Integer>();
		int deleted = 0;
		for (int i = 0; i <= Integer.parseInt(map.get("iMax")); i++) {
			System.out.println(i + "포문 잘 도니");
			loopMap.put("i", i);
			System.out.println("삭제 되는중??");
			deleted = managementDAO.vacationDesignerSchedule(loopMap);
			if(deleted==0) {
				cannotDeleteDay.add(i);
				System.out.println("못지우는 거 있니???");
			}else if(deleted==1) {
				System.out.println("지움 지움");
				deletedDay.add(i);
			}
			System.out.println(i + "이프문 뒤에");
		}
		System.out.println(cannotDeleteDay.size() + "지울 수 있는 날짜 수");
		mav.addObject("cannotDeleteDay", cannotDeleteDay);
		mav.addObject("deletedDay", deletedDay);
		mav.setViewName("jsonView");
		return mav;
	}

	// 추가 근무 등록
	@RequestMapping(value = "overworkDesignerSchedule", method = RequestMethod.POST)
	public ModelAndView overworkDesignerSchedule(@RequestParam Map<String, String> map) {
		System.out.println("추가 근무할 디자이너 " + map.get("designerId"));
		ModelAndView mav = new ModelAndView();
		Map<String, Object> loopMap = new HashMap<String, Object>();
		loopMap.put("overworkStartDate", map.get("overworkStartDate"));
		loopMap.put("designerId", map.get("designerId"));
		loopMap.put("hairShopId", map.get("hairShopId"));

		for (Iterator<String> iterator = loopMap.keySet().iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			Object valueName = loopMap.get(keyName);
			System.out.println(keyName + " = " + valueName);
		}
		for (int i = 0; i <= Integer.parseInt(map.get("iMax")); i++) {
			loopMap.put("i", i);
			managementDAO.overworkDesignerSchedule(loopMap);
		}
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "getHairShopInfo", method = RequestMethod.POST)
	public ModelAndView getHairShopInfo(HttpSession session) {
		Map<String, String> map = managementDAO.getHairShopInfo((String) session.getAttribute("memEmail"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "checkId.do")
	public @ResponseBody String checkId(@RequestParam String hairShopId) {
		System.out.println("아이디 찾으려구용" + hairShopId);
		if (managementDAO.isExistId(hairShopId))
			return "exist";
		else
			return "not_exist";
	}

	@RequestMapping(value = "checkLicense.do")
	public @ResponseBody String checkLicense(@RequestParam Map<String, String> map) {
		System.out.println("라이센스 찾으려구용" + map);
		if (managementDAO.isExistLicense(map))
			return "exist";
		else
			return "not_exist";
	}

	@RequestMapping(value = "hairShopInfoUpdate", method = RequestMethod.POST)
	public ModelAndView hairShopInfoUpdate(HttpSession session,
			@RequestParam("imageUpload[]") List<MultipartFile> imageUpload, @RequestParam String hairShopId,
			@RequestParam String name, @RequestParam String license1, @RequestParam String license2,
			@RequestParam String license3, @RequestParam String addr1, @RequestParam String addr2,
			@RequestParam String zipcode, @RequestParam String tel1, @RequestParam String tel2,
			@RequestParam String tel3, @RequestParam String hairShopContent, @RequestParam String dayoff,
			@RequestParam String openTime, @RequestParam String closeTime,
			@RequestParam String latitud, @RequestParam String longitude
			) {
		System.out.println("hairShopInfoUpdate 컨트롤러    " + imageUpload.size() + "이미지 리스트 사이즈" + imageUpload.get(0));
		ModelAndView mav = new ModelAndView();
		System.out.println(latitud + longitude + "경도 위도 들어오나요22222????");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", (String) session.getAttribute("memEmail"));
		map.put("name", name);
		map.put("hairShopId", hairShopId);
		map.put("license1", license1);
		map.put("license2", license2);
		map.put("license3", license3);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("zipcode", zipcode);
		map.put("tel1", tel1);
		map.put("tel2", tel2);
		map.put("tel3", tel3);
		map.put("hairShopContent", hairShopContent);
		map.put("dayoff", dayoff);
		map.put("openTime", openTime);
		map.put("closeTime", closeTime);
		map.put("latitud", latitud);
		map.put("longitude", longitude);

		String fileName = "";
		int su = 0;
		if (!imageUpload.get(0).getOriginalFilename().equals("")) {
			for (int i = 0; i < imageUpload.size(); i++) {
				MultipartFile eachImage = imageUpload.get(i);

				String filePath = new FileUploadRealPath().hairShopImagePath;
				fileName = (String) map.get("hairShopId") + "_" + eachImage.getOriginalFilename();
				File file = new File(filePath, fileName);
				map.put("hairShopImage" + (i + 1), fileName);
				try {
					FileCopyUtils.copy(eachImage.getInputStream(), new FileOutputStream(file));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (imageUpload.size() == 1) {
				map.put("hairShopImage" + "2", fileName);
				map.put("hairShopImage" + "3", fileName);
			}
			if (imageUpload.size() == 2) {
				map.put("hairShopImage" + "3", fileName);
			}
			su = managementDAO.hairShopInfoUpdate(map);
		} else {
			su = managementDAO.hairShopInfoUpdateExceptImg(map);
		}
		mav.addObject("su", su);
		mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/hairShopInfoUpdate.jsp");
		mav.setViewName("/main/index");
		return mav;
	}

	@RequestMapping(value = "stylebookManagement.do")
	public ModelAndView stylebookManagement(HttpSession session) {
		memberDTO = memberDAO.isCheckEmail((String) session.getAttribute("memEmail"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/stylebookManagement.jsp");
		mav.addObject("hairShopId", memberDTO.getHairshopid());
		mav.setViewName("/main/index");
		return mav;
	}

	@RequestMapping(value = "getStylebookImage.do")
	public ModelAndView getStylebookImage(@RequestParam String hairShopId, HttpSession session) {
		List<Map<String, String>> list = managementDAO.getStylebookImage(hairShopId);
		memberDTO = memberDAO.isCheckEmail((String) session.getAttribute("memEmail"));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", list);
		mav.addObject("display", "/managementPage/companyPage/companyPage.jsp");
		mav.addObject("myPageBody", "/managementPage/companyPage/stylebookManagement.jsp");
		mav.addObject("hairShopId", memberDTO.getHairshopid());
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "stylebookManagementInsert.do", method = RequestMethod.POST)
	public String staybookManagementModify(@RequestParam String hairshopId, @RequestParam String insertDiscription,
			@RequestParam String insertService, @RequestParam MultipartFile insertImage, Model model)
			throws IOException {

		MultipartFile hairImage = insertImage;
		String filePath = new FileUploadRealPath().styleImagePath;
		String fileName = hairshopId + "_" + hairImage.getOriginalFilename();
		File file = new File(filePath, fileName);
		FileCopyUtils.copy(hairImage.getInputStream(), new FileOutputStream(file));

		Map<String, String> map = new HashMap<String, String>();
		map.put("discription", insertDiscription);
		map.put("service", insertService);
		map.put("image", fileName);
		map.put("hairShopId", hairshopId);

		System.out.println(map);

		managementDAO.stylebookManagementInsert(map);

		model.addAttribute("display", "/managementPage/companyPage/companyPage.jsp");
		model.addAttribute("myPageBody", "/managementPage/companyPage/stylebookManagement.jsp");
		model.addAttribute("hairShopId", hairshopId);

		return "/main/index";
	}

	@RequestMapping(value = "staybookManagementModify.do", method = RequestMethod.POST)
	public String staybookManagementModify(@RequestParam String seq, @RequestParam String hairShopId,
			@RequestParam String discription, @RequestParam String service, @RequestParam MultipartFile image,
			Model model) throws IOException {

		MultipartFile hairImage = image;
		String filePath = new FileUploadRealPath().styleImagePath;
		String fileName = hairImage.getOriginalFilename();
		File file = new File(filePath, fileName);
		FileCopyUtils.copy(hairImage.getInputStream(), new FileOutputStream(file));

		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("discription", discription);
		map.put("service", service);
		map.put("image", fileName);

		managementDAO.stylebookManagementModify(map);

		model.addAttribute("display", "/managementPage/companyPage/companyPage.jsp");
		model.addAttribute("myPageBody", "/managementPage/companyPage/stylebookManagement.jsp");
		model.addAttribute("hairShopId", hairShopId);

		return "/main/index";
	}

	@RequestMapping(value = "stylebookDelete", method = RequestMethod.POST)
	public @ResponseBody String stylebookDelete(@RequestParam String seq) {
		managementDAO.stylebookDelete(seq);

		return "success";
	}

}