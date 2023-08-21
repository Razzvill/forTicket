package com.forTicket.event.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface EventController {
	public ModelAndView listEvent(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView A_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView B_listEvent(@RequestParam Map<String, String> dateMap, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView detailEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity addEvent(MultipartHttpServletRequest multipartReq, HttpServletResponse resp) throws Exception;
	public ModelAndView addForm(HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ModelAndView modForm(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public ResponseEntity modEvent(@RequestParam("event_no") int event_no, @RequestParam("attribute") String attribute, @RequestParam("value") String value, MultipartHttpServletRequest multipartReq, HttpServletResponse resp) throws Exception;
	public ResponseEntity modEventStatus(@RequestParam("event_no") int event_no, @RequestParam("attribute") String attribute, @RequestParam("value") String value, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeEvent(@RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp) throws Exception;
	public void addNewGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void modGoodsImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	public void removeGoodsImage(@RequestParam("goods_id") int goods_id, @RequestParam("image_id") int image_id, @RequestParam("imageFileName") String imageFileName, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
