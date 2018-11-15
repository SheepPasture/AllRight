package com.sheep.jsp.common.util;

import java.util.ArrayList;
import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.sheep.jsp.licenseinfo.model.vo.LicenseInfo;

public class ParseApi {

	private String getTagValue(String tag, Element eElement) {

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	private ArrayList<String> getTagValues(String tag, Element eElement) {

		ArrayList<String> result = new ArrayList<String>();

		for (int i = 0; i < eElement.getElementsByTagName(tag).getLength(); i++) {

			NodeList nlList = eElement.getElementsByTagName(tag).item(i).getChildNodes();
			result.add(nlList.item(i).toString());

		}

		return result;

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

	private NodeList commons(String urlstr) {

		NodeList nList = null;
		BufferedReader br = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		try {

			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();

			// 응답 읽기
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line.trim();// result = URL로 XML을 읽은 값
			}

			// xml 파싱하기
			InputSource is = new InputSource(new StringReader(result));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			// XPathExpression expr =
			// xpath.compile("/response/body/items/item");
			XPathExpression expr = xpath.compile("//contents");
			nList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		for(int i = 0; i < nList.getLength(); i++){
//			System.out.println(nList.item(i).getTextContent());
//		}  잘 출력되는것 확인
		

		return nList;
	}

	public ArrayList<LicenseInfo> getApi() {

		ArrayList<LicenseInfo> list = new ArrayList<LicenseInfo>();

		// parsing할 url 지정(API 키 포함해서)
		String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?serviceKey=Oi%2FEbWNVg5PdT0l9KErR0viwEKN9SzcsbQaeVE%2BxvL3%2FYY0FT1vmy3qVxHNj1HPH4vO0x6LdFRETO8txrEDnxQ%3D%3D";

		NodeList nList = common(url);

		LicenseInfo l = null;

		for (int i = 0; i < nList.getLength(); i++) {
			Node nNode = nList.item(i);
			if (nNode.getNodeType() == Node.ELEMENT_NODE) {

				Element eElement = (Element) nNode;

				l = new LicenseInfo(getTagValue("jmcd", eElement), getTagValue("jmfldnm", eElement),
						getTagValue("obligfldnm", eElement));

				list.add(l);

			} // for end
		} // if end

		return list;

	}

	public ArrayList<LicenseInfo> getCost(ArrayList<LicenseInfo> list) {

		for (int i = 0; i < list.size(); i++) {

			System.out.println("응시료 업데이트 중" + "(" + (i + 1) + "/" + list.size() + ")");

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

	public ArrayList<LicenseInfo> getInfoList(ArrayList<LicenseInfo> list) {

		int size = list.size();
		int i = 0;

		ArrayList<LicenseInfo> resultList = new ArrayList<LicenseInfo>();

		// licenseInfo : info 업데이트전 자격증 정보 한건
		for (LicenseInfo licenseInfo : list) {
			System.out.println("자격증 정보 업데이트 중" + "(" + (i + 1) + "/" + size + ")");

			String urlstr = "http://openapi.q-net.or.kr/api/service/rest/InquiryInformationTradeNTQSVC/getList?ServiceKey=Oi%2FEbWNVg5PdT0l9KErR0viwEKN9SzcsbQaeVE%2BxvL3%2FYY0FT1vmy3qVxHNj1HPH4vO0x6LdFRETO8txrEDnxQ%3D%3D&jmCd=";

			urlstr += licenseInfo.getlNo();

			NodeList nodeList = commons(urlstr);

			List<String> infoList = licenseInfo.getlInfo();

			for (int j = 0; j < nodeList.getLength(); j++) {

				NodeList child = nodeList.item(j).getChildNodes();

				for (int k = 0; k < child.getLength(); k++) {

					// 자격증에 info 데이터 setting
					infoList.set(j, child.item(k).getTextContent());
					//System.out.println("====child.item(k)====\n"+child.item(k).getTextContent()); 
					// 자격증 정보 다 담음.
				}
			}

			licenseInfo.setlInfo(infoList);
			
			/*for(i = 0; i < licenseInfo.getlInfo().size(); i++){
				System.out.println("====licenseInfo.getlInfo().get()====\n"+licenseInfo.getlInfo().get(0));
				System.out.println(licenseInfo.getlInfo().get(1));
				System.out.println(licenseInfo.getlInfo().get(2));
			} licenseInfo.getlInfo().get(0); 에만 자격증 정보가 담김. */
			
			i++;

			resultList.add(licenseInfo);

		}
		
		/*for(i = 0; i < resultList.size(); i++){
			System.out.println("====resultList.get(i).getlInfo().get()====\n"+resultList.get(i).getlInfo().get(0));
			System.out.println(resultList.get(i).getlInfo().get(1));
			System.out.println(resultList.get(i).getlInfo().get(2));
		} resultList.get(i).getlInfo().get(0)); 에만 자격증 정보가 담김. */

		return resultList;
	}

}
