package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.NlpDTO;
import poly.persistance.mapper.INlpMapper;
import poly.service.INlpService;
import poly.util.CmmUtil;
import poly.util.StringUtil;


@Service("NlpService")
public class NlpService implements INlpService {
	
	@Resource(name="NlpMapper")
	private INlpMapper nlpmapper;
	
	
	private Logger log = Logger.getLogger(this.getClass());
	
	private Map<String ,List<NlpDTO>> NLP_DIC = new HashMap<String, List<NlpDTO>>();
	
	
	
	@Override
	@PostConstruct
	public void getWord() throws Exception {
		
		log.info(this.getClass().getName()+".getWord start");
		
		NlpDTO pDTO = new NlpDTO();
		
		List<NlpDTO> rList = null;
		
		//ㄱ실행
		pDTO.setWord("ㄱ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄱ", rList);
		//실행끝
		
		//ㄴ실행
		pDTO.setWord("ㄴ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄴ", rList);
		//실행끝
		
		//ㄷ실행
		pDTO.setWord("ㄷ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄷ", rList);
		//실행끝
		
		//ㄹ실행
		pDTO.setWord("ㄹ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄹ", rList);
		//실행끝
		
		
		//ㅁ실행
		pDTO.setWord("ㅁ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅁ", rList);
		//실행끝
		
		//ㅂ실행
		pDTO.setWord("ㅂ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅂ", rList);
		//실행끝
		
		//ㅅ실행
		pDTO.setWord("ㅅ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅅ", rList);
		//실행끝
		
		
		//ㅇ실행
		pDTO.setWord("ㅇ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅇ", rList);
		//실행끝
		
		//ㅈ실행
		pDTO.setWord("ㅈ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅈ", rList);
		//실행끝
		
		//ㅊ실행
		pDTO.setWord("ㅊ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅊ", rList);
		//실행끝
		
		//ㅋ실행
		pDTO.setWord("ㅋ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅋ", rList);
		//실행끝
		
		//ㅌ실행
		pDTO.setWord("ㅌ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅌ", rList);
		//실행끝
		
		//ㅍ실행
		pDTO.setWord("ㅍ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅍ", rList);
		//실행끝
		
		//ㅎ실행
		pDTO.setWord("ㅎ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅎ", rList);
		//실행끝
		
		//ㄲ실행
		pDTO.setWord("ㄲ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄲ", rList);
		//실행끝
		
		//ㄸ실행
		pDTO.setWord("ㄸ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㄸ", rList);
		//실행끝
		
		//ㅃ실행
		pDTO.setWord("ㅃ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅃ", rList);
		//실행끝
		
		//ㅆ실행
		pDTO.setWord("ㅆ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅆ", rList);
		//실행끝
		
		//ㅉ실행
		pDTO.setWord("ㅉ");
		rList = nlpmapper.getWord(pDTO);
		
		if(rList == null) {
			rList = new ArrayList<NlpDTO>();
		}
		
		NLP_DIC.put("ㅉ", rList);
		//실행끝
		
		log.info(this.getClass().getName()+"getWord End!");
		
	
	}

	@Override
	public int preProcessWordAnalysisForMind(NlpDTO pDTO) throws Exception {
		log.info(this.getClass().getName()+".preProcessWordAnalysisForMind start");
		
		int res=0;
		String text = CmmUtil.nvl(pDTO.getWord()).replace("[^\\uAC00-\\uD7A3xfe0-9a-zA-Z\\\\s]"," ");
		
		text = text.replaceAll("\\s{2,}", " ");
		
		log.info("text:" + text);
		
		String [] textArr = text.split(" ");
		
		log.info("textArr.length: "+ textArr.length);
		

		int maxCnt = textArr.length;
		log.info("maxCnt : " + maxCnt);
		
		for(int i = 0 ; i < maxCnt ; i++) {
			String firstWord2 = textArr[i].substring(0,1);
			String text2 = "";
			log.info("firstWord2:"+firstWord2);
			log.info("text2:"+text2);
			if(i == maxCnt - 2) {
				text2 = textArr[i] + " " + textArr[i + 1];
			}else if(i == maxCnt -1) {
				text2 = textArr[i];
			}else {
				text2 = textArr[i] + " " + textArr[i + 1] + " " + textArr[i + 2];
			}
			res += WordAnalysisForMind(firstWord2, text2);
		}
		
		log.info("Res:"+res);
		log.info(this.getClass().getName()+".preProcessWordAnalysisForMind End!");
		
		return res;
	}

	@Override
	public int WordAnalysisForMind(String firstWord, String text) throws Exception {
		
		int res =0;
		
		log.info("firstWord:"+ firstWord);
		log.info("text:"+ text);
		
		String dicType = StringUtil.getFirstWord(firstWord);
		log.info("DIC type:"+ dicType);
		
		if(dicType.length()>0) {
			List<NlpDTO> rList = NLP_DIC.get(StringUtil.getFirstWord(firstWord));
			
			if(rList== null) {
				rList = new ArrayList<NlpDTO>();
			}
			
			Iterator<NlpDTO> it = rList.iterator();
			
			while(it.hasNext()) {
				NlpDTO rDTO = it.next();
				
				
				if(rDTO == null) {
					rDTO = new NlpDTO();
				}
				
				if(text.indexOf(CmmUtil.nvl(rDTO.getWord()))> -1){
					log.info("DIC-word:"+ CmmUtil.nvl(rDTO.getWord()));
					log.info("DIC-word getPolarity:"+ CmmUtil.nvl(rDTO.getPolarity()));
					log.info("text:"+ text);
					res += Integer.parseInt(CmmUtil.nvl(rDTO.getPolarity(),"0"));
					
					break;
				}
				
			
			}
		}
		return res;
	}
	
}
