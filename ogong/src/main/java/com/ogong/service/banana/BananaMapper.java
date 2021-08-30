package com.ogong.service.banana;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.common.Search;
import com.ogong.service.domain.Banana;
import com.ogong.service.domain.User;

@Repository
@Mapper
public interface BananaMapper {

	//바나나 지급
	public int addBanana(Banana banana);
	
	//획득,소모 바나나 목록
	List<Banana> getlistBanana(HashMap<String, Object> map);
	
	//바나나 + 획득
	void updateAcquireBanana(User user);
	
	//바나나 - 사용
	void updateUseBanana(User user);
	
	//바나나 목록 삭제
	public void deleteBanana(int bananaNo);
	
	//바나나 페이지 카운트	
	public int getbananaCount(HashMap<String, Object> map);
	
	//유저 정보
	public User adminGetUser(String email) throws Exception;
	

}