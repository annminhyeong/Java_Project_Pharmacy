package poly.util;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import poly.dto.PharmacyDTO;

public class ParsingFunc {

	private static String getTagValue(String tag, Element eElement) {

		System.out.println("태그가 있는 경우 칸을 만들어서 찍음" + eElement.getElementsByTagName(tag).item(0));

		if (eElement.getElementsByTagName(tag).item(0) == null) {
			return "휴일";
		}
		// 테그가 있는지 없는지 확인해서 있는경우 nlList에 넣는다
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		// nlList의 값을 nValue에 넣는다
		Node nValue = (Node) nlList.item(0);

		if (nValue == null) {
			return null;
		} else if (eElement == null) {
			System.out.println("널이다");
		} else if (eElement != null) {
			System.out.println("널이 아니다");
		}

		// nValue에 들어있는 값을 반환
		return nValue.getNodeValue();

	}
	
	public static String getsidogugun(String sido,String gugun) {
		String sidogugun = sido +" "+ gugun;
		
		return sidogugun;
	}

	public static List<PharmacyDTO> getPharmList(PharmacyDTO bDTO) throws Exception {
		//
		String inputParmacyName = bDTO.getPharmacyName();
		String sido = bDTO.getSido();
		String gugun = bDTO.getGugun();
		
		System.out.println(inputParmacyName);

		// 서비스 인증키
		String ServiceKey = "DG0ZAiIU3ZQZ1KkSWjhMg0ck6RRNdtebMBg4wbCLhzIDhje5yVSx%2BaoL00YTOZ6x1J37amFNFjee10hUA%2B8Z%2FQ%3D%3D";

		// 페이지번호
		String pgNum = "1";
		// 한 페이지 결과 수
		String numOfRows = "10000";

		inputParmacyName = URLEncoder.encode(inputParmacyName, "UTF-8");
		sido = URLEncoder.encode(sido, "UTF-8");
		gugun = URLEncoder.encode(gugun, "UTF-8");
		


		// 파싱할 url
		String url = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey="+ ServiceKey + "&Q0=" + sido + "&Q1=" + gugun + "&QN=" + inputParmacyName + "&pageNo=" + pgNum+ "&numOfRows=" + numOfRows;
		

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

			if (nNode.getNodeType() == Node.ELEMENT_NODE) {
				Element eElement = (Element) nNode;

				System.out.println("###################################################################");
				System.out.println("주소:" + getTagValue("dutyAddr", eElement));
				System.out.println("약국명:" + getTagValue("dutyName", eElement));
				System.out.println("전화번호:" + getTagValue("dutyTel1", eElement));

				System.out.println("위도:" + getTagValue("wgs84Lat", eElement));
				System.out.println("경도:" + getTagValue("wgs84Lon", eElement));

				System.out.println("월 아침 진료시간:" + getTagValue("dutyTime1s", eElement));
				System.out.println("월 저녁 진료시간:" + getTagValue("dutyTime1c", eElement));

				System.out.println("화 아침 진료시간:" + getTagValue("dutyTime2s", eElement));
				System.out.println("화 저녁 진료시간:" + getTagValue("dutyTime2c", eElement));

				System.out.println("수 아침 진료시간:" + getTagValue("dutyTime3s", eElement));
				System.out.println("수 저녁 진료시간:" + getTagValue("dutyTime3c", eElement));

				System.out.println("목 아침 진료시간:" + getTagValue("dutyTime4s", eElement));
				System.out.println("목 저녁 진료시간:" + getTagValue("dutyTime4c", eElement));

				System.out.println("금 아침 진료시간:" + getTagValue("dutyTime5s", eElement));
				System.out.println("금 저녁 진료시간:" + getTagValue("dutyTime5c", eElement));

				System.out.println("토 아침 진료시간:" + getTagValue("dutyTime6s", eElement));
				System.out.println("토 저녁 진료시간:" + getTagValue("dutyTime6c", eElement));

				System.out.println("일 아침 진료시간:" + getTagValue("dutyTime7s", eElement));
				System.out.println("일 저녁 진료시간:" + getTagValue("dutyTime7c", eElement));

				// 변수에 값저장
				String addr = CmmUtil.nvl(getTagValue("dutyAddr", eElement));
				String pharmacyName = CmmUtil.nvl(getTagValue("dutyName", eElement));
				String mainPhone = CmmUtil.nvl(getTagValue("dutyTel1", eElement));

				String latitude = CmmUtil.nvl(getTagValue("wgs84Lat", eElement));
				String longitude = CmmUtil.nvl(getTagValue("wgs84Lon", eElement));

				String monStart = CmmUtil.nvl(getTagValue("dutyTime1s", eElement));
				String monEnd = CmmUtil.nvl(getTagValue("dutyTime1c", eElement));

				String tueStart = CmmUtil.nvl(getTagValue("dutyTime2s", eElement));
				String tueEnd = CmmUtil.nvl(getTagValue("dutyTime2c", eElement));

				String wedStart = CmmUtil.nvl(getTagValue("dutyTime3s", eElement));
				String wedEnd = CmmUtil.nvl(getTagValue("dutyTime3c", eElement));

				String thuStart = CmmUtil.nvl(getTagValue("dutyTime4s", eElement));
				String thuEnd = CmmUtil.nvl(getTagValue("dutyTime4c", eElement));

				String friStart = CmmUtil.nvl(getTagValue("dutyTime5s", eElement));
				String friEnd = CmmUtil.nvl(getTagValue("dutyTime5c", eElement));

				String satStart = CmmUtil.nvl(getTagValue("dutyTime7s", eElement));
				String satEnd = CmmUtil.nvl(getTagValue("dutyTime7c", eElement));

				String sunStart = CmmUtil.nvl(getTagValue("dutyTime7s", eElement));
				String sunEnd = CmmUtil.nvl(getTagValue("dutyTime7c", eElement));
				// 변수에 값저장 끝

				PharmacyDTO pDTO = new PharmacyDTO();

				// DTO에 값넣기
				pDTO.setAddr(addr);
				pDTO.setPharmacyName(pharmacyName);
				pDTO.setMainPhone(mainPhone);

				pDTO.setLatitude(latitude);
				pDTO.setLongitude(longitude);

				pDTO.setMonStart(monStart);
				pDTO.setMonEnd(monEnd);

				pDTO.setTueStart(tueStart);
				pDTO.setTueEnd(tueEnd);

				pDTO.setWedStart(wedStart);
				pDTO.setWedEnd(wedEnd);

				pDTO.setThuStart(thuStart);
				pDTO.setThuEnd(thuEnd);

				pDTO.setFriStart(friStart);
				pDTO.setFriEnd(friEnd);

				pDTO.setSatStart(satStart);
				pDTO.setSatEnd(satEnd);

				pDTO.setSunStart(sunStart);
				pDTO.setSunEnd(sunEnd);
				// DTO값넣기 끝

				plist.add(pDTO);

			}
		}
		for(int i = 0;i<plist.size();i++) {
			plist.get(i).getPharmacyName();
		}
		return plist;
	}
	
	

}
