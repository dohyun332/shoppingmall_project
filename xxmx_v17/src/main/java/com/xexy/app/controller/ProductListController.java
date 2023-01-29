package com.xexy.app.controller;

import com.xexy.app.domain.MainProductDto;
import com.xexy.app.domain.ProductListDto;
import com.xexy.app.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
@RequestMapping("/product")
public class ProductListController {
    @Autowired
    ProductListService productListService;

    @GetMapping("/productList")
    public String productList(String cate, Model m) {
        if (cate.equals("1")) {
            Map map = new HashMap();
            map.put("order1", "p_saleDate");
            map.put("order2", " desc");

//            System.out.println("map1: " + map);

            List<ProductListDto> list = productListService.categoryPlus(map);

//            for (ProductListDto pd : list) {
//                System.out.println(pd);
//            }
            int product_cnt = list.size();
            m.addAttribute("list", list);
            m.addAttribute("product_cnt", product_cnt);

            return "productList";

        }
// 아울렛 상품정렬
        else if (cate.equals("O")) {
            Map map = new HashMap();
            map.put("order1", "p_saleDate");
            map.put("order2", "desc");
            System.out.println("map1: " + map);

            List<ProductListDto> list = productListService.categoryOut(map);

            System.out.println("아울렛 상품정렬 실행");

//            for (ProductListDto pd : list) {
//                System.out.println(pd);
//
//            }
            int product_cnt = list.size();
            m.addAttribute("list", list);
            m.addAttribute("product_cnt", product_cnt);

            return "productList";

        }

        List<ProductListDto> list = productListService.category(cate);
//        for(ProductListDto pld:list) {
//            System.out.println(pld);
//        }

        int product_cnt = list.size();
        m.addAttribute("list", list);
        m.addAttribute("product_cnt", product_cnt);

        return "productList";
    }

    @GetMapping("/productListSort")
    public String productListSort(String sort, String cate, Model m) {
        System.out.println("sort = " + sort);
        System.out.println("cate =" + cate);
        List<ProductListDto> list = new ArrayList<ProductListDto>();

        if (cate.equals("1")) {
            if (sort.equals("new")) {
                Map map = new HashMap();
                map.put("order1", "p_saleDate");
                map.put("order2", " desc");
                list = productListService.categoryPlus(map);
            } else if (sort.equals("sale")) {
                Map map = new HashMap();
                map.put("order1", "p_saleCount");
                map.put("order2", " desc");
                list = productListService.categoryPlus(map);
            } else if (sort.equals("low")) {
                Map map = new HashMap();
                map.put("order1", "p_price");
                map.put("order2", " asc");
                list = productListService.categoryPlus(map);
            } else if (sort.equals("high")) {
                Map map = new HashMap();
                map.put("order1", "p_price");
                map.put("order2", " desc");
                list = productListService.categoryPlus(map);
            }
            int product_cnt = list.size();
            m.addAttribute("list", list);
            m.addAttribute("product_cnt", product_cnt);

            return "productList";
        }

            if (cate.equals("O")) {
                if (sort.equals("new")) {
                    Map map = new HashMap();
                    map.put("order1", "p_saleDate");
                    map.put("order2", " desc");
                    list = productListService.categoryOut(map);
                } else if (sort.equals("sale")) {
                    Map map = new HashMap();
                    map.put("order1", "p_saleCount");
                    map.put("order2", " desc");
                    list = productListService.categoryOut(map);
                } else if (sort.equals("low")) {
                    Map map = new HashMap();
                    map.put("order1", "p_price");
                    map.put("order2", " asc");
                    list = productListService.categoryOut(map);
                } else if (sort.equals("high")) {
                    Map map = new HashMap();
                    map.put("order1", "p_price");
                    map.put("order2", " desc");
                    list = productListService.categoryOut(map);
                }
                int product_cnt = list.size();
                m.addAttribute("list", list);
                m.addAttribute("product_cnt", product_cnt);

                return "productList";
            }

                if (sort.equals("new")) {
                    list = productListService.category(cate);
                } else if (sort.equals("sale")) {
                    list = productListService.categorySale(cate);
                } else if (sort.equals("low")) {
                    list = productListService.categoryPrice(cate);
                } else if (sort.equals("high")) {
                    list = productListService.categoryPriceDesc(cate);
                }
                for (ProductListDto pld : list) {
                    System.out.println(pld);
                }
                int product_cnt = list.size();
                m.addAttribute("list", list);
                m.addAttribute("product_cnt", product_cnt);

                return "productList";
            }
}