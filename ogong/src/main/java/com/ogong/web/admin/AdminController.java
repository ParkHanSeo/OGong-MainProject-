package com.ogong.web.admin;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ogong.common.Page;
import com.ogong.common.Search;
import com.ogong.service.admin.AdminService;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//Filed
	@Autowired
	private AdminService adminService;
	
	//Constructor
	public AdminController() {
		System.out.println(this.getClass());
	}
	
	//신고하기 메소드
	@PostMapping("addReport")
	public String addReport( @ModelAttribute("report") Report report,
							 HttpServletRequest request,
							 HttpSession session,
							 Model model) throws Exception{
		
		System.out.println("addReport/Post 시작");
		
		//session에 있는 user값을 가져옴 (신고한 유저)
		User user = (User)session.getAttribute("user");		
		report.setSendReporter(user);
		
		System.out.println("report 확인 :::: "+report);
		//header의 값을 문자열로 반환
		String referer = request.getHeader("Referer");

		
		adminService.addReport(report);
		
		
		return "redirect:"+ referer;
		
	}
	
	//신고 목록 메소드
	@RequestMapping(value="listReport")
	public String listReport(@ModelAttribute("search") Search search, Model model,
							 @RequestParam("reportType") String reportType,
													   HttpServletRequest request) throws Exception{
		
		//reportType=신고타입으로 (1 = 게시글신고),(2 = 댓글신고),(3 = 답변신고)
		int pageSize = 15;
		int pageUnit = 15;
		
		System.out.println("/listReport/reportType="+reportType+" 시작");
		
		//검색
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//HashMap에 검색과, 신고타입을 저장
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("reportType", reportType);
		
		Map<String,Object> result = adminService.getlistReport(map);
		List<Object> list = (List<Object>)result.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)result.get("totalCount")).intValue(), pageUnit, pageSize);
		//출력값 확인
		System.out.println("resultType " + reportType);
		System.out.println("resultPage " + resultPage);
		System.out.println("유저확인."+map);
		
		//model에 담아서 return
		model.addAttribute("list", result.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("reportType", reportType);
		
		return "/adminView/listReport";
	}
	
	//신고된 사용자 목록 메소드
	@RequestMapping(value="listUserReport")
	public String listUserReport(@ModelAttribute("search") Search search, Model model,
			   HttpServletRequest request) throws Exception{
		
		int pageSize = 15;
		int pageUnit = 15;
		
		HttpSession session = request.getSession();
		
		System.out.println("/listUserReport 시작");
		
		//검색
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//HashMap에 검색 저장		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		Map<String,Object> result = adminService.getlistUserReport(map);
		List<Object> list = (List<Object>)result.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)result.get("totalCount")).intValue(), pageUnit, pageSize);

		//출력값 확인
		System.out.println("resultPage " + resultPage);
		System.out.println("유저확인."+map);
		
		//model로 담아 return
		model.addAttribute("list", result.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		
		
		return "/adminView/listUserReport";
	}
	
	//모든 회원 목록 메소드
	@RequestMapping(value="listTotalUser")
	public String listTotalUser(@ModelAttribute("search") Search search, Model model,
								@RequestParam("listType") String listType,
								HttpServletRequest request) throws Exception{
		
		//listType=회원목록타입으로 (1 = 모든회원),(2 = 탈퇴한회원),(3 = 복구한회원),(4 = 정지된회원)
		int pageSize = 15;
		int pageUnit = 15;
		
		System.out.println("/listTotalUser 시작");

		//검색
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//HashMap에 검색, 회원목록타입 저장
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("listType", listType);
		
		Map<String,Object> result = adminService.getlistTotalUser(map);
		List<Object> list = (List<Object>)result.get("list");
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)result.get("totalCount")).intValue(), pageUnit, pageSize);
		
		//출력값 확인
		System.out.println("여기는 listType " + listType);
		System.out.println("여기는 resultPage " + resultPage);
		
		//model에 담아 return
		model.addAttribute("list", result.get("list"));
		model.addAttribute("search", search);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("listType", listType);
		
		return "/adminView/listTotalUser";
	}
	
	//회원 정지 메소드
	@PostMapping("updateSuspendUser")
	public String updateSuspendUser(@ModelAttribute("report") Report report, Model model,
									@RequestParam("email") String email,
									@RequestParam("suspendType") String suspendType) throws Exception {
		
		//suspendType은 정지기간타입으로 (1 = 7일),(2 = 30일),(3 = 영구정지)
		System.out.println("/updateSuspendUser/suspendType="+suspendType+"/POST");
		
		
		User receiveReport = new User();
		//신고당한유저의 정지기간(타입)을 선택
		receiveReport.setEmail(email);
		report.setReceiveReporter(receiveReport);
		report.setSuspendType(suspendType);
		
		//출력값 확인
		System.out.println(receiveReport+"여기는...");
		System.out.println(suspendType+"여기는...");
		
		//model로 담아서 return
		model.addAttribute("receiveReport", receiveReport);
		model.addAttribute("report", report);
		
		adminService.updateUserSuspend(report);
		
		//updateSuspendUser메소드 실행시 listUserReport메소드로 redirect
		return "redirect:/admin/listUserReport";
		
	}
	
	//회원 복구 메소드
	@GetMapping("updateSuspendUser")
	public String updateSuspendUser(@RequestParam("receiveReporter") String email,
									Model model) throws Exception {
		System.out.println("/updateSuspendUser/GET");
		
		//출력값 확인
		System.out.println(email);
		
		//model에 담아 return
		model.addAttribute("receiveReporter", email);
		
		return "/adminView/updateSuspendUser";
		
	}
	
	//Modal창을 띄우기 위한(jsp:include) 메소드
	@GetMapping("reportModal")
	public String reportModal() {
		
		return "/adminView/addReport";
		
	}
	
	
}













