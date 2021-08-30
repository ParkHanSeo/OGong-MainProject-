package com.ogong.service.banana;

import java.util.HashMap;
import java.util.Map;

import com.ogong.common.Search;
import com.ogong.service.domain.Banana;
import com.ogong.service.domain.User;

public interface BananaService {

	// 바나나 지급
	public void addBanana(Banana banana) throws Exception;
	
	// 획득,소모처 목록
	public Map<String, Object> getlistBanana(HashMap<String, Object> map) throws Exception;
	
	// 바나나 + 획득
	public void updateAcquireBanana(User user) throws Exception;	
	
	// 바나나 - 사용
	public void updateUseBanana(User user) throws Exception;
	
	// 바나나 목록 삭제
	public void deleteBanana(int bananaNo) throws Exception;
	
	// 유저 정보
	public User adminGetUser(String email) throws Exception;
}