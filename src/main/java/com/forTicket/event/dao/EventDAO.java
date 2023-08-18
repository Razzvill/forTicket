package com.forTicket.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.forTicket.event.vo.EventVO;
import com.forTicket.event.vo.ImageFileVO;

@Mapper
@Repository("eventDAO")
public interface EventDAO {
	public List selectAllEventList() throws DataAccessException;
	public EventVO selectEventInfo(int event_no) throws DataAccessException;
	public int selectEventNo(Map eventMap) throws DataAccessException;
	public void insertEvent(Map eventMap) throws DataAccessException;
	public void updateEvent(Map eventMap) throws DataAccessException;
	public void updateEventStatus(Map eventMap) throws DataAccessException;
	public void deleteEvent(int event_no) throws DataAccessException;
	public List selectEventImageFileList(int image_id) throws DataAccessException;
	public void insertEventImage(ImageFileVO imageFileVO) throws DataAccessException;
	public void updateEventImage(ImageFileVO imageFileVO) throws DataAccessException;
	public void deleteEventImage(int image_id) throws DataAccessException;
}