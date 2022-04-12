package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.dto.UserInfoDTO;
import poly.persistance.mapper.UserInfoMapper;
import poly.service.IMailService;
import poly.service.IUserInfoService;
import poly.util.CmmUtil;
import poly.util.EncryptUtill;;


@Service("UserInfoService")
public class UserinfoService implements IUserInfoService {

	@Resource(name="UserInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@Resource(name="MailService")
	private IMailService mailService;
	
	@Override
	public int InserUserInfo(UserInfoDTO pDTO)throws Exception {
			
		int res =0;
		
		if(pDTO == null) {
			pDTO = new UserInfoDTO();
		}
		
		
		UserInfoDTO rDTO = userInfoMapper.getUserExists(pDTO);
		
		if(rDTO == null) {
			rDTO = new UserInfoDTO();
		}
		
		if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res= 2;
			
		}else {
			int success = userInfoMapper.insertUserInfo(pDTO);
			
			if(success >0) {
				res=1;
				/*
				 * ##########################################
				 *	              메일 발송 로직 추가!!
				 * ##########################################
				 */
				
				 MailDTO mDTO = new MailDTO();
				  
				 mDTO.setToMail(EncryptUtill.decAES128CBC(CmmUtil.nvl(pDTO.getEmail())));
				  
				 mDTO.setTitle("회원가입을 축하드립니다.");
				 
				 mDTO.setContents(CmmUtil.nvl(pDTO.getUser_name()+"님의 회원가입을 진심으로 축하드립니다"));
				 
				 mailService.doSendMail(mDTO);	
			
			}else {
				res=0;
			}
		}
		return res;
	}

}
