package poly.service.impl;

import java.util.Iterator;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import poly.dto.FoodDTO;

import poly.persistance.mapper.IFoodMapper;
import poly.service.IFoodService;
import poly.util.CmmUtil;
import poly.util.DateUtill;

@Service("FoodServie")
public  class FoodService implements IFoodService{

	@Resource(name = "FoodMapper")
	private IFoodMapper foodMapper;

	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public int getMovieInfoFromWEB() throws Exception {
		log.info(this.getClass().getName() + "getfoodInfoFromWEB start");

		int res = 0;
		String url = "http://www.kopo.ac.kr/kangseo/content.do?menu=262";

		Document doc = null;

		doc = Jsoup.connect(url).get();

		Elements element = doc.select("table.tbl_table.menu");
		  
		Iterator<Element> day =element.select("tbody tr td:nth-child(1)").iterator();
		Iterator<Element> food_nm =element.select("tbody tr td:nth-child(3)").iterator();
		
		
		FoodDTO pDTO = null; 
		
		for(int i=0; i<5; i++) {
			pDTO = new FoodDTO();
			
			pDTO.setCollect_time(DateUtill.getDateTime("yyyyMMdd24hmmss"));
			
			String date = CmmUtil.nvl(day.next().text()).trim();
			
			pDTO.setDay(CmmUtil.nvl(date.substring(date.length()-3,date.length())));
			
			pDTO.setFood_nm(CmmUtil.nvl(food_nm.next().text()).trim());
			
			pDTO.setReg_id("admin");
			
			res += foodMapper.InsertFoodInfo(pDTO);
		
		}
		log.info(this.getClass().getName() + "getMovieInfoFromWEB end!");
		return res;

	}
}
