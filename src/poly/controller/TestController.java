package poly.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;


import poly.dto.PharmacyDTO;
import poly.util.CmmUtil;
import poly.util.ParsingFunc;


@Controller
public class TestController {
	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * @RequestMapping(value = "/test") public String test(ModelMap model) throws
	 * Exception { List<PharmacyDTO> pList = new ArrayList(); pList =
	 * ParsingFunc.getPharmList(); model.addAttribute("pList",pList); return
	 * "/test"; }
	 */
	
	@RequestMapping(value = "test/test1")
	public String test1() {
		log.info("test1 start");
		
		return "/test/test1";
	}
	
	
	@RequestMapping(value = "test/test2")
	public String test2() {
		log.info("test2 start");
		
		return "/test2";
	}
	
	@RequestMapping(value = "test/test3")
	public String test3() {
		log.info("test2 start");
		
		return "/test/test3";
	}
	
	@RequestMapping(value = "test/testSmartEditer")
	public String smartediter() {
		log.info("smartediter start");
		
		
		
		
		log.info("smartediter end");
		
		return "/test/testSmartEditer";
	}
	
	
	
	
	
	@RequestMapping(value = "/testProc")
	public String testProc(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		log.info("testProc start");
		
		String inputParmacyName =CmmUtil.nvl(request.getParameter("inputParmacyName"));
		String sido = CmmUtil.nvl(request.getParameter("sido"));
		String gugun = CmmUtil.nvl(request.getParameter("gugun"));
		
		log.info("inputParmacyName:" + inputParmacyName);
		log.info("sido:" + sido);
		log.info("gugun:" + gugun);
		
		if(!inputParmacyName.equals("")) {
			PharmacyDTO bDTO = new PharmacyDTO();
			bDTO.setPharmacyName(inputParmacyName);
			bDTO.setSido(sido);
			bDTO.setGugun(gugun);
			
			
			List<PharmacyDTO> pList = new ArrayList<PharmacyDTO>();
			pList = ParsingFunc.getPharmList(bDTO);
			
			model.addAttribute("pList",pList);
			
			String sidogugun=ParsingFunc.getsidogugun(sido, gugun);
			log.info("sidogugun:"+sidogugun);
			model.addAttribute("sidogugun",sidogugun);
			
			
		}else {
			log.info("오류발생");
		}
		
		
		
		return "/test/test";
	}

}
