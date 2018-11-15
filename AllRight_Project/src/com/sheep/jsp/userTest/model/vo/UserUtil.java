package com.sheep.jsp.userTest.model.vo;

import java.util.ArrayList;
import java.util.List;

public class UserUtil {
	private List<UserTest> list;
	private static UserUtil instance;
	
	public static UserUtil getInstance(){
		if(instance == null){
			instance = new UserUtil();
		}
		return instance;
	}
	
	public List<UserTest> getUserList(){
		list = new ArrayList<UserTest>();
		
		UserTest test1 = new UserTest(1, 1);
		
		list.add(test1);
		
		return list;
	}
		

}
