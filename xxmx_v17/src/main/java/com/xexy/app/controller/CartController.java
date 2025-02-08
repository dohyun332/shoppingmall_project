package com.xexy.app.controller;

import com.xexy.app.domain.AddressDto;
import com.xexy.app.domain.CartProductDto;
import com.xexy.app.service.CartProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class CartController {
    @Autowired
    CartProductService cartProductService;

//   메인, 상세페이지에서 장바구니 접속2
    @RequestMapping("/cart")
    public String cart(HttpSession session, Model m) {

        String id = (String) session.getAttribute("id");
        if(id == null || id.equals("null")) {
            return "redirect:/login/login";
        }
        // deletepd=상품번호만 넘어올때 개별삭제
        // insert=상품번호, 수량, 사이즈 넘어올때 ok
        // modifysize=상품번호, 사이즈만 넘어올때
        // modifycount=상품번호, 수량만 넘어올때
        // deleteid=아이디만 넘어올때 전체삭제 ok
//        String url = String.valueOf(request.getRequestURL());
//        System.out.println("url:" + url);

        System.out.println("---------------------장바구니DB---------------------");
        List<CartProductDto> cartAll = cartProductService.cartAll(id);
        m.addAttribute("cartAll", cartAll);


        return "cart";
    }
    @GetMapping("/cartAdd")
    @ResponseBody
    public String cartAdd(HttpSession session, String p_serialNo, int[] p_choiceQuantity, String[] p_choiceSize) {
        String id = (String) session.getAttribute("id");
        if(id == null || id.equals("null")) {
            return "id";
        }
        System.out.println("================CartAdd 진입!==============");
//        for(int i:p_choiceQuantity) {
//            System.out.println(i);
//        }
//        for(String s:p_choiceSize) {
//            System.out.println(s);
//        }

        String serialNo = p_serialNo;
        try {
            if(p_choiceQuantity != null) {
                int arr_cnt = p_choiceQuantity.length;
                for(int i=0; i<arr_cnt; i++) {
                    int choiceQuantity = p_choiceQuantity[i];
                    String choiceSize = p_choiceSize[i];
                    System.out.println("choiceQuantity : " + choiceQuantity + "choiceSize : " + choiceSize);

                    CartProductDto cartProductDto = new CartProductDto(id, serialNo, choiceQuantity, choiceSize);

                    if(cartProductService.cartOne(cartProductDto) != null) {
                        if(cartProductService.countAdd(cartProductDto)!=1) {
                            throw new Exception("update failed");
                        }
                    } else {
                        if(cartProductService.cartAdd(cartProductDto)!=1) {
                            throw new Exception("insert failed");
                        }
                    }
                }
                return "ok";
            }
        } catch (Exception e) {
            e.printStackTrace();

            return "fail";
        }
        return "fail";
    }


//    장바구니 전체삭제
    @PostMapping("/cartDeleteAll")
    public String cartAlldel(HttpSession session) {
        String id = (String)session.getAttribute("id");
        cartProductService.deleteAll(id);
        return "redirect:/product/cart";
    }
// 장바구니 개별삭제
    @PostMapping("/cartDeletePart")
    public String cartDel(HttpSession session, int[] chk) {
        String id = (String)session.getAttribute("id");
        if(chk != null) {
            for(int ch:chk) {
                Map map = new HashMap();
                map.put("id", id);
                map.put("cartNo", ch);
                cartProductService.deleteOne(map);
            }
        }
        return "redirect:/product/cart";
    }

//    장바구니 사이즈, 수량 변경
    @PostMapping("/cartChg")
    public String cartChg(HttpSession session, int[] chk, String[] c_choiceSize, int[] c_choiceQuantity, int[] c_cartNo) {
        String id = (String) session.getAttribute("id");

        if(chk != null) {
            int p_cartNo = chk[0];
            CartProductDto cartProductDto = cartProductService.cartGetPk(p_cartNo);
            String originSize = cartProductDto.getP_choiceSize();
            String p_serialNo = cartProductDto.getP_serialNo();
            int originQuantity = cartProductDto.getP_choiceQuantity();

            int row = 0;
            for(int i=0; i<c_cartNo.length; i++) {
                if(p_cartNo == c_cartNo[i]) { row = i; }
            }
            String p_choiceSize = c_choiceSize[row];
            int p_choiceQuantity = c_choiceQuantity[row];

            CartProductDto cpd1 = new CartProductDto(id, p_serialNo, p_choiceSize);
            CartProductDto cpd2 = new CartProductDto(p_cartNo, id, p_serialNo, p_choiceQuantity, p_choiceSize);
            // 사이즈 수정 시
            if(!originSize.equals(p_choiceSize)) {
                if(cartProductService.cartOne(cpd1) != null) {
                    // 수정하려는 사이즈와  동일 상품/사이즈가 있으면 수정전 상품지우고 동일 상품/사이즈 수량 증가
                    Map map = new HashMap();
                    map.put("id", id);
                    map.put("cartNo", p_cartNo);
                    cartProductService.deleteOne(map);
                    cartProductService.countAdd(cpd2);
                } else {
                    // 수정 시 동일상품의 동일 사이즈가 없으면 사이즈, 수량 변경
                    Map map = new HashMap();
                    map.put("id", id);
                    map.put("cartNo", p_cartNo);
                    cartProductService.sizeChg(cpd2);
//                    cartProductService.deleteOne(map);
//                    cartProductService.cartAdd(cpd2);
                }
            } else if(originQuantity != p_choiceQuantity){
                // 수량만 수정 시
                cartProductService.countChg(cpd2);
            }

        }

        return "redirect:/product/cart";
    }

    @GetMapping("/test")
    public String test(AddressDto addressDto) {
        return "test";
    }

}
