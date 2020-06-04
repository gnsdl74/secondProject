package com.cannes.movie.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cannes.movie.domain.MemberVO;
import com.cannes.movie.service.MemberService;

@Controller
public class ManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 마이페이지 호출 시 ticket, pay, m_reply 연동
	@GetMapping(value = "/mypage")
	public String mypage(HttpServletRequest request, Model model) {
		logger.info("mypage() 호출");
		
		return "/management/mypage";
	} // end mypage()
	
	// 마이페이지에서 개인정보수정을 클릭했을 때
	@GetMapping(value = "/mypage/myinfo")
	public String myinfo() {
		logger.info("myinfo() 호출");
		return "/management/myinfo";
	} // end myinfo()
	
	@PostMapping(value = "/mypage/user")
	public String update(HttpServletRequest request, Model model) {
		logger.info("mypage update() 호출");
		
		// 개인정보 페이지를 가기 전 회원인지 판단
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPw(request.getParameter("memberPw"));
		
		MemberVO result = memberService.readDetail(vo);
		if(result == null) {
			return "/error";
			
		} else {
			model.addAttribute("userInfo", result);
			return "/management/user";
		}
	} // end update()
	
	@GetMapping(value = "/mypage/goodbye")
	public String goodbye() {
		logger.info("mypage goodbye() 호출");
		return "/management/goodbye";
	} // end goodbye()
	
	@GetMapping(value = "/mypage/userPwdChangePage")
	public String userPwdChangepage(MemberVO vo) {
		logger.info("mypage userPwdChangePage() 호출");
		return "/management/userPwdChangePage";
	} // end userPwdChangePage()
	
} // end ManagementController
