package com.sheep.jsp.question.model.vo;

import java.util.ArrayList;
import java.util.List;

public class UserQue {
	private List<Question> list;
	private static UserQue instance;

	
	public static UserQue getInstance(){
		if(instance == null){
			instance = new UserQue();
		}
		return instance;
		
	}
	public List<Question> getUserList() {
		list = new ArrayList<Question>();
		
		Question qs1 = new Question(14, 1, "내용", "보기", 1);
		
		list.add(qs1);
		
		return list;
	}

}
