package com.xexy.app.service;

import com.xexy.app.dao.MemberDao;
import com.xexy.app.domain.MemberDto;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    MemberDao memberDao;

    public int memberJoin(MemberDto memberDto) throws Exception {
        memberDto.setM_pw(BCrypt.hashpw(memberDto.getM_pw(), BCrypt.gensalt()));
        return memberDao.memberJoin(memberDto);
    }
    public MemberDto login(String id) throws Exception{
        return memberDao.login(id);
    }
    public int memberIdChk(String m_id) throws Exception{
        return memberDao.memberIdChk(m_id);
    }
    public int memberEmailChk(String m_email) throws Exception{
        return memberDao.memberEmailChk(m_email);
    }
    public int lastLogin(String m_id) throws Exception{
        return memberDao.lastLogin(m_id);
    }

}
