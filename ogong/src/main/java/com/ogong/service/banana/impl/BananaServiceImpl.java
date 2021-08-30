package com.ogong.service.banana.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.banana.BananaMapper;
import com.ogong.service.banana.BananaService;
import com.ogong.service.domain.Banana;
import com.ogong.service.domain.Report;
import com.ogong.service.domain.User;

@Service
public class BananaServiceImpl implements BananaService{
	
	@Autowired
	BananaMapper bananaMapper;

	//바나나 지급
	@Override
	public void addBanana(Banana banana) throws Exception {

		bananaMapper.addBanana(banana);
		
	}

	//획득, 소모 바나나 목록
	@Override
	public Map<String, Object> getlistBanana(HashMap<String, Object> map) throws Exception {

		List<Banana> list= bananaMapper.getlistBanana(map);
		int totalCount = bananaMapper.getbananaCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
		
	}
	
	//바나나 + 획득
	@Override
	public void updateUseBanana(User user) throws Exception {

		bananaMapper.updateUseBanana(user);
		
	}
	
	//바나나 - 사용
	@Override
	public void updateAcquireBanana(User user) throws Exception {

		bananaMapper.updateAcquireBanana(user);
		
	}
	
	//바나나 목록 삭제
	@Override
	public void deleteBanana(int bananaNo) throws Exception{
		
		bananaMapper.deleteBanana(bananaNo);
	}
	
	//회원 정보 조회
	@Override
	public User adminGetUser(String email) throws Exception {
		return bananaMapper.adminGetUser(email);
	}
	
	
}