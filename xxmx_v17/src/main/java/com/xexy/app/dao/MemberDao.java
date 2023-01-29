package com.xexy.app.dao;


import com.xexy.app.domain.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDao {
    @Autowired
    private SqlSession session;

    private static String namespace = "com.xexy.app.dao.MemberMapper.";

    /* 회원가입 */
    public int memberJoin(MemberDto dto) throws Exception {
        return session.insert(namespace+"join", dto);
    }

    /*로그인 (아이디,비밀번호) 체크 */
    public MemberDto login(String id) throws Exception{
        return session.selectOne(namespace+"login",id);

    }

    /*아이디중복검사*/
    public int memberIdChk(String m_id) throws Exception{
        return session.selectOne(namespace+"idChk", m_id);

    }
    /*이메일 중복검사*/
    public int memberEmailChk(String m_email) throws Exception{
        return  session.selectOne(namespace+"emailChk", m_email);
    }
    public int lastLogin(String m_id) throws Exception{
        return session.update(namespace+"lastLogin", m_id);
    }







//
//    /*회원 전체목록 보기*/
//    public List<MemberDto> selectAll() throws Exception {
//        return session.selectList(namespace + "selectAll");
//    }
//      *//*회원정보보기*//*
//    public MemberDto viewInformation(String id) throws Exception{
//        return session.selectOne(namespace+"viewInformation", id);
//    }
//    *//* 회원정보수정*//*
//    public int updateMember(MemberDto dto) throws  Exception{
//        return session.insert("namespace"+"update",dto);
//    }
//
}
