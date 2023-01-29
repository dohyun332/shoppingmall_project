package com.xexy.app.controller;


import com.xexy.app.domain.ProductDetailDto;
import com.xexy.app.service.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductDetailController {
    @Autowired
    ProductDetailService productDetailService;
        /* 게시글 읽기 */
    @GetMapping("/productDetail")
    public String read(String p_serialNo, Model m) throws Exception {
        System.out.println("상세페이지 진입!!");
       List<ProductDetailDto> product= productDetailService.productDetail(p_serialNo);
       for(ProductDetailDto pd:product) {
           System.out.println(pd);
       }
/*        List<ProductDetailDto> detailImgs = productDetailService.productDetailImg(p_serialNo);
        String thumbnailImg = productDetailService.productDetailThumbnail(p_serialNo);*/
        productDetailService.increaseViewCnt(p_serialNo);

        m.addAttribute("product",product);
       /* m.addAttribute("thumbnailImg",thumbnailImg);
        m.addAttribute("detailImg",detailImgs);*/

        System.out.println(product);



            return "productDetail";
    }

}
