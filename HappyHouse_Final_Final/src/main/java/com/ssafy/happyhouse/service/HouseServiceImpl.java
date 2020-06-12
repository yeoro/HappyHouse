package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.domain.HouseDealDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.mapper.HouseMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private HouseMapper mapper;
	
	@Override
	public List<HouseDealDto> retrieveHouse(SearchDto param) {
		return mapper.selectHouse(param);
	}
	
	@Override
	public List<HouseDealDto> retrieveHouseByDong(SearchDto param) {
		return mapper.selectHouseByDong(param);
	}
	
	@Override
	public List<HouseDealDto> retrieveHouseByName(SearchDto param) {
		return mapper.selectHouseByName(param);
	}
	
	@Override
	public HouseDealDto detailHouseByNo(int no) {
		return mapper.selectHouseByNo(no);
	}
	
	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String sWord, String sType) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = 0;
		if(sType.equals("all")) {
			totalCount = mapper.getTotalCount(); // 총 게시글 갯수;
		} else {
			SearchDto param = new SearchDto();
			param.setSearchType(sType);
			param.setSearchWord(sWord);
			totalCount = mapper.getSelectCount(param);
		}
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1; // 총 페이지 갯수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize; // startRange true : 이전X false : 이전O
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; // endRange true : 다음X false : 다음O
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	
	@Override
	public HouseInfoDto detailHouseinfoByNo(int no) {
//		return houseDao.selectHouseByName(aptName);
		return mapper.selectHouseinfoByNo(no);
	}
}


