package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserInfoDTO;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;
import poly.util.EncryptUtill;

@Controller
public class UserInfoController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserInfoService")
	private IUserInfoService userInfoService;
	
	@RequestMapping(value="user/userRegForm")
	public String userRegForm() {
		log.info(this.getClass()+".user/userRegForm oK!");
		
		return "/user/UserRegForm";
	}
	
	@RequestMapping(value="user/insertUserInfo")
	public String insertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model)throws Exception {
		log.info(this.getClass().getName()+".insertUserInfo start");
		
		String msg="";
		UserInfoDTO pDTO =null;
	
	try {
		 String user_id = CmmUtil.nvl(request.getParameter("user_id"));
		 String user_name= CmmUtil.nvl(request.getParameter("user_name"));
		 String password= CmmUtil.nvl(request.getParameter("password"));
		 String email = CmmUtil.nvl(request.getParameter("email"));
		 String addr1 = CmmUtil.nvl(request.getParameter("addr1"));
		 String addr2= CmmUtil.nvl(request.getParameter("addr2"));
		
		 log.info("user_id:"+user_id);
		 log.info("user_name:"+user_name);
		 log.info("password:"+password);
		 log.info("email:"+email);
		 log.info("addr1:"+addr1);
		 log.info("addr2:"+addr2);
		
		 pDTO = new UserInfoDTO();
		 pDTO.setUser_id(user_id);
		 pDTO.setUser_name(user_name);
		 
		 pDTO.setPassword(EncryptUtill.encHashSHA256(password));
		 
		 pDTO.setEmail(EncryptUtill.encAES128CBC(email));
		 pDTO.setAddr1(addr1);
		 pDTO.setAddr2(addr2);
		 log.info("pDTO 데이터 등록");
		 
		 int res = userInfoService.InserUserInfo(pDTO);
		 
		 if(res==1) {
			 msg = "회원가입되었습니다";
		 }
		 else if(res==2) {
			 msg = "이미 가입된 이메일 주소입니다.";
		 }
		 else {
			 msg="오류로 인해 회원가입이 실패하였습니다.";
		 }
		 
		 
	}catch(Exception e){
		msg = "실패하였습니다. :"+ e.toString();
		log.info(e.toString());
		e.printStackTrace();
	}
	
	finally {
		log.info(this.getClass().getName()+"insertUserInfo end!");
		
		model.addAttribute("msg",msg);
		model.addAttribute("pDTO",pDTO);
		
		pDTO = null;
		
	}
		return "/user/Msg";
	}
	
	
	
}
