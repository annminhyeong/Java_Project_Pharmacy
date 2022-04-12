package poly.service;

import poly.dto.OcrDTO;

public interface IOcrService {
	OcrDTO getReadforImageText(OcrDTO pDTO) throws Exception;
	
	int getOcrData(OcrDTO pDTO) throws Exception;
}
