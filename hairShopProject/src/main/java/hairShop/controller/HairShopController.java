package hairShop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hairShop.bean.HairShopReviewDTO;
import hairShop.dao.HairShopDAO;

@Controller
public class HairShopController {
   @Autowired
   HairShopDAO hairShopDAO;
   @Autowired
   HairShopReviewDTO hairShopReviewDTO;
   
   
   @RequestMapping(value="/hairShop/hairShop_index.do", method=RequestMethod.GET)
   public ModelAndView input(@RequestParam String hairShopId) {  //사용자가 만든 콜백 메소드 
      ModelAndView mav = new ModelAndView();
      mav.addObject("hairShopId",hairShopId);
      mav.addObject("display","/hairShop/hairShop_index.jsp");
      mav.setViewName("/main/index");
      return mav;
   }
   
   @RequestMapping(value="/hairShop/search.do")
   public ModelAndView search(@RequestParam String service,
                        @RequestParam String date,
                        @RequestParam String day,
                        @RequestParam String latitud,
                        @RequestParam String longitude) {
      ModelAndView mav = new ModelAndView();
      System.out.println(latitud);
      mav.addObject("service", service);
      mav.addObject("day", day);
      mav.addObject("latitud", latitud);
      mav.addObject("longitude", longitude);
      mav.setViewName("/hairShop/search");
      return mav;
   }
   
   
   @RequestMapping(value="/hairShop/getSearchList.do")
   public ModelAndView getSearchList(@RequestParam Map<String, Object> map) {
      ModelAndView mav = new ModelAndView();
      System.out.println(map.get("latitud")+ " latitud 잘 들어오낭~");
      List<Map<String, Object>> list = hairShopDAO.getSearchList(map);
//    System.out.println(list.get(0).get("MINPRICE"));
//    System.out.println(list.get(0).get("DISTANCE"));
      mav.addObject("listSize", list.size());
      mav.addObject("list", list);
      mav.setViewName("jsonView");
      return mav;
   }
   
   @RequestMapping(value="/hairShop/getHairShopInfo.do", method=RequestMethod.POST)
   public ModelAndView getHairShopInfo(@RequestParam String hairShopId, HttpSession session) {
	   if(session.getAttribute("memEmail")!= null) {
		   String email = (String)session.getAttribute("memEmail");
		   System.out.println("getHairShopInfo 세션"+email);
	   }
	   
	   ModelAndView mav = new ModelAndView();
	   System.out.println("ajax hairShopId"+hairShopId);
	   Map<String, Object> map = hairShopDAO.getHairShopInfo(hairShopId);
	   System.out.println("위도 들어와야해 " + map.get("LATITUD"));
	   System.out.println("경도 들어와라" + map.get("LONGITUDE"));
	   List<Map<String, Object>> list = hairShopDAO.getDesignerInfo(hairShopId);
	   System.out.println(map.size() +" list size = "+list.size());
	   for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
           String keyName = (String) iterator.next();
           Object valueName = map.get(keyName);
           System.out.println(keyName +" = " +valueName);
	   }
	   mav.addObject("map",map);
	   mav.addObject("list",list);
	   mav.setViewName("jsonView");
	   return mav;
   }
   
   @RequestMapping(value="/hairShop/getDesignerSchedule.do")
   public ModelAndView getDesignerSchedule(@RequestParam String selectedDay,
		   @RequestParam String hairShopId) {
	   ModelAndView mav = new ModelAndView();
	   System.out.println("선택한 날짜" + selectedDay);
	   System.out.println("선택한 헤어샵아이디" + hairShopId);
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("hairShopId", hairShopId);
	   map.put("selectedDay", selectedDay);
	   
	   List<List<Map<String, Object>>> reservationList = new ArrayList<List<Map<String, Object>>>();
	   List<Map<String, Object>> list = hairShopDAO.getDesignerSchedule(map);
	   for(Map<String, Object> map2 :list) {
		   System.out.println(map2.keySet());
	   }
	   
	   for(Map<String, Object> designerMap : list) {		   
		   List<Map<String, Object>> designerReservationList = hairShopDAO.timeBtnCheck(designerMap);
		   System.out.println(designerReservationList.size());
		   reservationList.add(designerReservationList);
	   }
	   mav.addObject("reservationList", reservationList);
	   mav.addObject("list", list);
	   mav.setViewName("jsonView");
	   return mav;
   }
   @RequestMapping(value="/hairShop/getServiceList.do", method=RequestMethod.POST)
   public ModelAndView getServiceList(@RequestParam String hairShopId, @RequestParam String pickedService) {
      ModelAndView mav = new ModelAndView();
      System.out.println("ajax hairShopId"+hairShopId);
      Map<String, String> map = new HashMap<String, String>();
      map.put("hairShopId", hairShopId);
      map.put("pickedService", pickedService);
      List<Map<String, Object>> list = hairShopDAO.getServiceList(map);
      mav.addObject("list", list);
      mav.setViewName("jsonView");
      return mav;
   }
   
   @RequestMapping(value="/hairShop/reserve.do", method=RequestMethod.POST)
   public ModelAndView reserve(@RequestParam Map<String, String> map) {
	   System.out.println("선택한 디자이너" + map.get("chosenDesignerId"));
	   ModelAndView mav = new ModelAndView();
	   mav.setViewName("/main/index");
	   mav.addObject("display", "/hairShop/reserve.jsp");
	   mav.addObject("map", map);
	   return mav;
   }
   @RequestMapping(value="/hairShop/confirmedReservation.do", method=RequestMethod.POST)
   public ModelAndView confirmedReservation(@RequestParam Map<String, String> map) {
	   ModelAndView mav = new ModelAndView();
	   for (Iterator<String> iterator = map.keySet().iterator(); iterator.hasNext();) {
           String keyName = (String) iterator.next();
           Object valueName = map.get(keyName);
           System.out.println(keyName +" = " +valueName);
	   }
	   int done = hairShopDAO.confirmedReservation(map);
	   mav.setViewName("/main/index");
	   if(done == 1) {
		   mav.addObject("display", "/hairShop/confirmedReservation.jsp");		   
	   } else if(done == 0) {
		   mav.addObject("display", "/hairShop/failedReservation.jsp");		   		   
	   }
	   mav.addObject("map", map);
	   return mav;
   }
   
   @RequestMapping(value="/hairShop/reviewList.do",method=RequestMethod.POST)
   public ModelAndView reviewList() {
	   
	   List<HairShopReviewDTO> list = hairShopDAO.hairShopReviewList();
	   
	   
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("list", list);
	   mav.setViewName("jsonView");
	   return mav;
   }
}