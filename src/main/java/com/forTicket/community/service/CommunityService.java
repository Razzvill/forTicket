package com.forTicket.community.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.forTicket.community.vo.CommunityVO;

public interface CommunityService {
	//관리자 커뮤니티 목록 a_commulist
	public ArrayList<CommunityVO> a_commulist(HashMap condMap) throws Exception;
	
	//사업자 커뮤니티 목록 b_commulist
	public ArrayList<CommunityVO> b_commulist(HashMap condMap) throws Exception;

	//회원 커뮤니티 목록 u_commulist
	public ArrayList<CommunityVO> u_commulist(HashMap condMap) throws Exception;
}