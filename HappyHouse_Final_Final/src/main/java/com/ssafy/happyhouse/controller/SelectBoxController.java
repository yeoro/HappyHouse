package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.domain.CCTVDto;
import com.ssafy.happyhouse.domain.CriminalDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SidoCodeDto;
import com.ssafy.happyhouse.domain.UnpleasantFacilitiesDto;
import com.ssafy.happyhouse.service.SelectBoxService;

@Controller
public class SelectBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private SelectBoxService service;
	
	@RequestMapping("/SelectBoxController")
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if(command.equals("sido")) {
			PrintWriter out = response.getWriter();
			ArrayList<SidoCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectSido();
				for(SidoCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("sido_code", dto.getSido_code());
					obj.put("sido_name", dto.getSido_name());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//sido
		else if(command.equals("gugun")) {
			String sido = request.getParameter("sido");
			PrintWriter out = response.getWriter();
			List<SidoCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectGugun(sido);
				for(SidoCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("gugun_code", dto.getGugun_code());
					obj.put("gugun_name", dto.getGugun_name());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//gugun
		else if(command.equals("dong")) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<HouseInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectDong(gugun);
				for(HouseInfoDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code", dto.getCode());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//dong
		else if(command.equals("apt")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<HouseInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectApt(dong);
				for(HouseInfoDto dto : list) {
					System.out.println(dto.getAptName());
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("dong", dto.getDong());
					obj.put("AptName", dto.getAptName());
					obj.put("code", dto.getCode());
					obj.put("jibun", dto.getJibun());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//pat
		else if(command.equals("isafe")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<CriminalDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCriminal(dong);
				for(CriminalDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("name", dto.getName());
					obj.put("address", dto.getAddress());
					obj.put("dong", dto.getDong());
					obj.put("criminal_record", dto.getCriminalRecord());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//isafe		
		else if(command.equals("unpleasant")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<UnpleasantFacilitiesDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectUnpleasantFacilities(dong);
				for(UnpleasantFacilitiesDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("name", dto.getName());
					obj.put("address", dto.getAddress());
					obj.put("dong", dto.getDong());
					obj.put("type", dto.getType());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//unpleasant
		else if(command.equals("cctv")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<CCTVDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCCTV(dong);
				for(CCTVDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("address", dto.getAddress());
					obj.put("count", dto.getCount());
					obj.put("type", dto.getType());
					obj.put("lat", dto.getLat());
					obj.put("lng", dto.getLng());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//cctv
	}//process

}
