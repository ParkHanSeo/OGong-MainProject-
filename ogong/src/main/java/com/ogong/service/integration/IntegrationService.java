package com.ogong.service.integration;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ogong.common.Search;
import com.ogong.service.domain.Answer;
import com.ogong.service.domain.LearningHistory;
import com.ogong.service.domain.Message;
import com.ogong.service.domain.Notice;
import com.ogong.service.domain.User;

public interface IntegrationService {

	//받은 쪽지 조회
	public Map<String, Object> getlistReceiveMessage(HashMap<String, Object> map) throws Exception;
	
	//보낸 쪽지 조회
	public Map<String, Object> getlistSendMessage(HashMap<String, Object> map) throws Exception;
	
	//쪽지 보관함 조회
	public Map<String, Object> getlistKeepMessage(HashMap<String, Object> map) throws Exception;
	
	//쪽지 보내기 (1 = 쪽지목록에서 쪽지보내기)
	public void addSendMessage(Message message) throws Exception;
	
	//쪽지 보내기 (2 = 모든 목록에서 다른사람 닉네임을 통해 쪽지보내기)
	public void addSendMessage2(Message message) throws Exception;
	
	//쪽지 삭제
	public void deleteMessage(int messageNo) throws Exception;
	
	//쪽지 선택 삭제
	public void deleteChoiceMessage(Message message) throws Exception;
	
	//쪽지 보관함 이동
	public void updateKeepMessage(int messageNo) throws Exception;
	
	//받은 쪽지함 이동
	public void updateReceiveMessage(int messageNo) throws Exception;
	
	//알림
	public void addNotice(Notice notice) throws Exception;
	
	//바나나 랭킹
	public List<User> listBananaRanking(HashMap<String, Object> map) throws Exception;
	
	//채택수 랭킹
	public List<Answer> listChooseCountRanking(HashMap<String, Object> map) throws Exception;
	
	//공부시간 랭킹
	public List<LearningHistory> listLearningTimeRanking(HashMap<String, Object> map) throws Exception;
	
	//알림 조회
	public Notice getNotice(int noticeNo) throws Exception;
	
	//알림 목록 조회
	public List<Notice> getlistNotice(String email) throws Exception;
	
	//알림 선택 삭제
	public void deleteNotice(int noticeNo) throws Exception;
	
	//알림 전체 삭제
	public void deleteAllNotice(String email) throws Exception;
	
	//알림 읽음 표시
	public void updateNotice(String email) throws Exception;
	
	//알림 카운트 수
	int getNoticeCount (String email) throws Exception;
	
	//목표시간 설정
	void setTargetTime(User user) throws Exception;
	
	
	
	
}
