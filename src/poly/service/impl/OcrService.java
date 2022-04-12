package poly.service.impl;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import poly.dto.OcrDTO;
import poly.persistance.mapper.IOcrMapper;
import poly.service.IOcrService;
import poly.util.CmmUtil;


@Service("OcrService")
public class OcrService implements IOcrService {
	
	@Resource(name="OcrMapper")
	private IOcrMapper ocrmapper;
	
	
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Override
	public OcrDTO getReadforImageText(OcrDTO pDTO) throws Exception {
		
		log.info(this.getClass().getName()+".getReadforImageText start");
		
		File imageFile = new File(CmmUtil.nvl(pDTO.getFilePath())+"//"+ CmmUtil.nvl(pDTO.getFileName()));
		
		ITesseract instance = new Tesseract();
		
		instance.setDatapath("C:\\tess-data");
		
		//instance.setLanguage("kor");
		instance.setLanguage("eng");
		
		String result = instance.doOCR(imageFile);
		
		pDTO.setTextFromImage(result);
		
		log.info("result :"+ result);
		log.info(this.getClass().getName()+".getReadforImageText end");
		
		return pDTO;
	}


	@Override
	public int getOcrData(OcrDTO pDTO) throws Exception {
		
		return ocrmapper.getOcrData(pDTO);
	}

}
