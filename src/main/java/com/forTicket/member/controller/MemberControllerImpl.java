package com.forTicket.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forTicket.member.service.MemberService;
import com.forTicket.member.vo.MailDTO;
import com.forTicket.member.vo.MemberVO;

@Controller("MemberController")
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	private MemberVO memberVO ;
	private HttpSession session;
	

	//로그인 페이지 이동
	@RequestMapping(value= "/member/loginForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "/member/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		session.removeAttribute("type");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}	
	
	//회원가입 선택
	@RequestMapping(value= "/member/join.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView join(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}	
	
	
	//일반 회원가입 페이지
	@RequestMapping(value= "/member/memberForm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView memberForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		
		HttpSession session=request.getSession();
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		return mav;
	}
	
	//사업주 회원가입 페이지
		@RequestMapping(value= "/member/businessForm.do", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView businessForm(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			HttpSession session=request.getSession();
					
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			
			return mav;
		}
    
	//일반회원가입 정보 주입
	@Override
	@RequestMapping(value="/member/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView insertMember(@ModelAttribute("member") MemberVO member,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8"); 
	    int result = 0;
	    result = memberService.insertMember(member);
	    ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
	    return mav;
	}
	
	//사업주회원가입 정보 주입
	@Override
	@RequestMapping(value="/member/addbusiness.do" ,method = RequestMethod.POST)
	public ModelAndView insertbusiness(@ModelAttribute("member") MemberVO member,
	                              HttpServletRequest request, HttpServletResponse response) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8"); 
	    int result = 0;
	    result = memberService.insertbusiness(member);
	    ModelAndView mav = new ModelAndView("redirect:/member/loginForm.do");
	    return mav;
	}
	
	//로그인
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		
		if(memberVO != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("member", memberVO);
		    session.setAttribute("isLogOn", true);
		    session.setAttribute("type", memberVO.getType());
		   		    
		    String action = (String)session.getAttribute("action");
		    session.removeAttribute("action");
		    if(action!= null) {
		       mav.setViewName("redirect:"+action);
		    }else {
		       mav.setViewName("redirect:/main.do");	
		    }
		}else {
		   rAttr.addAttribute("result","loginFailed");
		   mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	//중복검사
	@Override
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
   
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
    public ModelAndView findIdForm(HttpServletRequest request, HttpServletResponse response) {
        String viewName = (String) request.getAttribute("viewName");

        HttpSession session = request.getSession();

        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);

        return mav;
    }

    // 아이디 찾기 처리 (이름과 핸드폰번호로)
    @Override
    @RequestMapping(value = "/member/findIdResult.do", method = RequestMethod.POST)
    public ModelAndView findIdResult(@RequestParam("mem_name") String mem_name,
            @RequestParam("phone") String phone, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ModelAndView mav = new ModelAndView();
        String foundId = memberService.findId(mem_name, phone);
        boolean idFound = (foundId != null && !foundId.isEmpty());

        mav.addObject("idFound", idFound);
        mav.addObject("foundId", foundId);
        mav.addObject("mem_name", mem_name);
        mav.setViewName("/member/findIdResult"); // 결과를 표시할 JSP 페이지의 경로

        return mav;
    }
    
    // 이메일 보내기
    @Transactional
    @RequestMapping("/member/sendEmail.do")
    public String sendEmail(@RequestParam("email") String email) {
        MailDTO dto = memberService.createMailAndChangePassword(email);
        memberService.mailSend(dto);

        return "redirect:/member/loginForm.do"; // 수정된 부분
    }
    
	//회원 정보 수정	
	@Override
	@RequestMapping(value="/member/updateMember.do", method = RequestMethod.GET)
	public ModelAndView updateMember(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		int result = 0;
		result = memberService.updateMember(member);
	    ModelAndView mav = new ModelAndView("redirect:/main.do");
	    return mav;
	}
	
	//회원 수정창 이동, memberVO값 가져오기
	@Override
	@RequestMapping(value="/member/m_Edit.do", method = RequestMethod.GET)
	public ModelAndView m_Edit(@RequestParam("mem_id") String mem_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		MemberVO member = new MemberVO();
		
		request.setCharacterEncoding("utf-8");

		String viewName = (String)request.getAttribute("viewName");
		
		HashMap<String,String> condMap = new HashMap<String,String>();
		
		ModelAndView mav = new ModelAndView();

		condMap.put("mem_id", mem_id);

		member = memberService.m_Edit(condMap);
		
		mav.addObject("taget", member);
		
		mav.setViewName(viewName);
		
		return mav;
	}
	
	// 카카오 로그인
	@Override
	@RequestMapping(value = "/member/kakaoLoginPro.do", method = RequestMethod.POST)
	public ModelAndView kakaoLoginPro(@RequestParam Map<String, Object> paramMap, HttpSession session)
	        throws SQLException, Exception {
	    ModelAndView mav = new ModelAndView();
	    System.out.println("paramMap:" + paramMap);

	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    
	    // 1. 카카오로부터 받은 정보 처리
	    String kakaoId = (String) paramMap.get("id");
	    String kakaoNickname = (String) paramMap.get("nickname");

	    // 2. 카카오 연동된 사용자인지 확인
	    Map<String, Object> kakaoConnectionCheck = memberService.kakaoConnectionCheck(paramMap);

	    if (kakaoConnectionCheck == null) {
	    	System.out.println("회원가입");
	        // 3. 카카오 연동된 사용자가 아니라면, 회원가입 페이지로 이동
	        mav.setViewName("redirect:/member/memberForm.do");
	    } else if (kakaoConnectionCheck.get("api") == null && kakaoConnectionCheck.get("email") != null) {
	        // 4. 카카오 연동된 사용자인 경우, 로그인 처리를 합니다.
	        // 이 부분은 회원 정보에 따라 로그인 처리 방식을 수정할 수 있습니다.
	        // 여기서는 memberService를 사용하여 로그인 처리를 진행하도록 가정합니다.
	        MemberVO memberVO = new MemberVO();

	        try {
	            // 5. 회원 로그인 처리
	            memberVO = memberService.login(memberVO);
	            if (memberVO != null) {
	                session.setAttribute("memberVO", memberVO);
	                session.setAttribute("isLogOn", true);
	                resultMap.put("JavaData", "YES");
	            } else {
	                resultMap.put("JavaData", "로그인 실패 메시지");
	            }
	        } catch (Exception e) {
	            // 6. 로그인 처리 중 예외 발생
	            resultMap.put("JavaData", "로그인 실패 메시지");
	        }
	    } else {
	        resultMap.put("JavaData", "로그인 실패 메시지");
	    }

	    mav.addObject("resultMap", resultMap);
	    System.out.println("resultMap : " + resultMap);
	    return mav;
	}
   
}