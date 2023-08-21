package com.forTicket.member.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
     public int insertMember(MemberVO memberVO) throws DataAccessException ;
	 public int deleteMember(String mem_id) throws DataAccessException;
	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public MemberVO selectMemberById(String mem_id) throws DataAccessException;
	 public int updateMember(MemberVO memberVO) throws DataAccessException;
	 public String selectOverlappedID(String id) throws DataAccessException;
	 public String findId(@Param("mem_name") String mem_name, @Param("phone") String phone) throws DataAccessException;

}
