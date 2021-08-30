package com.ogong.service.integration.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogong.common.Search;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.LearningHistory;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;
import com.ogong.service.integration.IntegrationMapper;
import com.ogong.service.integration.IntegrationService;

@Service
public class IntegrationServiceImpl implements IntegrationService {
	
	@Autowired
	IntegrationMapper integrationMapper;
	
	//받은 쪽지 조회
	@Override
	public Map<String, Object> getlistReceiveMessage(HashMap<String, Object> map) throws Exception {
		
		List<Message> list = integrationMapper.getlistReceiveMessage(map);
		int totalCount = integrationMapper.getTotalCount(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}
	
	//보낸 쪽지 조회
	@Override
	public Map<String, Object> getlistSendMessage(HashMap<String, Object> map) throws Exception {
		List<Message> list = integrationMapper.getlistSendMessage(map);
		int totalCount = integrationMapper.getTotalCount2(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}
	
	//쪽지보관함 조회
	@Override
	public Map<String, Object> getlistKeepMessage(HashMap<String, Object> map) throws Exception {
		List<Message> list = integrationMapper.getlistKeepMessage(map);
		int totalCount = integrationMapper.getTotalCount3(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCount", new Integer(totalCount));
		
		return result;
	}	
	
	//쪽지 보내기 (1 = 쪽지목록에서 쪽지보내기)
	@Override
	public void addSendMessage(Message message) throws Exception {

		integrationMapper.addSendMessage(message);
	}
	
	//쪽지 보내기 (2 = 모든 목록에서 다른사람 닉네임을 통해 쪽지보내기)
	@Override
	public void addSendMessage2(Message message) throws Exception {

		integrationMapper.addSendMessage2(message);
	}
	
	//쪽지 삭제
	@Override
	public void deleteMessage(int messageNo) throws Exception {

		integrationMapper.deleteMessage(messageNo);
	}
	
	//쪽지 보관함 이동
	@Override
	public void updateKeepMessage(int messageNo) throws Exception{
		integrationMapper.updateKeepMessage(messageNo);
	}
	
	//받은 쪽지함 이동
	@Override
	public void updateReceiveMessage(int messageNo) throws Exception{
		integrationMapper.updateReceiveMessage(messageNo);
	}
	
	
	//알림
	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		integrationMapper.addNotice(notice);
	}
	
	//바나나 랭킹
	@Override
	public List<User> listBananaRanking(HashMap<String, Object> map) throws Exception {
		
		List<User> list = integrationMapper.listBananaRanking(map);
		

		return list;
	}
	
	//채택수 랭킹
	@Override
	public List<Answer> listChooseCountRanking(HashMap<String, Object> map) throws Exception {
		
		List<Answer> list = integrationMapper.listChooseCountRanking(map);
		
		return list;
	}
	
	//공부시간 랭킹
	@Override
	public List<LearningHistory> listLearningTimeRanking(HashMap<String, Object> map) throws Exception {

		List<LearningHistory> list = integrationMapper.listLearningTimeRanking(map);
		
		return list;
	}
	
	//알림 목록 조회
	@Override
	public List<Notice> getlistNotice(String email) throws Exception {

		return integrationMapper.getlistNotice(email);
	}
	
	//알림 조회
	@Override
	public Notice getNotice(int noticeNo) throws Exception{
		
		return integrationMapper.getNotice(noticeNo);
	}
	
	//알림 삭제
	@Override
	public void deleteNotice(int noticeNo) throws Exception {

		integrationMapper.deleteNotice(noticeNo);
	}
	
	//알림 전체 삭제
	@Override
	public void deleteAllNotice(String email) throws Exception {

		integrationMapper.deleteAllNotice(email);
	}
	
	//알림 카운트 수
	@Override
	public int getNoticeCount(String email) {
		
		return integrationMapper.getNoticeCount(email);
	}
	
	//알림 읽음 표시
	@Override
	public void updateNotice(String email) throws Exception{
		
		integrationMapper.updateNotice(email);
	}
	
	//
	@Override
	public void deleteChoiceMessage(Message message) throws Exception{
		integrationMapper.deleteChoiceMessage(message);
	}

	@Override
	public void setTargetTime(User user) throws Exception {
		integrationMapper.setTargetTime(user);
	}

}
