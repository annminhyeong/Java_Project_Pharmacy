package poly.util;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import poly.dto.PharmacyDTO;

public class parsing {

	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	public static List<PharmacyDTO> getPharmList() throws Exception {

		// 서비스 인증키
		String ServiceKey = "SDqhEe5XM4iZYWu7qGf%2Fd3%2FDpTK26gEyFyLrnPm3xXGNihZwHCVR4MQgbNWMbhPmoaVj2HG9KiwbnEzamDel4Q%3D%3D";

		// 페이지번호
		int pgNum = 1;

		// 한 페이지 결과 수
		int numOfRows = 5;

		// 파싱할 url
		String url = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown?serviceKey="
				+ ServiceKey + "&pageNo=" + pgNum + "&numOfRows=" + numOfRows;

		// DocumentBuilderFactory(Dom파서)를 생성시키는 클래스 => 파싱할때 선언 해야하는 건가?
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();

		// DocumentBuilder :Dom 파서 객체의 클래스
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();

		// Document 객체는 HTML 요소와 관련된 작업된 작업을 해줌 => 해당 url로 파싱하는듯
		Document doc = dBuilder.parse(url);

		// 정규화 함
		doc.getDocumentElement().normalize();
		System.out.println("Root element:" + doc.getDocumentElement().getNodeName());

		// <item></item>을 기준으로 잘라서 집어넣음
		NodeList nList = doc.getElementsByTagName("item");
		System.out.println("파싱할 리스트수 :" + nList.getLength());

		// 파싱한 값을 PharmacyDTO 형태의 리스트로 들고옴
		List<PharmacyDTO> plist = new ArrayList<PharmacyDTO>();
		

		for (int temp = 0; temp < nList.getLength(); temp++) {

			Node nNode = (Node) nList.item(temp);
			Element eElement = (Element) nNode;
			
			  System.out.println("#####################################");
			  System.out.println("약국명:"+ getTagValue("dutyName",eElement));
			  System.out.println("주소:"+ getTagValue("dutyAddr",eElement));
			  
			  System.out.println("위도:"+ getTagValue("wgs84Lat",eElement));
			  System.out.println("경도:"+ getTagValue("wgs84Lon",eElement));
			  
			  System.out.println("월 아침 진료시간:"+ getTagValue("dutyTime1s",eElement));
			  System.out.println("월 저녁 진료시간:"+ getTagValue("dutyTime1c",eElement));
			  
			  System.out.println("화 아침 진료시간:"+ getTagValue("dutyTime2s",eElement));
			  System.out.println("화 저녁 진료시간:"+ getTagValue("dutyTime2c",eElement));
			  
			  System.out.println("수 아침 진료시간:"+ getTagValue("dutyTime3s",eElement));
			  System.out.println("수 저녁 진료시간:"+ getTagValue("dutyTime3c",eElement));
			  
			  System.out.println("목 아침 진료시간:"+ getTagValue("dutyTime4s",eElement));
			  System.out.println("목 저녁 진료시간:"+ getTagValue("dutyTime4c",eElement));
			  
			  System.out.println("금 아침 진료시간:"+ getTagValue("dutyTime5s",eElement));
			  System.out.println("금 저녁 진료시간:"+ getTagValue("dutyTime5c",eElement));
			 

			String pharmacy_name = getTagValue("dutyName", eElement);
			String addr = getTagValue("dutyAddr", eElement);

			String latitude = getTagValue("wgs84Lat", eElement);
			String longitude = getTagValue("wgs84Lon", eElement);

			String MonStart = getTagValue("dutyTime1s", eElement);
			String MonEnd = getTagValue("dutyTime1c", eElement);

			String tueStart = getTagValue("dutyTime2s", eElement);
			String tueEnd = getTagValue("dutyTime2c", eElement);

			String wedStart = getTagValue("dutyTime3s", eElement);
			String wedEnd = getTagValue("dutyTime3c", eElement);

			String thuStart = getTagValue("dutyTime4s", eElement);
			String thuEnd = getTagValue("dutyTime4c", eElement);

			String friStart = getTagValue("dutyTime5s", eElement);
			String friEnd = getTagValue("dutyTime5c", eElement);
			
			PharmacyDTO pDTO = new PharmacyDTO();
			
			pDTO.setPharmacyName(pharmacy_name);
			
			plist.add(pDTO);
			pDTO=null;

		}
		
		return plist;
	}
}
