package poly.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.OcrDTO;
import poly.service.IOcrService;
import poly.util.CmmUtil;
import poly.util.DateUtill;
import poly.util.FileUtill;

@Controller
public class OcrController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "OcrService")
	private IOcrService ocrService;

	final private String FILE_UPLOAD_SAVE_PATH = "c:/upload";

	@RequestMapping(value = "ocr/imageFileUpload")
	public String index() {
		log.info(this.getClass().getName() + ".imageFileUpload");

		return "/ocr/imageFileUpload";
	}

	@RequestMapping(value = "ocr/getReadforImageText")
	public String getReadforImageText(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam(value = "fileUpload") MultipartFile mf) throws Exception {
		log.info(this.getClass().getName() + ".getReadforImageText start");

		String res = "";

		String originalFileName = mf.getOriginalFilename();

		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1, originalFileName.length())
				.toLowerCase();

		if (ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
			
			
			
			
			
			String saveFileName = DateUtill.getDateTime("24hhmmss") + "." + ext;

			String saveFilePath = FileUtill.mkdirForData(FILE_UPLOAD_SAVE_PATH);

			String fullFileInfo = saveFilePath + "/" + saveFileName;
			
			String reg_id = request.getParameter("reg_id");
			
			log.info("reg_id :" + reg_id);
			log.info("ext :" + ext);
			log.info("saveFileName :" + saveFileName);
			log.info("saveFilePath :" + saveFilePath);
			log.info("ocr_text :" + fullFileInfo);
			log.info("originalFileName :" + originalFileName);
			
			

			mf.transferTo(new File(fullFileInfo));

			OcrDTO pDTO = new OcrDTO();
			pDTO.setFileName(saveFileName);
			pDTO.setFilePath(saveFilePath);
			

			OcrDTO rDTO = ocrService.getReadforImageText(pDTO);

			if (rDTO == null) {
				rDTO = new OcrDTO();
			}

			res = CmmUtil.nvl(rDTO.getTextFromImage());
			pDTO.setSave_file_name(saveFileName);
			pDTO.setSave_file_path(saveFilePath);
			pDTO.setOrg_file_name(originalFileName);
			pDTO.setExt(ext);
			pDTO.setOcr_text(res);
			pDTO.setReg_id(reg_id);
			
			int result =0;
			
			result = ocrService.getOcrData(pDTO);
			
			if(result>0) {
				log.info("DB에 값이 들어갔습니다.");
			}else {
				log.info("DB에 값이 X");
			}

			rDTO = null;
			

		} else {
			res = "이미지 파일이 아니라서 인식이 불가능 합니다.";
		}

		model.addAttribute("res", res);

		log.info(this.getClass().getName() + ".getReadforImageText end!");

		return "/ocr/TextFromImage";
	}
}
