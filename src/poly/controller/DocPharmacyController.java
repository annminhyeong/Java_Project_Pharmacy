package poly.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.PharmacyDTO;
import poly.util.CmmUtil;
import poly.util.ParsingFunc;

@Controller
public class DocPharmacyController {
	
	private Logger log = Logger.getLogger(this.getClass());

	
	
	@RequestMapping(value="project/map/pharmacy")
	public String pharmacy() throws Exception{
		log.info("약국 검색 확인");
		return "/project/map/pharmacy";
	}
	
	
	@RequestMapping(value="pharmacyProc")
	public String pharmacyProc(ServletRequest request, Model model) throws Exception{
		log.info("약국 검색 기능");
		
		String inputParmacyName =CmmUtil.nvl(request.getParameter("inputParmacyName"));
		String sido = CmmUtil.nvl(request.getParameter("sido"));
		String gugun = CmmUtil.nvl(request.getParameter("gugun"));
		
		log.info("inputParmacyName:" +inputParmacyName );
		log.info("sido:" +sido );
		log.info("gugun:" +gugun );
		
		if(!inputParmacyName.equals("")) {
		}else {
			log.info("오류발생");
		}
		
		PharmacyDTO bDTO = new PharmacyDTO();
		bDTO.setPharmacyName(inputParmacyName);
		bDTO.setSido(sido);
		bDTO.setGugun(gugun);
		
		List<PharmacyDTO> pList = new ArrayList<PharmacyDTO>();
		pList = ParsingFunc.getPharmList(bDTO);
		if(pList==null) {
			pList = new ArrayList<PharmacyDTO>();
		}else {
			log.info("리스트 갯수"+pList.size());
			for(int i = 0;i<pList.size();) {
				if(pList.get(i).getLatitude().equals("휴일")) {
					pList.remove(i);
				}else {
					i++;
				}
			}
		}
		
		
		
		model.addAttribute("pList",pList);
		
		String sidogugun=ParsingFunc.getsidogugun(sido, gugun);
		log.info("sidogugun:"+sidogugun);
		model.addAttribute("sidogugun",sidogugun);
		
		return "/project/map/pharmacyResult";
	}
	
	
	@RequestMapping(value="project/map/pharmacyResult")
	public String pharmacyResult() throws Exception{
		log.info("약국 검색 결과");
		return "/project/map/pharmacyResult";
	}
}
