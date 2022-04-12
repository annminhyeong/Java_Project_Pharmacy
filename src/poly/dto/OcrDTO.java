package poly.dto;

public class OcrDTO {
	private String filePath;//
	private String fileName;//
	private String textFromImage;//
	private String save_file_name;//
	private String save_file_path;//
	private String ext;
	private String ocr_text; //
	private String org_file_name;
	private String reg_id;
	
	
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getTextFromImage() {
		return textFromImage;
	}
	public void setTextFromImage(String textFromImage) {
		this.textFromImage = textFromImage;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public String getSave_file_path() {
		return save_file_path;
	}
	public void setSave_file_path(String save_file_path) {
		this.save_file_path = save_file_path;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getOcr_text() {
		return ocr_text;
	}
	public void setOcr_text(String ocr_text) {
		this.ocr_text = ocr_text;
	}
	
	

}
