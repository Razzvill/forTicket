package com.forTicket.theater.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.theater.vo.TheaterVO;

@Mapper
@Repository("memberDAO")
public interface TheaterDAO {
	public List selectAllTheaterList() throws DataAccessException;
	public TheaterVO selectTheaterInfo(int theater_id) throws DataAccessException;
	public int insertTheater(Map theaterMap) throws DataAccessException;
	public int updateTheater(Map theaterMap) throws DataAccessException;
	public int deleteTheater(Map theaterMap) throws DataAccessException;
}
