package poly.persistance.mapper;

import config.Mapper;
import poly.dto.DocUserDTO;
import poly.dto.UserInfoDTO;

@Mapper("UserInfoMapper")
public interface UserInfoMapper {

	int insertUserInfo(UserInfoDTO pDTO) throws Exception;
	
	UserInfoDTO getUserExists(UserInfoDTO pDTO) throws Exception;

	
}
