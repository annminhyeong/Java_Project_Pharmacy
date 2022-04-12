package poly.util;

public class EncryptTest {
	
	public static void main(String[] args)throws Exception {
		System.out.println("-----------------------------");
		System.out.println("해시 암호화 알고리즘");
		
		String str ="암호화할 문자";
		
		String hashEnc = EncryptUtill.encHashSHA256(str);
		
		System.out.println("hashEnc : "+ hashEnc);
		System.out.println("-----------------------------");
		System.out.println("AES128-CBC 암,복호화알고리즘");
		String enc = EncryptUtill.encAES128CBC(str);
		
		System.out.println("enc:" +enc);
		
		String dec = EncryptUtill.decAES128CBC(enc);
		
		System.out.println("dec:" +dec);
		
		System.out.println("-----------------------------");
	}
}
