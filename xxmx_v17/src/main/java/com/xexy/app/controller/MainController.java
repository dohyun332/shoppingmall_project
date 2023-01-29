package com.xexy.app.controller;

import com.xexy.app.domain.MainProductDto;
import com.xexy.app.service.MainProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {

	@Autowired
	MainProductService mainProductService;

	@RequestMapping ("/")
	public String main(Model m) {
//		전체 베스트10
		List<MainProductDto> listAll = mainProductService.allBest10();
		m.addAttribute("listAll", listAll);

//		카테고리별 베스트10(맨, 우먼, 골프, 키즈)
		List<MainProductDto> listCateBM = mainProductService.cateBest10("M");
		m.addAttribute("listBM", listCateBM);
		List<MainProductDto> listCateBW = mainProductService.cateBest10("W");
		m.addAttribute("listBW", listCateBW);
		List<MainProductDto> listCateBG = mainProductService.cateBest10("G");
		m.addAttribute("listBG", listCateBG);
		List<MainProductDto> listCateBK = mainProductService.cateBest10("K");
		m.addAttribute("listBK", listCateBK);

//		실시간 급상승 14개(조회수순)
		List<MainProductDto> listHitsUp = mainProductService.hitsUP();
		m.addAttribute("listHitsUp", listHitsUp);


//		카테고리별 최신 8개상품
		List<MainProductDto> listcateM = mainProductService.category("M");
		m.addAttribute("listM", listcateM);
//		for(MainProductDto mpd:listcateM) {
//			System.out.println(mpd);
//		}

		List<MainProductDto> listcateW = mainProductService.category("W");
		m.addAttribute("listW", listcateW);
		List<MainProductDto> listcateG = mainProductService.category("G");
		m.addAttribute("listG", listcateG);
		List<MainProductDto> listcateK = mainProductService.category("K");
		m.addAttribute("listK", listcateK);

		return "index";
	}
}
