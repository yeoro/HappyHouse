package com.ssafy.happyhouse.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.domain.CCTVDto;
import com.ssafy.happyhouse.domain.CriminalDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SidoCodeDto;
import com.ssafy.happyhouse.domain.UnpleasantFacilitiesDto;

@Mapper
public interface SelectBoxMapper {

	public ArrayList<SidoCodeDto> selectSido() ;
	public ArrayList<SidoCodeDto> selectGugun(String sido) ;
	public ArrayList<HouseInfoDto> selectDong(String gugun) ;
	public ArrayList<HouseInfoDto> selectApt(String dong) ;
	public ArrayList<CriminalDto> selectCriminal(String dong);
	public List<UnpleasantFacilitiesDto> selectUnpleasantFacilities(String dong);
	public List<CCTVDto> selectCCTV(String dong);

}
