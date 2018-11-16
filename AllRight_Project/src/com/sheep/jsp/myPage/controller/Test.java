package com.sheep.jsp.myPage.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;

@WebServlet("/sTest1.sc")
public class Test {/*
	@RequestMapping(value = "allRight/sTest.sc")
	public String taskCalendar(HttpServletRequest request, ProjectVO projectVO, ModelMap modelMap) {
        // 페이지 공통: alert
        String userno = request.getSession().getAttribute("userno").toString();
        
        Integer alertcount = etcSvc.selectAlertCount(userno);
        modelMap.addAttribute("alertcount", alertcount);
        
        ProjectVO projectInfo = projectSvc.selectProjectOne(projectVO);

        List<?> listview  = taskSvc.selectTaskList(projectVO.getPrno());
        
        modelMap.addAttribute("projectInfo", projectInfo);
        modelMap.addAttribute("listview", listview);
        
        return "project/taskCalendar";
    }   
*/



}
