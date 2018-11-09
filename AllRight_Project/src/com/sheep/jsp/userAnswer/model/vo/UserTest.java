package com.sheep.jsp.userAnswer.model.vo;

import java.util.ArrayList;
import java.util.List;

public class UserTest {
	private List<Question> list;

	public List<Question> getQuestion() {
		list = new ArrayList<Question>();
		
		Question que1 = new Question(1, "문제", "보기", 4);
		
		list.add(que1);
		
		return list;
	}


}
