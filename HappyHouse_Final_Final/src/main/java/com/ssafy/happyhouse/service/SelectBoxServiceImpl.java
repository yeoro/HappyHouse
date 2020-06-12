package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.domain.CCTVDto;
import com.ssafy.happyhouse.domain.CriminalDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SidoCodeDto;
import com.ssafy.happyhouse.domain.UnpleasantFacilitiesDto;
import com.ssafy.happyhouse.mapper.SelectBoxMapper;

@Service
public class SelectBoxServiceImpl implements SelectBoxService {

	@Autowired
	private SelectBoxMapper mapper;

	@Override
	public ArrayList<SidoCodeDto> selectSido() {
		return mapper.selectSido();
	}

	@Override
	public ArrayList<SidoCodeDto> selectGugun(String sido) {
		return mapper.selectGugun(sido);
	}

	@Override
	public ArrayList<HouseInfoDto> selectDong(String gugun) {
		return mapper.selectDong(gugun);
	}

	@Override
	public ArrayList<HouseInfoDto> selectApt(String dong) {
		return mapper.selectApt(dong);
	}

	@Override
	public ArrayList<CriminalDto> selectCriminal(String dong) {
		return mapper.selectCriminal(dong);
	}

	@Override
	public List<UnpleasantFacilitiesDto> selectUnpleasantFacilities(String dong) {
		return mapper.selectUnpleasantFacilities(dong);
	}

	@Override
	public List<CCTVDto> selectCCTV(String dong) {
		return mapper.selectCCTV(dong);
	}
	


}
