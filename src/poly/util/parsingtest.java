package poly.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import poly.dto.PharmacyDTO;

public class parsingtest {

	private static String getTagValue(String tag, Element eElement) {

		System.out.println("태그가 있는 경우 칸을 만들어서 찍음" + eElement.getElementsByTagName(tag).item(0));

		if (eElement.getElementsByTagName(tag).item(0) == null) {
			return null;
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

	public static void main(String[] args) throws Exception {

		// 서비스 인증키
		String ServiceKey = "SDqhEe5XM4iZYWu7qGf%2Fd3%2FDpTK26gEyFyLrnPm3xXGNihZwHCVR4MQgbNWMbhPmoaVj2HG9KiwbnEzamDel4Q%3D%3D";

		// 페이지번호
		int pgNum = 2;

		// 한 페이지 결과 수
		int numOfRows = 1;
		String CityName = "서울특별시";
		
		

		// 구 명
		String ZoneName = "강남구";

		String testname = "누리";

		// 파싱할 url
		// String url =
		// "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=DG0ZAiIU3ZQZ1KkSWjhMg0ck6RRNdtebMBg4wbCLhzIDhje5yVSx%2BaoL00YTOZ6x1J37amFNFjee10hUA%2B8Z%2FQ%3D%3D&Q0=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&Q1=%EA%B0%95%EB%82%A8%EA%B5%AC&QN=%EB%88%84%EB%A6%AC&pageNo=2&numOfRows=1";
		 String url = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=DG0ZAiIU3ZQZ1KkSWjhMg0ck6RRNdtebMBg4wbCLhzIDhje5yVSx%2BaoL00YTOZ6x1J37amFNFjee10hUA%2B8Z%2FQ%3D%3D&Q0="+CityName+"&Q1="+ZoneName+"&QN="+testname+"&pageNo=2&numOfRows=1";
		//String url = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=DG0ZAiIU3ZQZ1KkSWjhMg0ck6RRNdtebMBg4wbCLhzIDhje5yVSx%2BaoL00YTOZ6x1J37amFNFjee10hUA%2B8Z%2FQ%3D%3D&Q0="+ "%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C&"+ "&Q1=%EA%B0%95%EB%82%A8%EA%B5%AC&QN=%EB%88%84%EB%A6%AC&pageNo=2&numOfRows=1";
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
				pDTO = null;

			}
		}
	}

}
