package com.ogong.web.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ogong.service.admin.AdminService;
import com.ogong.service.banana.BananaService;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationService;

@RestController
@RequestMapping("/admin/*")
public class AdminRestController {
	
		
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BananaService bananaService;	
	
	public AdminRestController() {
		System.out.println(this.getClass());
	}
	
	//회원 복구 메소드
	@GetMapping( value="json/updateUserRestore/{email}")
	public void updateUserResotore(@PathVariable("email") String email) throws Exception{
		System.out.println("updateUserResotore : GET");
		
		adminService.updateUserRestore(email);
	}
	
	//회원 정보 조회 메소드
	@GetMapping( value="json/adminGetUser/{email}")
	public User adminGetUser(@PathVariable("email")String email) throws Exception{
		
		System.out.println("rest/getUser");
		
		return bananaService.adminGetUser(email);
	}

}
