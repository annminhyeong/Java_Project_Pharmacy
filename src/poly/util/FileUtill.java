package poly.util;

import java.io.File;

public class FileUtill {
	
	
	
	public static String mkdirForData(String uploadDir) {
		
		String path = uploadDir + DateUtill.getDateTime("/yyyy/MM/dd");
		
		File Folder = new File(path);
		
		if(!Folder.exists()) {
			Folder.mkdirs();
		}
		
		
		return path;
	}
}
