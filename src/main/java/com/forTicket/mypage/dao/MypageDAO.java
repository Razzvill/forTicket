package com.forTicket.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.member.vo.MemberVO;

@Mapper
@Repository("mypageDAO")
public interface MypageDAO {
	//마이예매페이지
    public ArrayList<MemberVO> myReservation(HashMap condMap) throws DataAccessException;

}