package com.ogong.service.studyroom;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ogong.service.domain.Calendar;
import com.ogong.service.domain.GroupStudyMember;
import com.ogong.service.domain.Study;

@Repository
@Mapper
public interface StudyroomMapper {
	
	List<GroupStudyMember> getParticipationList(int studyNo);
	
	int getTotalCount(int studyNo);
	
	void applyParticipation(String email);
	
	void rejectParticipation(int gsmNo);
	
	List<GroupStudyMember> getGSMemberList(int studyNo);
	
	void updateStudy(Study study);
	
	void addAttendance(Map<String, Object> map);
	
	void addCalendar(Calendar calendar);
	
	Calendar getCalendar(int calendarNo);
	
	List<Calendar> getCalendarList(int studyNo);
	
	void updateCalendar(Calendar calendar);
	
	void deleteCalendar(int calendarNo);
}