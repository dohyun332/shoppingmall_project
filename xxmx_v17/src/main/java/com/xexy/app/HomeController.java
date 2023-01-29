package com.xexy.app;

import com.xexy.app.domain.MainProductDto;
import com.xexy.app.service.MainProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
//	@Autowired
//	MainProductService mainProductService;
//
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		List<MainProductDto> list = mainProductService.allBest10();
//		for(MainProductDto mpd:list) {
//			System.out.println(mpd);
//		}
//		model.addAttribute("list", list);
//		return "index";
//	}
//
}
