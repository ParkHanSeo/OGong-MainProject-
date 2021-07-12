package com.ogong.service.domain;

import java.util.Date;

import lombok.Data;

@Data
public class LearningHistory {

	private int learningHistoryNo;
	private User user;
	private String learningTime;
	private String learningType;
	private Date learningDate;
	
}
