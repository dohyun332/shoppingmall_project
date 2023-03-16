package com.xexy.app.controller;

import com.xexy.app.domain.MemberDto;
import com.xexy.app.service.MemberService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.regex.Pattern;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;



    @GetMapping("/login/join")
    public String joinForm() {
        return "join";
    }

    @PostMapping("/login/join")
    public String joinProc(MemberDto memberDto, Model m, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
//        memberDto.setM_birthday();
        memberDto.setM_cell(memberDto.getPhone1() + "-" + memberDto.getPhone2() + "-" + memberDto.getPhone3());
        memberDto.setM_email(memberDto.getEmail_id() + "@" + memberDto.getEmail_domain());
        memberDto.setM_birthday(memberDto.getM_year() + "-" + memberDto.getM_month() + "-" + memberDto.getM_day());


        System.out.println(memberDto);
        String m_email = memberDto.getM_email();
        String m_id = memberDto.getM_id();
        if (emailCheck(m_email) == true && idCheck(m_id) == true ) {

            if ( RegexDate(memberDto) == true) {
                memberService.memberJoin(memberDto);

                return "redirect:/";
            }
        }
        String msg = "아이디 또는 비밀번호를 규칙에 맞게 입력해주세요";
        msg = URLEncoder.encode(msg, "UTF-8");
        rttr.addFlashAttribute("memberDto", memberDto);
        return "redirect:/login/join?msg=" + msg;

//        String referer = request.getHeader("Referer");
//        System.out.println(referer);
//        m.addAttribute("msg", msg);
//        return "redirect:" + referer;

    }


    /*아이디 중복 검사*/
    @ResponseBody
    @PostMapping("/idCheck")
    private boolean idCheck(String m_id) throws Exception {

        int idRst = memberService.memberIdChk(m_id);
        if (idRst != 0 ||!Pattern.matches("^[a-z0-9]{4,16}$", m_id)) {return false;
        }

        return true;
    }

    /*이메일 중복 검사*/
    @ResponseBody
    @PostMapping("/emailCheck")
    private boolean emailCheck(String m_email) throws Exception {


        int emailRst = memberService.memberEmailChk(m_email);
        int idx = m_email.indexOf("@");
        String mailChk=m_email.substring(0,idx).trim();
        String mailDomain=m_email.substring(idx+1).trim();
        String patter_domain="[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";
        boolean mailDomainChk=Pattern.matches(patter_domain,mailDomain);
        if (emailRst != 0 || ("").equals(mailChk)|| mailDomainChk==false) {
            return false;
        }

        return true;
    }

    /* validation */
    private boolean RegexDate(MemberDto memberDto) throws Exception {

        String patter_id = "^[a-z0-9]{4,16}$"; //영문숫자
        String patter_pw = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"; //영문, 숫자 특수문자 포함
        String patter_name= "^[가-힣]{2,5}$";//한글 입력
        String patter_number="^[0-9]{5,6}$";
        String patter_phone2="^[0-9]{3,4}$";
        String patter_phone3="^[0-9]{4}$";
        String patter_domain="[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";

        if (!Pattern.matches(patter_id, memberDto.getM_id())) {return false;}
        else if (!Pattern.matches(patter_pw,memberDto.getM_pw())){return false;}
        else if (!Pattern.matches(patter_name,memberDto.getM_name())){return false;}
        else if (!Pattern.matches(patter_number,memberDto.getM_zipCode())){return false;}
        else if (("").equals(memberDto.getM_addr1().trim())){return false;}
        else if (("").equals(memberDto.getM_addr2().trim())){return false;}
        else if (!Pattern.matches(patter_phone2,memberDto.getPhone2())){return false;}
        else if (!Pattern.matches(patter_phone3,memberDto.getPhone3())){return false;}
        else if (!Pattern.matches(patter_domain,memberDto.getEmail_domain())){return false;}
        else if (memberDto.getM_gender()==0){return false;}
        else if (("년").equals(memberDto.getM_year())){return false;}
        else if (("월").equals(memberDto.getM_year())){return false;}
        else if (("일").equals(memberDto.getM_year())){return false;}

        return true;
    }

    /* 로그인 폼 */
    @GetMapping("/login/login")
    private String loginForm(){return "login";}


    /*로그인 Proc*/
    @PostMapping("/login/login")
    private String login(MemberDto memberDto, HttpServletRequest request, HttpServletResponse response) throws Exception {
        /*변수 설정*/
        String id = memberDto.getM_id();
        String pw = memberDto.getM_pw();

        boolean rememberId = memberDto.isRememberId();
        /*로그인 유효성 검사*/
        if(!loginChk(id,pw)) {
            String msg = URLEncoder.encode("일치하는 정보가 없습니다.", "utf-8");
            return "redirect:/login/login?msg="+msg;
        }
        memberService.login(id);
        memberService.lastLogin(id);
        /*로그인 세션 설정*/
        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        /*쿠키 설정*/
        Cookie cookie = new Cookie("id",id);
        if(!rememberId) {
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie);
        System.out.println("cookie = " + cookie);
        /*요청 온 페이지로 반환*/
        String toURL = String.valueOf(session.getAttribute("toURL"));
        System.out.println(toURL);

        toURL = toURL==null || toURL=="null" || toURL.equals("")?"/":toURL;
        System.out.println(toURL);

        return "redirect:"+toURL;



    }

    /*로그아웃*/
    @GetMapping("/login/logout")
    private String logout(HttpSession session) {
        // 1. 세션 종료
        session.invalidate();
        // 2. 메인화면으로 이동
        return "redirect:/";
    }
    /*로그인 유효성 검사*/
    private boolean loginChk(String m_id,String pw) throws Exception {
        MemberDto memberDto = memberService.login(m_id);
        boolean isValidPassword = false;


        if (memberDto==null) {return  false;}
        if (memberDto != null) {
            isValidPassword = BCrypt.checkpw(pw, memberDto.getM_pw());
        }
        return isValidPassword;
    }
}
