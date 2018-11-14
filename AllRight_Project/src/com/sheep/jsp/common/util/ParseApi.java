package com.sheep.jsp.common.util;

import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;

public class ParseApi {

	private String getTagValue(String tag, Element eElement) {
		
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}
	
	private String getTagValues(String tag, Element eElement) {
		
		Node nValue = null;
		
		for(int i = 0; i < eElement.getElementsByTagName(tag).getLength(); i++){
			
			NodeList nlList = eElement.getElementsByTagName(tag).item(i).getChildNodes();
			nValue = (Node) nlList.item(i);
			if (nValue == null)
				return null;
		}
		
		return nValue.getNodeValue();
	}

	private NodeList common(String url) {

		NodeList nList = null;
		try {

			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag
			doc.getDocumentElement().normalize();

			// 파싱할 tag
			nList = doc.getElementsByTagName("item");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return nList;
	}
	
	public ArrayList<LicenseInfo> getApi(){
		
		ArrayList<LicenseInfo> list = new ArrayList<LicenseInfo>();

		// parsing할 url 지정(API 키 포함해서)
		String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?serviceKey=Oi%2FEbWNVg5PdT0l9KErR0viwEKN9SzcsbQaeVE%2BxvL3%2FYY0FT1vmy3qVxHNj1HPH4vO0x6LdFRETO8txrEDnxQ%3D%3D";

		NodeList nList = common(url);

		LicenseInfo l = null;

		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;

				l = new LicenseInfo(getTagValue("jmcd", eElement), getTagValue("jmfldnm", eElement), getTagValue("obligfldnm", eElement));

				list.add(l);
				

			} // for end
		} // if end

		return list;
		
	}
	
	public ArrayList<LicenseInfo> getCost(ArrayList<LicenseInfo> list){
		
		for(int i = 0; i < list.size(); i ++){
			
			System.out.println("응시료 업데이트 중"+"("+ (i+1) +"/597)");
			
			String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getFeeList?ServiceKey=Oi%2FEbWNVg5PdT0l9KErR0viwEKN9SzcsbQaeVE%2BxvL3%2FYY0FT1vmy3qVxHNj1HPH4vO0x6LdFRETO8txrEDnxQ%3D%3D&jmCd=";
			
			url += list.get(i).getlNo();
			
			NodeList nList = common(url);

			LicenseInfo l = null;

			for (int j = 0; j < nList.getLength(); j++) {
				
				Node nNode = nList.item(j);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;
					
					list.get(i).setlCost(getTagValue("contents", eElement));
					

				} // for end
			} // if end
			
		} // for end
		
		
		return list;
		
	}

}
